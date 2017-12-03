From: daggs <daggs@gmx.com>
Date: Sun, 3 Dec 2017 16:59:58 +0100
Subject: [Buildroot] [PATCH 3/8] odroidc2: add post build script.
In-Reply-To: <20171203142743.357b5446@windsurf.lan>
References: <20171203125619.30919-1-daggs@gmx.com>
 <20171203125619.30919-3-daggs@gmx.com>
 <20171203142743.357b5446@windsurf.lan>
Message-ID: <trinity-ed094e6e-351e-48be-8cf6-cbaf9c4575da-1512316798913@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Sunday, December 03, 2017 at 3:27 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 3/8] odroidc2: add post build script.
>
> Hello,
> 
> On Sun,  3 Dec 2017 14:56:14 +0200, Dagg Stompler wrote:
> 
> > +# U-Boot script
> > +${MKIMAGE} -C none -A arm -T script -d ${BOOT_CMD} ${BOOT_CMD_H}
> 
> This should be done using BR2_TARGET_UBOOT_BOOT_SCRIPT and
> BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE.
I'll look into it.

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
