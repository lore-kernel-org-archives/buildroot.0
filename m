From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 May 2012 10:02:49 +0200
Subject: [Buildroot] [PATCH 1/3] Convert gettext to autotargets
In-Reply-To: <CAHXCMMJi=GZpyk6Uzc2f=emzVGnRHOOuDo-Q6JQWWhvm9TAinw@mail.gmail.com>
 (Samuel Martin's message of "Mon, 21 May 2012 09:52:05 +0200")
References: <4F7C6130.102@free-electrons.com>
 <1336475958-5714-1-git-send-email-s.martin49@gmail.com>
 <87k407lu8m.fsf@macbook.be.48ers.dk>
 <CAHXCMMJi=GZpyk6Uzc2f=emzVGnRHOOuDo-Q6JQWWhvm9TAinw@mail.gmail.com>
Message-ID: <8762bqklli.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

Hi,

 >> This seems backwards. Wouldn't you want to keep the binaries if libintl
 >> is enabled?

 Samuel> Actually, do we really need to remove these binaries?
 Samuel> On an arm build, these 3 binaries take less than 80KB.

I don't feel strongly about it. The stuff needing gettext is typically
quite a lot bigger than 80KB, so perhaps simplifying stuff is indeed the
way to go.

-- 
Bye, Peter Korsgaard
