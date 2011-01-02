From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Jan 2011 23:02:29 +0100
Subject: [Buildroot] [PATCH 6/6] target gcc: cleanup
In-Reply-To: <1293795546-19674-9-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 31 Dec 2010 08:39:06 -0300")
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
	<1293795546-19674-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lj33c6bu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> WITH_TARGET_{GMP/MPC/MPFR} is unneeded since we are providing a sysroot.
 Gustavo> It also breaks build-gcc under certain conditions.

Committed, thanks.

-- 
Bye, Peter Korsgaard
