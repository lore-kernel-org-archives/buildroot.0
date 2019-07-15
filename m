From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Mon, 15 Jul 2019 11:07:35 +0200
Subject: [Buildroot] [PATCH] configs/atmel: bump to linux4sam_6.1
In-Reply-To: <20190714151658.2d18f9a5@windsurf>
References: <20190711091951.21129-1-ludovic.desroches@microchip.com>
 <20190714151658.2d18f9a5@windsurf>
Message-ID: <20190715090734.rei3fhzcfagaklmj@M43218.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 14, 2019 at 03:16:58PM +0200, Thomas Petazzoni wrote:
> External E-Mail
> 
> 
> Hello Ludovic,
> 
> On Thu, 11 Jul 2019 11:19:51 +0200
> Ludovic Desroches <ludovic.desroches@microchip.com> wrote:
> 
> > Only the atmel_sama5d27_som1 board uses the linux4sam_6.1 release. Bump
> > other boards to this new version.
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> 
> I am a bit perplex, because this patch doesn't update the kernel
> version anywhere. It updates the U-Boot version, the AT91Bootstrap
> version, the version of the kernel headers, but not the kernel itself.
> I don't really see how this can work, as the kernel headers version
> will no longer match the kernel version, and also the commit title that
> says we're bumping to linux4sam_6.1 is incorrect in that regard.
> 
> >  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_5.8)/linux-linux4sam_5.8.tar.gz"
> 
> See here, we're still using Linux tagged in version linux4sam_5.8, and
> not linux4sam_6.1.

Sorry my bad, a typo in my script that prevents the kernel update.

> 
> Could you fix this and send an updated version ?
> 

Sure, I'll do a new version.

Ludovic

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
