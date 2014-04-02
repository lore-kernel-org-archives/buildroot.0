From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 02 Apr 2014 22:01:31 +0200
Subject: [Buildroot] [PATCH 5/6] package/x11-video-drivers: do not
	select, but depends on mesa3d
References: <cover.1396302677.git.yann.morin.1998@free.fr>
 <887ad694204dc2032ade7bdacb8e9d9aa48205ac.1396302677.git.yann.morin.1998@free.fr>
Message-ID: <qt6u0bxtl5.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:887ad694204dc2032ade7bdacb8e9d9aa48205ac.1396302677.git.yann.morin.199
8 at free.fr: 

> a/package/x11r7/xdriver_xf86-video-intel/Config.in +++
> b/package/x11r7/xdriver_xf86-video-intel/Config.in @@ -1,5 +1,7 @@

[...]

> +comment "xf86-video-intel needs mesa3d"
> +     depends on BR2_PACKAGE_MESA3D

"depends on !BR2_PACKAGE_MESA3D"

Regards, Bernd
