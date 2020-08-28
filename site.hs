--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import           Hakyll.Web.Sass (sassCompiler)
{-|
import qualified Data.ByteString.Lazy as B
import           Data.Word (Word16)
import           Data.ByteString.Builder
import           Data.Bits

import Debug.Trace
-}
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

    match ".gitignore" $ do
        route idRoute
        compile copyFileCompiler
        
    match "templates/**" $ compile templateCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

{-|
-- | Compiler form of 'stripExif'
stripExifCompiler :: Compiler (Item B.ByteString)
stripExifCompiler = fmap stripExif <$> getResourceLBS


--------------------------------------------------------------------------------
-- | Strip exif data so you don't leak important information on the web.
stripExif :: B.ByteString -> B.ByteString
stripExif bs
    | B.length bs < 2  = bs
    | otherwise        = case word16be x of
        0xffd8 -> toLazyByteString $ mconcat [lazyByteString x, parseAppDataSection xs]
        _      -> bs
  where (x, xs) = B.splitAt 2 bs

parseAppDataSection :: B.ByteString -> Builder
parseAppDataSection bs
    | B.length bs < 4 = lazyByteString bs
    | otherwise       = case marker' of
        0xffe1  -> mconcat [stripExifFromApp1 pre, lazyByteString post] -- APP1 section (exif) - skip
        0xffda  -> lazyByteString bs   -- End of App Data sections - return the rest
        _       -> mconcat [lazyByteString pre, parseAppDataSection post] -- Write the rest
  where (x, xs)   = B.splitAt 2 bs
        (x', xs') = B.splitAt 2 xs
        (pre, post) = B.splitAt (fromIntegral datasize') bs
        marker = word16be x
        datasize = word16be x'
        marker' = trace ("marker is: " ++ show marker) marker
        datasize' = trace ("datasize is: " ++ show datasize) datasize

stripExifFromApp1 :: B.ByteString -> Builder
stripExifFromApp1


-- from Data.Binary.Get
word16be :: B.ByteString -> Word16
word16be s = (fromIntegral (s `B.index` 0) `shiftl_w16` 8) .|.
    fromIntegral (s `B.index` 1)

shiftl_w16 :: Word16 -> Int -> Word16
shiftl_w16 = shiftL
-}
