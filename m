From: Torsten Mohr <tmohr@s.netic.de>
Date: Tue, 15 Mar 2011 18:29:12 +0100
Subject: [Buildroot] u-boot, setup SD card, BeagleBoard-xM
In-Reply-To: <20110315112216.5f3a91e2@surf>
References: <201103132130.24022.tmohr@s.netic.de>
	<201103142205.36239.tmohr@s.netic.de>
	<20110315112216.5f3a91e2@surf>
Message-ID: <201103151829.12640.tmohr@s.netic.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

i found that hint when i googled, but directly after it the note that the 
patch is deprecated as it is included in u-boot since version x.y.z.

I have to say that i did not verify what version comes with buildroot (it 
actually is 2010.06), but the patched version was quite old.

I configured "omap3_beagle", which becomes omap3_beagle_config for u-boot.

In the mailing list for beagleboard it seems somebody else also has weird 
output from u-boot.bin that comes with buildroot.


Best regards,
Torsten.


Am Dienstag, 15. M?rz 2011, 11:22:16 schrieb Thomas Petazzoni:
> On Mon, 14 Mar 2011 22:05:36 +0100
> 
> Torsten Mohr <tmohr@s.netic.de> wrote:
> > It looks that buildroot-2010.11 / u-boot does not work properly?
> 
> Does U-Boot mainline completely support the BeagleBoard XM ? Did you
> select the appropriate U-Boot configuration ?
> 
> Regards,
> 
> Thomas
