From: yoda zhong <yodazhong@gmail.com>
Date: Thu, 1 Sep 2016 10:14:51 -0700
Subject: [Buildroot] How to flash eMMC
In-Reply-To: <5cfb61d3-bf1a-8156-0365-132d9af802d5@mind.be>
References: <57c76b8c.4906420a.27f90.5cd2@mx.google.com>
 <5cfb61d3-bf1a-8156-0365-132d9af802d5@mind.be>
Message-ID: <57c86208.4362620a.1e3be.303d@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your opinion.

Following is the related kernel log. But I?m not sure where I should copy 
boot/* and rootfs/* of microSD to.

[    1.735984] mmc0: host does not support reading read-only switch, assuming write-enable
[    1.751294] mmc0: new high speed SDHC card at address aaaa
[    1.762798] mmcblk0: mmc0:aaaa SS08G 7.40 GiB 
[    1.774493] mmc1: new high speed MMC card at address 0001
[    1.783724]  mmcblk0: p1 p2
[    1.806009] mmcblk1: mmc1:0001 MMC04G 3.60 GiB 
[    1.812103] mmcblk1boot0: mmc1:0001 MMC04G partition 1 2.00 MiB
[    1.828636] mmcblk1boot1: mmc1:0001 MMC04G partition 2 2.00 MiB
[    1.876569]  mmcblk1: p1
[    1.921456] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Opts: (null)
[    1.930280] VFS: Mounted root (ext4 filesystem) on device 179:2.
[    1.950790] devtmpfs: mounted
[    1.956266] Freeing unused kernel memory: 1024K (c0c00000 - c0d00000)
[    2.113623] EXT4-fs (mmcblk0p2): re-mounted. Opts: data=ordered

Following is the related dev list.

mmcblk0
mmcblk0p1
mmcblk0p2
mmcblk1
mmcblk1boot0
mmcblk1boot1
mmcblk1p1

Best,
Jehun

?? ??: Arnout Vandecappelle
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160901/20914805/attachment.html>
