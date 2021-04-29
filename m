From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 29 Apr 2021 15:26:06 +0200
Subject: [Buildroot] [PATCH 0/4] Support for the Beagle-V platform
In-Reply-To: <20210429150143.276e4aec@windsurf>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
 <CAK4VdL2T=a7ffUweZC2dV5LTD2JNmP=UxU+2BfJ-L+bVB7Vp=Q@mail.gmail.com>
 <20210429150143.276e4aec@windsurf>
Message-ID: <CAK4VdL0qsvVUYsJr1S9OsnPG-Lc_Whn6zRzpWCsLaTfJzxsH0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 29, 2021 at 3:01 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Erico,
>
> On Thu, 29 Apr 2021 14:39:16 +0200
> Erico Nunes <nunes.erico@gmail.com> wrote:
>
> > I would like to try this but I have some questions:
> > Are you able to still boot the reference Fedora image after flashing
> > the custom bootloader?
>
> I don't know, I have not tried to boot the reference Fedora image
> before or after flashing the bootloader.
>
> And the bootloader is not custom, I am using the exact same OpenSBI and
> U-Boot source and configuration as the ones used for the reference
> image. The only thing I am changing is fdt_addr_r. I am not even sure
> it is used by the Fedora image, I don't know exactly how it is booted.

Ok, thanks, I will give it a try anyway.
I noticed that the manual build instructions in
https://wiki.seeedstudio.com/BeagleV-Make-File-System-Compile-uboot-Kernal/#compile-u-boot
suggest a CONFIG_SYS_TEXT_BASE=0x80020000 change and as far as I see
this is not in the build here, so maybe that could be related too.

Thanks

Erico
