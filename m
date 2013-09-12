From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Sep 2013 00:08:35 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain/gcc: add elf2flt to
	dependencies
In-Reply-To: <1378901526-29167-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 11 Sep 2013 09:12:06 -0300")
References: <1378901526-29167-1-git-send-email-gustavo@zacarias.com.ar>
 <1378901526-29167-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bo3xpuak.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add host-elf2flt to the gcc common dependencies so we get it built after
 Gustavo> binutils but before gcc/uclibc since it's required for all packages and
 Gustavo> in some uClibc configuration scenarios.

Committed, thanks.

-- 
Bye, Peter Korsgaard
