From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Dec 2013 22:03:29 +0100
Subject: [Buildroot] [PATCH] wireshark: fix wrong CFLAGS_FOR_BUILD
	assumption
In-Reply-To: <1386178647-26959-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 4 Dec 2013 14:37:27 -0300")
References: <1386178647-26959-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqjkjplq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Tested valid CFLAGS can't be pushed into CFLAGS_FOR_BUILD, they're
 > different compilers.

 > Fixes:
 > http://autobuild.buildroot.net/results/2b1/2b1a0654b649618422d65edf370b82476ba84491/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
