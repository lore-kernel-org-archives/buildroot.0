From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Mon, 11 Jul 2011 16:51:19 +0200
Subject: [Buildroot] CONFIG_FEATURE_MDEV_LOAD_FIRMWARE not enough to get
 firmware loading working
In-Reply-To: <20110711154548.1e1f6beb@skate>
References: <CALB96N=r5bjJKyPq+T3rsr0M5dVZVuAW-fnCG=4FGQGehjxj7Q@mail.gmail.com>
 <20110711154548.1e1f6beb@skate>
Message-ID: <CALB96N=xr3S4pnyCb9zbr-ZQAkmx=iLazivB5=qXjZrpq5NSUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 11, 2011 at 3:45 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),y)
>        $(call
> KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config)
> endif
>
> If Buildroot is not responsible of compiling your kernel, then it's up
> to you to adjust your kernel configuration similarly.
>

argh... thanks for your quick answer. we are indeed rebuilding our own
kernel and were not aware of this config option!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110711/043a6e77/attachment-0001.html>
