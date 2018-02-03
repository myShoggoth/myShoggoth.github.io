---
title: Branching Theory
description: How to setup your repo branching structure.
imgname: Tree
---

This is based on a conversation I had with a coworker in my former team, my own experience, and my thoughts stemming from that experience.

Basically, most people do branching structures in source depot wrong.

## Trunk Branches Have More Churn

The root branch for the entire branching structure should be the work going for the most future version of the product being developed.  The reason this has the most churn is that all the work going into every other branch by definition should go into the next version.  This is why...

### Changes Flow To The Trunk

Changes being made for a closer release than farthest out being worked on should be made in the farthest out, too.  In other words, let's say I've got a product with three versions:

* 1.0 - Released
* 1.1 - Schedule for release within a few months
* 2.0 - At least a year out

Since 2.0 is the farthest out being worked on, it should be the root branch (or main, or whatever you call it).  The 1.1 development is a branch off of it (I would call it 1.x), and 1.0 is a branch off of that (1.0.x).  Why this naming convention?  Let's take a few scenarios:

1. I need to make a patch for 1.0.  I've got a branch to do that in (1.0.x) that won't be destabilized by changes being made for other releases.  However, all the changes that are made there in almost all cases are wanted for all future versions of the product, so the changes should be made and the reverse integrated to the 1.x branch and then to the root branch.
2. A new release (1.2) is scheduled.  When this happens, a new branch should be created off of 1.x called 1.1.x.  Development of 1.2 continues in the 1.x branch, while stabilization and release for 1.1 moves to the 1.1.x branch.  Note that any patches needed for 1.1 after release now have a home, too.  All changes for 1.1.x are reverse integrated up to 1.x so that 1.2 is a superset of the functionality and bug fixes in 1.1, and all the 1.x changes are reverse integrated up to the root branch so 2.0 and all future versions are likewise supersets.
3. A fix is made into the 2.0 code (in the main branch) that should become a 1.0 patch.  This is the exception, in this case the change is propagated as a forward integrate into the 1.x and then the 1.0.x branches (also the 1.1.x branch assuming this is after the second example has happened).  This ensures that the fix exists in the entire hierarchy.
4. A 2.0 beta release is scheduled.  A branch should be created off the root (at this point I would normally get ahead of myself by creating 2.x as a branch off the root and then 2.0beta as a branch off of it), and the beta code stabilized in there.  Post-beta work continues in the root branch (or 2.x if you're getting ahead of yourself), beta changes and fixes are reverse integrated from the beta branch.

## Leaf Branches Have Less Churn

Since reverse integrates are normal (and hopefully scheduled, the more often these happen the better), and forward integrates are rare, the farther you get from the root branch the less change that is happening.  The idea is to stabilize and fix farther away, then reverse integrate the changes to propagate them widely.

## Branches vs. Labels

When to use a branch versus when to use a label depends on whether the contents are going to get modified in a meaningful way.  Take the case where you RTM a product, most groups want two different behaviors:

1. A snapshot in time of what exactly was release for reference purposes.  Because this will not change in a meaningful way (what was release is what was released), a label is correct.
2. A branch in which to do any patches against the version released.  This is a branch that will likely change, but it is different than the label.  The label exists as a reference point and a way to reconstruct the exact inputs that built the product that was RTMed, the branch exists for changes to be made in.

## Stabilizing

There is often a big desire by product groups to be able to stabilize on a regular schedule and release self host quality builds for testing and dogfooding.  For instance, the end of coding milestones is a very common time for teams to push for stability and dogfoodability. The normal way this is handled, however, can bring all progress to a halt until the last part of the team is done.

The correct way is to make a branch off the version being developed for stabilization.  Stability changes can then be reverse integrated as the work progresses while unblocked work continues in the normal branch.
