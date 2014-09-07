From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Sep 2014 21:56:18 +0200
Subject: [Buildroot] [PATCH] enlightenment: disable ptrace for ppc &
	sparc
In-Reply-To: <1410096877-15836-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 7 Sep 2014 10:34:37 -0300")
References: <1410096877-15836-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wq9fjjbx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The sys/ptrace.h header for uclibc <= 0.9.33.2 is incomplete and lacks
 > required definitions for powerpc and sparc.
 > Fixes:
 > http://autobuild.buildroot.net/results/a7f/a7f95353f5592a9399c542d8d56c3ca040f8a61a/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
