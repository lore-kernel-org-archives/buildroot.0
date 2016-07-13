From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Jul 2016 21:41:09 +0200
Subject: [Buildroot] [PATCH 07/12 v8] package/libudev: new virtual
	package
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <b8ff4808353764b7390ab4fde166e43cf5ebbdd7.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <l3ii5dxs42.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 12 Jul 2016 00:16:30 +0200 schrieb Yann E. MORIN:

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/Config.in          | 1 +
>  package/libudev/Config.in  | 6 ++++++
>  package/libudev/libudev.mk | 7 +++++++

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(run-time tested libdrm, mesa3d, libcec & kodi 17 using libudev
 on a system using BR2_ROOTFS_DEVICE_CREATION_STATIC=y)
