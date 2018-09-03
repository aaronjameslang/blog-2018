---
layout: post
title: Don't Throw Sensitive Data
---

https://bitbucket.org/accordogroup/question.crm.status.handler/pull-requests/1/cat2-2516-update-the-call-status-and/diff#comment-71334124

Log all errors
It's the throwers responsibility to not throw sensitive data
If it does or needs to, wrap error and remove sensitive info at earliest
possible point
Should errors contain two messages, one for server logs and one for the user?
