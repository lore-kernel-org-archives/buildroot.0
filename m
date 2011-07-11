From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Mon, 11 Jul 2011 14:59:30 +0200
Subject: [Buildroot] CONFIG_FEATURE_MDEV_LOAD_FIRMWARE not enough to get
	firmware loading working
Message-ID: <CALB96N=r5bjJKyPq+T3rsr0M5dVZVuAW-fnCG=4FGQGehjxj7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi there,

it seems that enabling CONFIG_FEATURE_MDEV_LOAD_FIRMWARE in the busybox
config is not enough to get mdev firmware loading out-of-the-box, and we
need to create an init script that ends up doing something like this:

echo /sbin/mdev > /proc/sys/kernel/hotplug

is that expected or are we missing something?

thx
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110711/961895a6/attachment.html>
