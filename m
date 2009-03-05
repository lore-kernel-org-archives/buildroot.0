From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Mar 2009 16:34:10 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: fuse
	lzma	netkitbase qtopia4
In-Reply-To: <49AFF022.3060404@atmel.com> (Hans-Christian Egtvedt's message of
	"Thu\, 05 Mar 2009 16\:30\:42 +0100")
References: <20090305141755.ED5BC7626F@busybox.osuosl.org>
	<49AFE41E.2060605@atmel.com> <874oy8f2qm.fsf@macbook.be.48ers.dk>
	<49AFE922.2060109@atmel.com> <87vdqodmje.fsf@macbook.be.48ers.dk>
	<49AFF022.3060404@atmel.com>
Message-ID: <87myc0dlvx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 Hans-Christian> I have no idea what have happened, but the select
 Hans-Christian> does not trigger...

 Hans-Christian> ~ > grep NATIVE .config
 Hans-Christian> # BR2_PTHREADS_NATIVE is not set

 Hans-Christian> ~ > grep NATIVE toolchain_build_avr32/uClibc-0.9.30/.config
 Hans-Christian> ~ >

Strange - Anyway, I'll remove it.

-- 
Bye, Peter Korsgaard
