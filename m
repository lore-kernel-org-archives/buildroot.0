From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 21 Feb 2017 08:55:14 +0100
Subject: [Buildroot] Enabling GLX without mesa DRI driver
Message-ID: <1674359.6j3vDXU7qK@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

I try to clean up libGL provided by imx-gpu-viv-x11 package and I would like 
to have your advice.

In xserver_xorg-server.mk, GLX extension is enabled only if 
BR2_PACKAGE_MESA3D_DRI_DRIVER is enabled.

Consequently, it seems OpenGL is not available with Gallium, Nvidia and Radeon 
or I missed something?


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
