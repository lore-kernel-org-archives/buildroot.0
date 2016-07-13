From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Jul 2016 21:41:33 +0200
Subject: [Buildroot] [PATCH 08/12 v8] package/eudev: provides libudev
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <32369f6d41cbf57c3f72bbe428fb422f0358e2b7.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <d4ii5dxs42.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 12 Jul 2016 00:16:31 +0200 schrieb Yann E. MORIN:

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/eudev/Config.in | 4 ++++
>  package/eudev/eudev.mk  | 4 +++-

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(run-time tested libdrm, mesa3d, libcec & kodi 17 using libudev
 on a system using BR2_ROOTFS_DEVICE_CREATION_STATIC=y)
