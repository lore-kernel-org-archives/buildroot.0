From: yoda zhong <yodazhong@gmail.com>
Date: Thu, 1 Sep 2016 16:24:02 -0700
Subject: [Buildroot] How to flash eMMC
In-Reply-To: <4a970631-0624-6b05-b34e-d2c44793e546@mind.be>
References: <57c76b8c.4906420a.27f90.5cd2@mx.google.com>
 <5cfb61d3-bf1a-8156-0365-132d9af802d5@mind.be>
 <57c86208.4362620a.1e3be.303d@mx.google.com>
 <4a970631-0624-6b05-b34e-d2c44793e546@mind.be>
Message-ID: <57c8b890.0890420a.6be3f.e401@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for confusing you.

I meant followings.

When I used other OS for beaglebone, I flashed eMMC with the way mentioned in 
http://elinux.org/Beagleboard:BeagleBoneBlack_Debian#Flashing_eMMC
But I failed to do this on Buildroot.

I use microSD which has two partitions, rootfs and boot and boot from microSD.
This works fine. So I want to flash the contents of microSD into embedded eMMC of
Beaglebone black. So I asked this to get some advice.

It looks like that I need to copy boot and rootfs partitions into eMMC, but I don?t know
which dev I use for this.

I wish I?m clear at this time.

Regards,
Jehun

?? ??: Arnout Vandecappelle
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160901/2d4ae1f4/attachment.html>
