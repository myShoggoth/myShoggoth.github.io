---
title: Communication and Ownership
description: Musings on coordination of product team members.
imgname: DSC_0323
---

I've been thinking about how software is built, and why small nimble teams seem to outperform massive teams on a regular basis, both in terms of getting interesting products to market and mind-share.  You would think that a bigger company with more resources, more stability for its employees, and significant infrastructure should be able to move faster, but it is taken for granted in the industry now that that isn't the case.

I believe it comes down to two core issues which have huge effects by themselves and also interact with each other to amplify those effects: Communication, and Ownership.

## Communication

Software development is all about effective and efficient communication.  The requirements needs to be created, turned into a product design which then needs to turn into technical design, that needs to be turned into code and tests, the results of the tests and other usage are turned into bugs which are then triaged, investigated, and resolved.  One the appropriate level of quality is achieved, the product is shipped.

### A Team of One

In a team of one, there is no communication overhead.  That one person determines what problems the product will solve, how to solve them, how to implement that solution, tests it themselves, and fixes problems that meet their own quality requirements.  When she feels satisfied that everything is good to go, she releases the product via whatever channel is appropriate, gathers user feedback and fixes issues, releases updates, etc.   In the case where she is also the only user, she can determine precisely what is worth fixing and how fast that needs to happen, and act on that.

In that degenerate case, there can be no miscommunication or misunderstanding... well, unless there is some sort of multiple personality disorder thing going on.

If you get beyond that, the cost of communication is now added.  The other extreme is an everything-by-committee situation:

### Everything By Committee

A large marketing team goes out and gathers customer requirements for a potential product.  They gather their results, negotiate with upper management, go back and forth many times to make sure everyone is in agreement.  There is a VP review, where the busy executive who in theory was being kept up to date on everything going on throws everyone a curve ball, because in fact he had not been keeping up to date on anything.  He's very busy, can't read every email, is scheduled 10-12 hours a day in meetings and doesn't have time in the day to prepare for them (unless they're with management higher up the food chain than him, of course), so the entire proposal is actually brand new.

Yes, I could go on a rant about executive reviews and their cost alone, but I won't.

You can see where that's going, let's skip ahead.  Specs are created, and now they need to be reviewed by assorted management, every other PM on the team, every tester, every developer.  In this spec review, the way to make the time worthwhile is to try to differentiate yourself from your peers by explaining, mostly, why none of it will work.  Due to miscommunication and misunderstanding, the spec itself will never fully address the product requirements (which never fully address the real customer problems), and will fall short in some places and add extraneous stuff in others, and only a few of these issues will actually be found during review.

Some developer is assigned to implement the spec, so they create a technical design, and... have to get it reviewed by every PM, tester, and developer on the team.  See above.  The technical design will naturally not implement the spec exactly, it will fall short in some places and go beyond the scope in others.  Some of those issues will be found in review.

The tester takes the spec (and technical design) and creates a test plan, but again the communication overhead means it will get farther away from testing for what should have been the product requirements in the first place.

The rest is left as an exercise for the reader, but the main point I'm making is that the more communication that has to happen at each step of the process, the more miscommunication and misunderstanding will warp the product.  This is the classic game of telephone, where a simple message at the beginning of the line gets warped beyond recognition by the time it reaches the end.

When considering team structure, processes, tools, policies, etc. the overriding concern should be the total team communication overhead.

I can readily tell when a team has major communication issues but doesn't know how to solve it, and they often work hard to make it worse.  Any time I see a team declaring parts of the day or certain days of the week for No Meetings,  I know they're getting totally bogged down in over communication.

When people reflexively add more process (forms, Excel spreadsheets, approval processes, etc.) because of misunderstandings or miscommunications that caused major issues in the past, and what they're actually doing is making the whole thing worse by adding to the problem that caused the issues.

My theory on why Pair Programming seems to work so well (when it does): because it simplifies the communication structure for that part of the team.  You rarely have Pair Programmers who constantly need to check in with other parts of a larger team, they are a self contained unit and the point of it is to have them there to double check each other, so everyone else leaves them alone.  It isn't that it is ideal, it is that by creating an accepted pattern with a relatively low communication overhead cost all the more expensive and hazardous models are avoided.

So it comes down to this:  Pick the team size, structure, tools, processes, and policies that are the best fit for the product you are creating, and make those decisions based on minimizing the communication overhead overall.  There is no one correct answer, there is no one perfect team size or set of processes, it requires skill and experience to know what is best, and even then it will likely change over the course of the project.

Making changes is fine, as long as the act of making those changes doesn't create more communication overhead than the changes themselves are meant to fix.

Effective, efficient communication is crucial to a successful product, but most of what happens is not even close to that.  Minimizing overall communication overhead and focusing energy on what is truly valuable maximizes the productivity of the whole team.

## Ownership

I'm going to say something heretical now, hopefully I won't get blacklisted from the industry for it:

Passion is overrated.

More to the point, passion is used in most cases as a substitute for what should be the most important thing, a well designed structure of ownership.  In many cases the people you're hiring don't have any real say in what's going on, but are expected to do great things anyway.  That's not really possible, and yet managers have seen people do it anyway, even in environments that are poisonous to initiative and creativity.  Those who rise above it and make it happen are extra passionate about what they're working on (or working in general), and so the manager naturally assumes that hiring passionate people is the win.

That's not the right fix, the best fix is to fix the poisonous environment so even people who aren't Type A personalities can make the same impact.  This is pretty classic W. Edwards Deming stuff, you're looking at a problem and blaming the people for all your woes, but it isn't the people, it is the environment/process.

Microsoft Classic was an organization that empowered the rank and file to make the critical product decisions, and the job of the management was to clear obstacles for them.  This meant that the responsibility was clear: if you own this feature, you own it.  You can get input from others, but the final decision rests with you.

If you don't actually own the decision, then your customer is not the product's customer, but rather the person or people who do own the decision.  You're trying to make them happy, not the end user.  If you combine this argument with my views on Organization Entropy, you can very quickly see what direction this takes any product.

## Interaction

The interaction of these two issues only compounds both.  A bad ownership model will cause significant communication overhead as the person who has the responsibility but not the authority attempts to convince those who have the authority what the right decision is.

When the ownership model is particularly bad it can create a need for everyone involved in even the most minor details to feel like they need to be directly involved in the decisions for those details.  This can get worse when someone is passionate, but not informed.

Finally, the ownership model directly dictates a lot of the communication that is required to create a product, and what patterns that communication will have.
