From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 30 Apr 2009 12:23:41 +0200
Subject: [Buildroot] Broken u-boot 2009.x, undeprecate u-boot 2008.10
In-Reply-To: <87bpqebgmv.fsf@macbook.be.48ers.dk>
References: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
	<20090430073104.684a701c@hcegtvedt.norway.atmel.com>
	<87bpqebgmv.fsf@macbook.be.48ers.dk>
Message-ID: <20090430122341.086c8b4a@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 30 Apr 2009 12:06:00 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Hans-Christian" == Hans-Christian Egtvedt
> >>>>> <hans-christian.egtvedt@atmel.com> writes:
> 
> Hi,
> 
>  Hans-Christian> Last working version for AVR32 is 2008.10 :/ The
>  Hans-Christian> 2009.01 release had another issue, which H?vard just
>  Hans-Christian> spotted before release, too late to do the
>  Hans-Christian> fix.
> 
> Do you mean the u-boot-2009.01-include_asm-avr32_io.h.patch.avr32 fix?
> 

Probably, I've not used upstream BR for some time.

>  Hans-Christian> 2009.03 is broken regarding JFFS2, at least for
> 
> So it's a known issue? Who's working on it? I didn't notice it on the
> u-boot list (I only skim that list, so that might be why though).
> 

Yes, it was reported initially as

Subject: JFFS2 scanning bug

Then

Subject: [PATCH 1/1] Fix JFFS2 NOR sector size routine

And anything which propagated from that. I did not stick around to see
the final conclusion.

>  Hans-Christian> At least make 2008.10 available, and lets hope
>  Hans-Christian> 2009.05 can make us dump all the previous ones.
> 
> Or alternatively backport the fix to 2009.03 so we don't end up with 4
> versions (8/10, 9/1, 9/3 and 9/5).
> 

Mmm, 2009.05 will hopefully be nice and flying.

-- 
Best regards,
Hans-Christian Egtvedt
