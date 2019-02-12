---
layout: post
title: Git Flow Slim
---

What does slim mean?

Don't use -m when commiting

To start with, write like you're writing for tao/john. They know git pretty well, you just need to explain what the workflow is.

Git gives us the tools to manage source code versioning and parralell development, but is flexible enough to let us make our own mistakes. By far the most popular git workflow recommended today is what has become known as Git Flow, originally described by [V. Driessen](https://nvie.com/posts/a-successful-git-branching-model/).

As Git Flow builds on git to reduce bike shedding and room for error, so this work flow "Git Flow Slim" (for want of a better name) builds on git flow to cater to some specific difficulties encountered by some users, namely:
- Divergent `master` and `develop` branches leading to merge conflicts
- Busy multi-branch git log becoming inscrutable
- Apparently succesful merges (or conflict resolutions) leading to broken code, particularly when this impacts other parraell streams of work

I will also make a number of recommendations on practices that I have found useful, but which aren't strictly nescessary to prevent the most intractable of scenarios.

## The Golden Rule

If we take the principles of Git Flow as read, our only additional rule is:

> `master` must never be ahead of `develop`

This prevents two becoming 'out of sync' leading to issues when trying to merge. To see what this means in practical terms see [here](#how-to-merge)

## Walkthrough

What follows will be a step by step guide to this workflow, structured for reference. It does not assume that you are already familiar with Git Flow, and the exmaples given should hopefully be intelligible to those in the process of learning git.

### Getting Started

#### Starting a New Repository

- Create an initial commit
- Create another branch called `develop`

#### Adpating an Existing Reposity

### Changing Code

#### Branching

- Normally you'd create a new 'topic branch' for your work off of develop
- If you're working on a fix for a release, you'd want to branch off of the appropriate release branch
- Don't branch 'hotfixes' off of master, create a release branch first. See #slkdfj

#### Committing

- Commit messages could follow convnetional commits
- One commit per branch/topic/issue, this helps simplify the commit history.
  If you need to make a series of changes, either amend your commit with each change, or squash them once ready to merge.

#### Merging

- Merge into the branch you initially branched off from, either develop or a release branch
- If the merge results in a conflict, rebase your work onto the appropriate base branch, check the diff, re-test and try the merge again
- If your base branch changes a lot before you can merge for whatever reason, it's likely worth it to rebase anyway to be safe

### Preparing for a Release

#### Branching

- Release branches are typically created from master (for urgent releases) or develop (for regular releases)
- Release branches may be created from some point between master and develop if you have a good reason and know what you're doing
- Release branches may be created from a tagged version if you're supporting a multi-vesion project, this is beyond the scope of this guide

#### Committing

- Sometimes a release branch will pass testing immediately and you can skip straight to #merging
- If the release requires fixes for released/unreleased bugs, follow the process from #hangeing code use the release as your base branch until the relase is satisfactory

#### Merging

- The release branch, once ready must be merged into develop. Use a fast forawrd marge if possible, however often a 'regular' merge is required as the release will be behind develop.
- TODO merge conflicts here
- Once the release has been successfully merged into develop, and only then, can the relase be merged to master. This merge must be a fast-forward merge, or else a tiny divergence will be created between master and develop, opening the way for future anomalies. If you are unable to perform a fast forward merge, find out why. It is possible that this could occur if you have been preparing two release branches at once. The best option here is to prepare a new release, and cherry pick any fixes applied to this release branch.

## Contridictions to Git Flow

- No `hotifx-*` branches

  The distinction from release branches is rarely useful, and adds mental burden. See #preparing for a release

- No 'feature' branches

  Or rather we call them topic branches, which the original article suggests as an alternative. These branches may contain features, but equally could address bug fixes, documentation improvements, performance improvements, refactoring, etc.

- No `--no-ff`

  We fast-forward merge where possible for a simpler commit history. The justification for avoiding fast forwards given in the original article:
  > This avoids losing information about the historical existence of a feature branch and groups together all commits that together added the feature.
  
  does not apply, as our model only requires a single commit per feature, futher simplifyng the history. See #commiting

- Some release branches are from master

  A side effect of grouping hotfixes in with releases, is that the branches that come off master are now also called `release-*`

- Release branches are merged to develop first

  In order to ensure master is never ahead of develop, nothing can be merged to master that hasn't been merged to develop first.