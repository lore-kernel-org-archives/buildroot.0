From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 20 Jul 2011 16:34:22 +0200
Subject: [Buildroot] [PATCHv4] udev: bump to 172
In-Reply-To: <20110719184714.2b3205c8@skate>
References: <4E25586E.1030509@visionsystems.de>	<87ei1m4llu.fsf@macbook.be.48ers.dk>	<4E2560AA.20603@visionsystems.de>	<8762my4k8d.fsf@macbook.be.48ers.dk>	<4E259A07.7060800@visionsystems.de>
 <20110719184714.2b3205c8@skate>
Message-ID: <4E26E76E.4030500@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 19.07.2011 18:47, schrieb Thomas Petazzoni:
> Le Tue, 19 Jul 2011 16:51:51 +0200,
> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>
>> I looked at the latest usbmount 0.0.21 package hosted by Debian. It
>> uses blkid, which is part of util-linux and busybox. The busybox one
>> is not capable of delivering the needed info about partitions, so we
>> really need util-linux. The present package is rather old and didn't
>> want to get compiled. At first the package needs to be converted to
>> autotarget and bumped to the newer version, which in turn seems to
>> have issues with uclibc:
>> http://permalink.gmane.org/gmane.comp.embedded.ptxdist.devel/7547.
> For util-linux, multiple patches have been posted to the list to update
> it, but none have been merged. So I think looking at the archives of
> the Buildroot list would be a good starting point.

Have found one, seems to compile after applying the uclibc patch.

Yegor
