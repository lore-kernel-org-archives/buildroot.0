From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 18 Apr 2017 11:50:07 -0400
Subject: [Buildroot] [PATCH] configs: add raspberrypi3 64bits defconfig
In-Reply-To: <CAFGQKxdUK_RR9KK1GN8YTdAtvb1VgKooJT-t=zDbWucmZH8n0w@mail.gmail.com>
References: <20170415113751.14317-1-gael.portay@savoirfairelinux.com>
 <CAFGQKxdUK_RR9KK1GN8YTdAtvb1VgKooJT-t=zDbWucmZH8n0w@mail.gmail.com>
Message-ID: <20170418155007.ve2v26erjcmqxmfx@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin,

On Tue, Apr 18, 2017 at 11:42:58AM +0100, Martin Bark wrote:
> Ga?l,
> 
> Thanks for working on this.  I was about to do this so you saved me a job :)
> 
> [snip]
> > +++ b/configs/raspberrypi3_64_defconfig
> > @@ -0,0 +1,38 @@
> > +BR2_aarch64=y
> > +BR2_cortex_a53=y
> >
> 
> The rpi3 has a VFPv4 floating point unit so i think we also
> need BR2_ARM_FPU_VFPV4=y
> 

I am not able to find this information for Broadcom 2837 CPU.

But I trust you and wikipedia [1].

Thanks!

> Thanks
> 
> Martin
> 

Regards,
Ga?l

[1] https://en.wikipedia.org/wiki/ARM_Cortex-A53
