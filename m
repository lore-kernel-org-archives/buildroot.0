From: Heiko Zuerker <heiko@zuerker.org>
Date: Sun, 5 Dec 2010 14:43:56 -0600
Subject: [Buildroot] [PATCH] support for mini initramfs and added
	iso9660 improvements
In-Reply-To: <20101205212531.1a1c5978@surf>
References: <c3e09387f2f59a61e096cd974d8921fb6fa9ea43.1291562435.git.smiley73@users.sourceforge.net>
	<20101205212531.1a1c5978@surf>
Message-ID: <005c01cb94bd$2303c310$690b4930$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Sunday, December 05, 2010 2:26 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] support for mini initramfs and added
iso9660
> improvements
> 
> Heiko,
> 
> On Sun,  5 Dec 2010 09:23:03 -0600
> heiko at zuerker.org wrote:
> 
> > -config BR2_TARGET_MINIMAL_INITRAMFS
> > +config BR2_TARGET_ROOTFS_MINI_INITRAMFS
> 
> Something must be wrong in your patch, because it removes
> BR2_TARGET_MINIMAL_INITRAMFS, but this option does not exist in the
> current Buildroot.

Crap....
This must be due to multiple commits on my side, I'll take a look and send
an updated patch in hopefully later tonight.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org
