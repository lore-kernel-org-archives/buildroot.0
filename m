From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 May 2019 10:38:24 +0200
Subject: [Buildroot] [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
In-Reply-To: <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org>
 <20190529092128.36183371@windsurf.home>
 <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
 <20190529095629.2b28cbb7@windsurf.home>
 <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
Message-ID: <20190529103824.58560e4e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 May 2019 16:12:25 +0800
Guo Ren <guoren@kernel.org> wrote:

> > Not just two patches: also a better commit log for the DSP -> VDSP
> > change.  
> 
> I want these two patches:
> 
> 1. Remove DSP, because it's no use in current buildroot.
> 2. Add VDSP support

OK, but then please split in yet another patch the fact of using
arch.mk.csky to build the GCC_TARGET_CPU variable.

> Here is my commit log for Introduce VDSP feature:
> 
> VDSP is C-SKY enhanced extension instruction set for SIMD, AI and DSP
> operation. It could be support by abiv2 (ck807, ck810, ck860).
> 
> Is that OK?

Yes. But please add a proper commit log in the patch removing the DSP
option.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
