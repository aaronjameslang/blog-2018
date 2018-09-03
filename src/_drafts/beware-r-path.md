---
layout: post
title: Beware R.path
---

R.pathOr('', ['myAccount', 'orgDetailData', 'users', '0', 'firstName'], state);

This failes silently, don't do it.

Explicity check for failure at the point you expect it, everyting else should
be catastrophic, or at least return 'error'
