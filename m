From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 May 2012 10:12:55 +0200
Subject: [Buildroot] [PATCH 1/3] Convert gettext to autotargets
In-Reply-To: <CAFbHwiQX5facsOBf3TYDU4m_-u=AP1kJzEabJhWgy5-9c=GVqw@mail.gmail.com>
 (Will Newton's message of "Mon, 21 May 2012 09:08:47 +0100")
References: <4F7C6130.102@free-electrons.com>
 <1336475958-5714-1-git-send-email-s.martin49@gmail.com>
 <87k407lu8m.fsf@macbook.be.48ers.dk>
 <CAHXCMMJi=GZpyk6Uzc2f=emzVGnRHOOuDo-Q6JQWWhvm9TAinw@mail.gmail.com>
 <8762bqklli.fsf@macbook.be.48ers.dk>
 <CAFbHwiQX5facsOBf3TYDU4m_-u=AP1kJzEabJhWgy5-9c=GVqw@mail.gmail.com>
Message-ID: <871umekl4o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

Hi,

 Will> I would suggest that if we used to remove it then we should keep
 Will> removing it. Otherwise you end up in the situation where you
 Will> update buildroot and your filesystem image gets ever so slightly
 Will> bigger and won't fit in flash any more.

That can still happen with our version bumps as new versions are
typically somewhat more bloated than older versions, but OK - Keeping it
is not a big problem.

-- 
Bye, Peter Korsgaard
