From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Dec 2010 23:25:58 +0100
Subject: [Buildroot] [PATCH 0/5] toolchain rework, part 1
In-Reply-To: <1291664411-27836-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Mon, 6 Dec 2010 16:40:06 -0300")
References: <1291664411-27836-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bp46n98p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> This is the first batch of patches for the internal toolchain
 Gustavo> rework.  In this first stage we convert gmp, mpfr and mpc to
 Gustavo> proper packages and hook them up for use in the current
 Gustavo> toolchain.

 Gustavo> We also fix a small bug in the package infra with regards to
 Gustavo> versioned patches that'll be required to avoid duplication in
 Gustavo> the binutils/gcc migration.

Committed, thanks.

-- 
Bye, Peter Korsgaard
