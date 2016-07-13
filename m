From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Jul 2016 21:40:56 +0200
Subject: [Buildroot] [PATCH 06/12 v8] package/eudev: allow building
	only	libudev
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <cd74a2f4b20ac593f3cc7aa0dc1500d20c75a3e7.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <83ii5dxs42.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 12 Jul 2016 00:16:29 +0200 schrieb Yann E. MORIN:

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/eudev/Config.in | 48 +++++++++++++++++++++++++++++++++---------------
>  package/eudev/eudev.mk  | 42 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 15 deletions(-)

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(run-time tested libdrm, mesa3d, libcec & kodi 17 using libudev
 on a system using BR2_ROOTFS_DEVICE_CREATION_STATIC=y)
