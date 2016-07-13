From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Jul 2016 21:41:52 +0200
Subject: [Buildroot] [PATCH 10/12 v8] package/libudev: make it selectable
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <a9b2e3dfb8a1dcdde4e02fe166e841848586521d.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <05ii5dxs42.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 12 Jul 2016 00:16:33 +0200 schrieb Yann E. MORIN:

>  package/libudev/Config.in | 7 +++++++
>  1 file changed, 7 insertions(+)

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(run-time tested libdrm, mesa3d, libcec & kodi 17 using libudev
 on a system using BR2_ROOTFS_DEVICE_CREATION_STATIC=y)
