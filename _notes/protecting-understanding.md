---
title: "Protecting Understanding"
date: 2026-07-23

summary: When a team stops understanding the code it ships, the problem is rarely the tools. It's that nobody in a leadership position was responsible for protecting that understanding.

index_summary: What I found when I asked a team about their own code, and what it revealed about technical leadership.

is_published: true

publish_at: 2026-07-23

read_time: "5 min read"

image: /assets/protecting-understanding.jpg
image_alt: A developer's notebook with an unanswered question beside a laptop displaying code, symbolizing the gap between generated code and genuine understanding.

tags:
  - engineering-leadership
  - technical-leadership
  - ai
  - code-quality
  - craft
---

A few months ago I was asked to spend some time with another engineering team that needed support. It wasn't my team and I wasn't there to investigate anything. I was just trying to understand where things stood before deciding how I could help.

During one of the first discussions, we were talking through one of the application's core user flows. I asked a fairly basic question about what happened after a particular step. I expected someone to explain it in a couple of minutes so we could move on.

Nobody answered.

I looked at one of the engineers. Then at the associate technical lead. Then at the technical lead. People started opening files and searching through the code instead of answering the question. It wasn't that they couldn't remember a method name or a small implementation detail. They genuinely weren't sure how the flow worked.

That wasn't the answer I expected.

Looking back, that moment explained far more about the team than the sprint board ever could.

It took me a while to understand what I was seeing.

The issue wasn't that the team had started using AI.

The issue was that AI had quietly removed the pressure to understand the code being merged.

When you write something yourself, you wrestle with the implementation. You make mistakes, rethink decisions, and eventually understand why the code looks the way it does. AI can produce that first draft in seconds. What it doesn't do is make sure anyone understands what just got merged.

The technical lead wasn't close to the implementation. The associate technical lead was making many technical decisions but wasn't hands-on enough to build a deep understanding either. Reviews focused on whether the code looked acceptable, not whether the reasoning behind it was sound.

Nobody was positioned to notice what was quietly accumulating.

The team kept shipping. What quietly disappeared was shared understanding.

I'd always thought of technical leadership a certain way.

As a developer, I knew the code because I was writing it. As a technical manager, I still reviewed critical pull requests because I never felt my responsibility to understand the system had changed. But it was as a tech lead where that responsibility felt most direct. Nothing important entered the codebase without me understanding it. Not because I was exceptional. That was simply part of the role.

Every effective team I've worked with had someone carrying that mental model. They didn't have every answer, but when discussions became difficult or something broke unexpectedly, they could connect the dots.

In this team, I couldn't tell who that person was.

The more I think about that meeting, the less I think it was a problem with AI.

It was a failure of technical leadership.

AI didn't decide not to understand the system. It didn't decide that implementation details didn't matter, that reviews could happen without context, or that nobody needed to carry the bigger picture.

Those were leadership decisions, even if nobody made them consciously.

AI has made this harder to see, not easier. When code arrives faster than anyone can reason about it, the absence of understanding doesn't announce itself. Sprints complete. Reviews get approved. The board stays green. The gap only becomes visible when someone asks a question the room can't answer.

AI can generate the code. It was never going to be accountable for understanding it.

If technical leadership isn't responsible for protecting that understanding, then what exactly is it responsible for?
