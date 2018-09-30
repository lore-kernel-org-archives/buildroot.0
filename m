From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:41:31 +0200
Subject: [Buildroot] [PATCH 1/1] bootutils: fix build with glibc 2.28
In-Reply-To: <20180929111537.22500-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Sep 2018 13:15:37 +0200")
References: <20180929111537.22500-1-fontaine.fabrice@gmail.com>
Message-ID: <87bm8f4bt0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Replace first patch which was adding sys/types.h to fix musl issue by a
 > patch adding sys/sysmacros to fix build with glibc 2.28

I take it that sysmacros.h implicitly pulls in types.h so builds with
musl still work?

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c26761663a764a2eb7af54316a6dc78bd01490fb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
