From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Apr 2009 12:06:00 +0200
Subject: [Buildroot] Broken u-boot 2009.x, undeprecate u-boot 2008.10
In-Reply-To: <20090430073104.684a701c@hcegtvedt.norway.atmel.com>
	(Hans-Christian Egtvedt's message of "Thu\,
	30 Apr 2009 07\:31\:04 +0200")
References: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
	<20090430073104.684a701c@hcegtvedt.norway.atmel.com>
Message-ID: <87bpqebgmv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 Hans-Christian> Last working version for AVR32 is 2008.10 :/ The
 Hans-Christian> 2009.01 release had another issue, which H?vard just
 Hans-Christian> spotted before release, too late to do the
 Hans-Christian> fix.

Do you mean the u-boot-2009.01-include_asm-avr32_io.h.patch.avr32 fix?

 Hans-Christian> 2009.03 is broken regarding JFFS2, at least for

So it's a known issue? Who's working on it? I didn't notice it on the
u-boot list (I only skim that list, so that might be why though).

 Hans-Christian> At least make 2008.10 available, and lets hope
 Hans-Christian> 2009.05 can make us dump all the previous ones.

Or alternatively backport the fix to 2009.03 so we don't end up with 4
versions (8/10, 9/1, 9/3 and 9/5).

-- 
Bye, Peter Korsgaard
