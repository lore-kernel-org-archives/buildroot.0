From: Guo Ren <guoren@kernel.org>
Date: Tue, 30 Jul 2019 17:36:14 +0800
Subject: [Buildroot] c-sky defconfig build broken
In-Reply-To: <20190726163445.2093571b@windsurf>
References: <20190726163445.2093571b@windsurf>
Message-ID: <CAJF2gTRCO1gBbJqu7wxgqhWAkf_6R8gRURTzGT0yyudwFdXq1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to bumb it to linux-5.0 and deprecate external-toolchain, See
my prior patch I've sent to you.

https://lore.kernel.org/linux-csky/1561376581-19568-1-git-send-email-guoren at kernel.org/T/#u

Is that OK?

On Fri, Jul 26, 2019 at 10:34 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Guo,
>
> Following the addition of internal toolchain support for C-SKY, the
> existing csky_gx6605s_defconfig no longer builds:
>
> Incorrect selection of kernel headers: expected 5.2.x, got 4.9.x
>
> See https://gitlab.com/buildroot.org/buildroot/-/jobs/259847794
>
> Could you send a patch to fix this ? Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
