From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Dec 2008 15:42:10 +0100
Subject: [Buildroot] [PATCH] have zlib respect BR2_PREFER_STATIC_LIB
In-Reply-To: <alpine.LFD.2.00.0812031427390.14328@xanadu.home> (Nicolas
	Pitre's message of "Wed\, 03 Dec 2008 14\:28\:24 -0500 \(EST\)")
References: <alpine.LFD.2.00.0812031427390.14328@xanadu.home>
Message-ID: <87vdtuwwxp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Pitre <nico@cam.org> writes:

 Nicolas> The ARM uClinux BFLT format apparently doesn't support
 Nicolas> shared libs nor -fPIC.  So let's distinguish between shared
 Nicolas> and non shared builds by having split rules for libz.a and
 Nicolas> libz.so based on BR2_PREFER_STATIC_LIB.

Thanks, committed as r24324.

-- 
Bye, Peter Korsgaard
