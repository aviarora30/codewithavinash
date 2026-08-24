---
title: "Are We Romanticizing Code?"
date: 2026-08-24

summary: "With agents writing code, I'm reconsidering whether code understanding actually matters. Or if I'm just romanticizing something my generation learned to value."

index_summary: "If agents write the code and we stop reading it, are we romanticizing understanding or losing something we actually need?"

is_published: true

read_time: "7 min read"

tags:
  - engineering-leadership
  - ai
  - craft
  - learning
  - career-growth

image: /assets/are-we-romanticizing-code.jpg
image_alt: A person interacts with the top layer of a complex, transparent system while the code layer beneath fades from view, representing the shift toward higher levels of abstraction in agentic coding.
---

I've spent years **arguing that someone needs to own the code** ([Protecting Understanding](https://codewithavinash.com/notes/protecting-understanding/), [I Already Knew](https://codewithavinash.com/notes/i-already-knew/)).

Someone who knows how the system works, why a particular decision was made, where a flow starts, and what is likely to break when something changes.

**I'm not sure that will remain true.**

With agentic coding, I can see a future where most of the code is written by agents and very little of it is actually read by humans. People will describe what they want, review the specifications, validate the output, and let agents handle the implementation.

**Soon, the amount of code being produced may simply make code ownership impractical.**

Maybe ownership moves up a level.

Someone owns the output and its correctness. They may know exactly what the system is supposed to do without knowing what a particular function does or where a particular flow starts in the code.

That feels like a reasonable evolution, but it leaves me with many questions.

**If code stops being where people develop their understanding of a system, how does that understanding get built in the first place?**

We've seen this movement toward abstraction before.

You don't write machine instructions when you write C. You don't manage memory manually when you write Java. And as a JavaScript developer, I don't need to think about how my code eventually gets executed by a processor.

I'm a JavaScript developer, and honestly, I don't care much about what happens at that level. I don't need to. The abstraction works because I can work at my level without constantly thinking about the one underneath.

**Could agentic coding be another step in the same direction?**

We describe what we want the system to do, review the specification, and care about whether the resulting system behaves correctly. I don't need to understand what happens to my JavaScript at the processor level, so maybe I won't need to understand what happens to my specification at the code level either.

But this time the abstraction isn't hiding machine instructions. **It's hiding the code itself.**

If agents are writing the code, what do we actually spend our time doing?

We will probably spend more time describing what the system needs to do, reviewing what the agent thinks we mean, looking for gaps, questioning assumptions, and deciding whether the specification is good enough to turn into a working system.

A good specification needs more than a description of what we want. It needs enough understanding of the problem to know what matters, what can go wrong, what needs to be explicit, and what can safely be left to the agent.

**We spend less time thinking about how something should be built and more time being precise about what needs to exist.**

This is where I start getting less certain.

A lot of what senior engineers bring comes from having seen systems run in the real world. You know that a particular approach will probably create a performance problem, which architectural choice is going to make the next change painful, or you remember a failure from two years ago that looks unrelated to the problem in front of you.

That knowledge is difficult to put into a specification because you often don't know you need it until the situation appears, and most of it was not learned by reading documentation. It was learned by breaking things, debugging them, and seeing the consequences of decisions made earlier.

**If the code is increasingly written by agents, I don't know how much of that experience the next generation gets to build for themselves.**

The question becomes more real when something breaks in production.

Today, when a production issue shows up, someone usually has to get into the system and figure out what is happening. They follow the flow, look at the code, logs and traces, try things, and slowly narrow down what went wrong.

While doing that, they're learning the system. They understand what led to the failure, why it behaved the way it did, and often discover things about the system that were never documented.

But if an agent has written most of the system, **where does a person even start when something breaks?** They may not know which part of the code to look at or even how the flow is implemented. Asking the agent to investigate it would probably be the obvious thing to do.

The agent can investigate the issue, explain what it found, propose a fix and perhaps implement it. The person can review the investigation, question the reasoning and decide whether the fix is good enough.

**But is that enough to understand the system?**

I don't know.

And this is where I start wondering whether my instinct that someone needs to understand the code is really about the code, or whether the code was simply the way we learned to understand the systems we were responsible for.

I keep thinking about how we used to develop engineers because that is the environment I came through. You wrote code, someone reviewed it, you fixed bugs, investigated production issues, made architectural mistakes, and gradually built judgment.

**If most of that work moves to agents, perhaps trying to recreate the same path for the next generation is the wrong goal. The work itself may have to change.**

A junior engineer may spend less time learning how to implement a feature and more time learning how to describe the problem, challenge the specification, evaluate the output, and understand the trade-offs.

Maybe that is where domain knowledge starts to look different.

I was listening to Nathaniel Whittemore on the AI Daily Brief recently, and he framed a version of this problem that stayed with me. If experienced people use AI to do the work that younger engineers would previously have done, where does the next generation get the opportunity to develop domain judgment? His answer was to move from a person working with AI to small teams working with AI together, so younger people still get exposure to the decisions and judgment happening around them. ([Nathaniel Whittemore — AI Daily Brief, August 18, 2026](https://aidailybrief.ai/e/2026-08-18))

I find that idea interesting, but I'm still not sure it answers the question for me.

**The thing we really need to pass on may not be knowledge of the code. It may be the ability to recognise a good decision from a bad one, understand the consequences of a trade-off, know what can go wrong, and know when something doesn't look right even when everything appears to be working.**

Maybe that is what we need.

I don't know yet whether those activities build the same depth of understanding as getting your hands dirty with the system did. **I also don't know if that previous level of understanding will even be needed in the world we are moving towards.**

Maybe the mistake is looking at all of this through the roles we have today.

We keep asking what happens to the senior engineer, what happens to the junior engineer, who owns the code, and who does the debugging. Those roles were shaped by a world where humans wrote and understood the code.

**Perhaps we are trying to fit a new way of working into roles that were designed for the old one.**

I've spent years believing that someone should know the code they are responsible for. Soon, agents will write most of that code, and **I am not sure that belief will make sense anymore.**

**Maybe I am still romanticizing code because it is the layer through which my generation learned to understand systems.**

What I still don't know is whether we are losing something important when we stop learning systems by working through them ourselves.

Maybe we will find a different way to build it. Maybe the kind of understanding we need will change with the abstraction.

I don't know yet.

**And I think that is where I am with agentic coding today. I can see why the old model is changing. I'm just not sure yet what we should be careful not to lose.**
