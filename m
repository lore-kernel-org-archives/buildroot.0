From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Dec 2010 23:15:55 +0100
Subject: [Buildroot] [PATCH 10/10] toolchain: drop
	BR2_CROSS_TOOLCHAIN_TARGET_UTILS option
In-Reply-To: <1293563435-10054-11-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 28 Dec 2010 16:10:35 -0300")
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
	<1293563435-10054-11-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y678i5t0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> It's really not very useful, all it does is install a target
 Gustavo> strace and ldd in a target_utils directory in staging.
 Gustavo> While at it clean up the strace makefile a bit.

Committed, thanks.

-- 
Bye, Peter Korsgaard
