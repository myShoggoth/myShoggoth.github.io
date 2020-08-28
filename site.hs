--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import           Hakyll.Web.Sass (sassCompiler)
--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "assets/img/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "assets/sass/now-ui-kit.scss" $ do
        route   $ constRoute "assets/css/now-ui-kit.css"
        let compressCssItem = fmap compressCss
        compile (compressCssItem <$> sassCompiler)

    match "assets/css/**.css" $ do
        route   idRoute
        compile compressCssCompiler

    match "assets/js/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "assets/fonts/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "posts/*.markdown" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/page.html" postCtx
            >>= relativizeUrls

    match "posts/*.html" $ do
        route idRoute
        compile $ getResourceBody
            >>= loadAndApplyTemplate "templates/post.html" postCtx
            >>= loadAndApplyTemplate "templates/page.html" postCtx
            >>= relativizeUrls

    match "projects/*.markdown" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html" postCtx
            >>= loadAndApplyTemplate "templates/page.html" postCtx
            >>= relativizeUrls

    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- fmap (take 10) . recentFirst =<< loadAll "posts/*"
            projects <- fmap (take 10) . recentFirst =<< loadAll "projects/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    listField "projects" postCtx (return projects) `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/page.html" indexCtx
                >>= relativizeUrls

    match "CNAME" $ do
        route idRoute
        compile copyFileCompiler

    match "gitignore" $ do
        route dotFileRoute
        compile copyFileCompiler
        
    match "templates/**" $ compile templateCompiler


--------------------------------------------------------------------------------
dotFileRoute :: Routes
dotFileRoute = customRoute $
    ('.' :) . toFilePath

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext
