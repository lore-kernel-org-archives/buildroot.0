From: daggs <daggs@gmx.com>
Date: Sun, 3 Dec 2017 16:55:53 +0100
Subject: [Buildroot] [PATCH 4/8] odroidc2: add mainline kernel config
In-Reply-To: <20171203142824.08aec6c8@windsurf.lan>
References: <20171203125619.30919-1-daggs@gmx.com>
 <20171203125619.30919-4-daggs@gmx.com>
 <20171203142824.08aec6c8@windsurf.lan>
Message-ID: <trinity-d023ef5f-6e34-4dc5-ad35-135e3de53cb7-1512316552992@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas ,

> Sent: Sunday, December 03, 2017 at 3:28 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 4/8] odroidc2: add mainline kernel config
>
> Hello,
> 
> On Sun,  3 Dec 2017 14:56:15 +0200, Dagg Stompler wrote:
> > mainline odroidc2 uses a different kernel config than arm64 defconfig
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> > ---
> >  .../odroidc2/odroidc2_mainline_defconfig           | 5657 ++++++++++++++++++++
> >  1 file changed, 5657 insertions(+)
> >  create mode 100644 board/hardkernel/odroidc2/odroidc2_mainline_defconfig
> 
> Please use a defconfig, not a full .config file. I.e, generate it with
> "make savedefconfig" in the kernel.
> 
sure, will do.

> Thanks,
> 
> Thomas Petazzoni
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
