From: daggs <daggs@gmx.com>
Date: Sun, 3 Dec 2017 19:57:12 +0100
Subject: [Buildroot] [PATCH 4/8] odroidc2: add mainline kernel config
In-Reply-To: <33e0695f-4b54-b9a1-5d6f-2d57bc58c30f@mind.be>
References: <20171203125619.30919-1-daggs@gmx.com>
 <20171203125619.30919-4-daggs@gmx.com>
 <20171203142824.08aec6c8@windsurf.lan>
 <trinity-d023ef5f-6e34-4dc5-ad35-135e3de53cb7-1512316552992@3c-app-mailcom-bs06>
 <33e0695f-4b54-b9a1-5d6f-2d57bc58c30f@mind.be>
Message-ID: <trinity-45d3df7c-7c58-4ce6-b836-dea570e58fba-1512327432508@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Arnout ,

> Sent: Sunday, December 03, 2017 at 7:19 PM
> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: daggs <daggs@gmx.com>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 4/8] odroidc2: add mainline kernel config
>
> 
> 
> On 03-12-17 16:55, daggs wrote:
> > Greetings Thomas ,
> > 
> >> Sent: Sunday, December 03, 2017 at 3:28 PM
> >> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> >> To: "Dagg Stompler" <daggs@gmx.com>
> >> Cc: buildroot at buildroot.org
> >> Subject: Re: [Buildroot] [PATCH 4/8] odroidc2: add mainline kernel config
> >>
> >> Hello,
> >>
> >> On Sun,  3 Dec 2017 14:56:15 +0200, Dagg Stompler wrote:
> >>> mainline odroidc2 uses a different kernel config than arm64 defconfig
> >>>
> >>> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> >>> ---
> >>>  .../odroidc2/odroidc2_mainline_defconfig           | 5657 ++++++++++++++++++++
> >>>  1 file changed, 5657 insertions(+)
> >>>  create mode 100644 board/hardkernel/odroidc2/odroidc2_mainline_defconfig
> >>
> >> Please use a defconfig, not a full .config file. I.e, generate it with
> >> "make savedefconfig" in the kernel.
> >>
> > sure, will do.
> 
>  Even better (if possible): use the in-tree defconfig and a kconfig fragment to
> make the changes for odroidc2.
> 
>  Regards,
>  Arnout
> 

you mean add a patch that modifies the kernel arm64 defconfig? 
