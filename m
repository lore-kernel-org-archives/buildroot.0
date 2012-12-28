From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Dec 2012 22:47:15 +0100
Subject: [Buildroot] [PATCH 2/2] diffutils: fix build with recent glibc
In-Reply-To: <1356727282-13118-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 28 Dec 2012 21:41:22 +0100")
References: <1356727282-13118-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ip7lyhlo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Fixes the following build problem with recent toolchains:
 Thomas> In file included from exclude.c:31:0:
 Thomas> ./stdio.h:1012:1: error: 'gets' undeclared here (not in a function)
 Thomas>   CC       hard-locale.o
 Thomas> make[4]: *** [exclude.o] Error 1
 Thomas> make[4]: *** Waiting for unfinished jobs....
 Thomas> In file included from stdio-safer.h:20:0,
 Thomas>                  from freopen-safer.c:22:
 Thomas> ./stdio.h:1012:1: error: 'gets' undeclared here (not in a function)

Committed, thanks.

-- 
Bye, Peter Korsgaard
