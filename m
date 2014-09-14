From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Sep 2014 23:39:31 +0200
Subject: [Buildroot] [PATCH 0/5] Moving to a two stage gcc build
In-Reply-To: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 14 Sep 2014 11:49:58 +0200")
References: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bnqh51bg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Here is a new iteration of the patch series moving from a three stage
 > gcc build to a two stage gcc build, which obviously speeds up quite a
 > bit the toolchain build process. This time around, I've done a *lot*
 > more testing, and I've fixed the Stack Smashing Protection issue that
 > lead to reverting the previous solution (back in October 2013).

 > You can see the results at:

 >   https://docs.google.com/spreadsheets/d/1Qj3t6HJzuVxsqLfXZp3HiFMGrangmRl510BqR_VIOeM/edit?usp=sharing

Nice!

Committed series, thanks.

 > I'd like to call people using the internal toolchain backend to please
 > test this patch series (both build time and run time), and report any
 > issue or send their Tested-by. We're still relatively early in the
 > development cycle, it's the good moment to get such changes merged.

Yes please!

-- 
Bye, Peter Korsgaard
