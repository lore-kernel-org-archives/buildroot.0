From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 18 Jan 2018 20:54:32 +0100
Subject: [Buildroot] [PATCH] nilfs-utils: fix build with static
 toolchains
In-Reply-To: <20180118143307.61b70db8@windsurf.lan>
References: <1515357573-10780-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20180118143307.61b70db8@windsurf.lan>
Message-ID: <20180118195432.GB21814@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

No worries, I didn't forget, but work and sick children came in between :-(
You may expect a new patch one of these days.

Kurt

--- Original message ---
> Date: Thu, 18 Jan 2018 14:33:07 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] nilfs-utils: fix build with static
>  toolchains
> X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
> 
> Hello Kurt,
> 
> On Sun,  7 Jan 2018 21:39:33 +0100, Kurt Van Dijck wrote:
> > This commit adds a patch to respect the dependency libmount->libblkid->libuuid
> > properly in autoconf. This becomes necessary for static builds.
> > 
> > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> 
> This problem is still occurring in the autobuilders. Could you send a
> new version of this patch? The issues to be fixed were really minor.
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
