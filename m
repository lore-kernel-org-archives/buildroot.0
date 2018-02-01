From: AAlex_ <earthquake.de@freenet.de>
Date: Thu, 1 Feb 2018 01:32:28 -0700 (MST)
Subject: [Buildroot] Further partition creation with genimage fails
Message-ID: <1517473948652-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
trying to define a further (third) partition within the disk.img fails. With
error messge:
/genext2fs: couldn't allocate a block (no free space)
ext4(data.ext4): failed to generate data.ext4/

Added to the disk.img block in genimage config file a partition named
data.ext4
(complete config script  genimage config on pastebin
<https://pastebin.com/yN1Zfb5r>   )

Creating manually the partition file via dd within the output/image folder
works. 
But the goal is creating the partition file when building the system.

Thanks for help or proposal

Regards,
AAlex



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
