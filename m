From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Sep 2009 10:14:00 +0200
Subject: [Buildroot] UBOOT 2009.08 & ARM Link Error
In-Reply-To: <2FAA2DE137CA432EBF8BEE2E967A7993@apexjs> (Sagaert Johan's
	message of "Thu\, 10 Sep 2009 09\:50\:56 +0200")
References: <2FAA2DE137CA432EBF8BEE2E967A7993@apexjs>
Message-ID: <87fxavw71z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

Hi,

 Sagaert> The 2009.06 version does not produce this error, so i will be
 Sagaert> using this one i guess .
 
 Sagaert> I wonder if this is a toolchain issue or a uboot error .

Is you toolchain using hardware FPU? Can you build 2009.08 manually
outside buildroot?

 Sagaert> If a recent version gets pushed into buildroot, does someone
 Sagaert> then verifies it works ?

Ofcourse, but you cannot test all configurations. I mainly work on
powerpc, so that's what I tested before adding it.

As mentioned in the 2009.08 announcement, I'll work on getting buildbot
running, so we can get a bit more test coverage.

-- 
Bye, Peter Korsgaard
