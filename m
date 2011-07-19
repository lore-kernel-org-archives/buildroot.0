From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jul 2011 18:47:14 +0200
Subject: [Buildroot] [PATCHv4] udev: bump to 172
In-Reply-To: <4E259A07.7060800@visionsystems.de>
References: <4E25586E.1030509@visionsystems.de>
 <87ei1m4llu.fsf@macbook.be.48ers.dk>
 <4E2560AA.20603@visionsystems.de>
 <8762my4k8d.fsf@macbook.be.48ers.dk>
 <4E259A07.7060800@visionsystems.de>
Message-ID: <20110719184714.2b3205c8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 19 Jul 2011 16:51:51 +0200,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> I looked at the latest usbmount 0.0.21 package hosted by Debian. It
> uses blkid, which is part of util-linux and busybox. The busybox one
> is not capable of delivering the needed info about partitions, so we
> really need util-linux. The present package is rather old and didn't
> want to get compiled. At first the package needs to be converted to
> autotarget and bumped to the newer version, which in turn seems to
> have issues with uclibc:
> http://permalink.gmane.org/gmane.comp.embedded.ptxdist.devel/7547.

For util-linux, multiple patches have been posted to the list to update
it, but none have been merged. So I think looking at the archives of
the Buildroot list would be a good starting point.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
