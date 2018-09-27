From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 23:24:29 +0200
Subject: [Buildroot] [PATCH v2] package/squashfs: fix build on hosts
 with glibc >= 2.28
In-Reply-To: <20180901220600.18416-1-richard.kunze@web.de> (Richard Kunze's
 message of "Sun, 2 Sep 2018 00:06:00 +0200")
References: <87ftys6hrd.fsf@dell.be.48ers.dk>
 <20180901220600.18416-1-richard.kunze@web.de>
Message-ID: <87in2q8whe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Richard" == Richard Kunze <richard.kunze@web.de> writes:

 > Since glibc 2.28, sys/sysmacros.h is no longer included from sys/types.h
 > This patch fixes the resulting build error by explicitly including
 > sys/sysmacros.h

 > See also https://github.com/plougher/squashfs-tools/pull/52

 > Signed-off-by: Richard Kunze <richard.kunze@web.de>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
