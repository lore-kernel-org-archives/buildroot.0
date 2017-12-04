From: daggs <daggs@gmx.com>
Date: Mon, 4 Dec 2017 09:27:20 +0100
Subject: [Buildroot] status of odroidc2's support?
In-Reply-To: <20171204091310.5295266f@windsurf.home>
References: <trinity-8c598823-c6de-4b88-91b4-43ba7c4de257-1512369327653@3c-app-mailcom-bs14>
 <20171204091310.5295266f@windsurf.home>
Message-ID: <trinity-c7b00df8-109a-4988-8762-2b7898dda327-1512376040564@3c-app-mailcom-bs15>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas,

> Sent: Monday, December 04, 2017 at 10:13 AM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: daggs <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] status of odroidc2's support?
>
> Hello,
> 
> On Mon, 4 Dec 2017 07:35:27 +0100, daggs wrote:
> 
> > now that gcc 4.9.x was dropped from buildroot,
> 
> Gcc 4.9 is not dropped from Buildroot, it's still there in the current
> Git master.
> 
> > is it impossible to build the vendor's version of odroidc2. (uboot
> > doesn't compile)
> > so the is no way to build a workable image for this board. I think
> > there support for gcc5 was added but not for gcc6. I've tried to add
> > support for gcc6 but it won't boot the kernel.
> > 
> > unfortunately, I don't have any time to handle both vendor and
> > mainline support. I wonder if it worthwhile to continue my support
> > for it. I know that soon to be mainline kernel 4.15 has hdmi support
> > but I don't know for what extent (still trying to figure it out), one
> > thing is sure, there will be no hw decoding support. is there a way
> > to restore support for the vendor's flavor? maybe and external
> > toolchain?
> 
> Getting U-Boot to build with gcc 5.x should just be a matter of
> backporting a U-Boot patch. Can you try applying something
> like ./roseapplepi/patches/uboot/0001-compiler-.h-sync-include-linux-compiler-.h-with-Linu.patch
> to your U-Boot and see if it works ?
> 
> Thanks!
> 
> Thomas
> -- 
strange, when running menuconfig, I see only gcc 6 and gcc 7 in the version selection menu. what am I missing?
I think the branch already supports gcc5

Dagg.
