From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 15 Dec 2009 09:49:39 +0100
Subject: [Buildroot] [PATCH 05/23] uclibc: add avr32 special version
In-Reply-To: <87skbcpr0l.fsf@macbook.be.48ers.dk>
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
	<3a24927a0e6f041a018085b5a7fc50312001fddc.1260831891.git.thomas.petazzoni@free-electrons.com>
	<20091215081809.071a009e@hcegtvedt.norway.atmel.com>
	<20091215092418.59c33ca8@surf>
	<20091215093708.60baae3e@hcegtvedt.norway.atmel.com>
	<87skbcpr0l.fsf@macbook.be.48ers.dk>
Message-ID: <20091215094939.4309e661@hcegtvedt.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Dec 2009 09:42:34 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "HcE" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
> 
> Hi,
> 
>  HcE> I'm currently out of time to mold this patch into something useful.
>  HcE> FWIW it is on my todo list.
> 
>  HcE> IIRC it should be possible to add an arch only patch to Buildroot?
>  HcE> Unsure if this applies to uCLibc.
> 
> Yes, uclibc.mk does:
> 
>         toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
>                 uClibc-$(UCLIBC_VERSION)-\*.patch \
>                 uClibc-$(UCLIBC_VERSION)-\*.patch.$(ARCH)
> 
> So I'll add it as a .patch.avr32 you send me a working patch.
> 

I have no newer patch than the one I sent to the uClibc mailing list,
or do you want a BR patch adding the uClibc patch?

-- 
Best regards,
Hans-Christian Egtvedt
