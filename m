From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 22:57:35 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain/buildroot: default to eglibc
	for mips64
In-Reply-To: <1385575768-21670-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 27 Nov 2013 15:09:26 -0300")
References: <1385575768-21670-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87iovcxk8g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > uClibc only works well for O32 ABI on mips64, so default to eglibc that
 > works just fine with N32 & N64 ABIs as well.

Committed series to next, thanks.

-- 
Bye, Peter Korsgaard
