---
layout: post
title: Light-Weight Architecture Records
---

There's an proverb in computer science, two things are hard: cache invalidation and naming things. You what else is hard work? Work. And most of what we do as engineer is reason and decide (if the bottleneck in your process is your wpm, you're an anomaly). Another thing we do a lot is automate, why do the same work twice? And once we've automated something, we're rarely content to let our code do the same work more than it needs to; we cache web traffic and memoize functions to improve our products.

Yet there's one piece of advise that's yet to be followed by any team I've joined, at that's: memoize your decisions.

Sometimes decisions take a long time to make. We sit through meeting after meeting with various stakeholders and specialist who all have something to contribute. And at the end of it we reach an agreement, and everybody walks out with The Plan crystal clear in their minds. The problem is that it's subtly different to what's in everyone else's heads, and it's almost certainly going to go through a major redesign once it's underway. The solution to this is to Write. It. Down. Share it around, get everyone to agree that yes, the words on that page are sufficient to explain what was agreed. It still won't be perfect, but at least when people disagree they can go back to the document and either refresh their memories or disambiguate the document itself.

Sometimes decisions are quick
