From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 1 May 2016 22:48:36 +0200
Subject: [Buildroot] [PATCH v6 2/3] barebox: support auxiliary config
 build
In-Reply-To: <20160501143440.68983c1e@free-electrons.com>
References: <cover.1461531859.git.pieter@boesman.nl>
 <f070ae02cf8e605859c8e3e64b6f5f4e864b951c.1461531859.git.pieter@boesman.nl>
 <20160501143440.68983c1e@free-electrons.com>
Message-ID: <20160501204836.GB32055@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 01, 2016 at 02:34:40PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 24 Apr 2016 23:15:24 +0200, Pieter Smith wrote:
> > Adds support to build barebox with an auxiliary config.
> > 
> > This is useful for building an SPL (Secondary Program Loader) in addition to
> > the traditional TPL (Tertiary Program Loader). The Beaglebone Black for example
> > has two barebox configurations:
> > - am335x_defconfig builds the full barebox bootloader with device tree, and
> > - am335x_mlo_defconfig builds the smaller MLO bootloader that loads the full
> >   barebox bootloader from the eMMC or SD card.
> > 

[snip]

> Applied to master, thanks.

Thanks as well.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

- Pieter
