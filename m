From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 01 Apr 2015 10:41:31 -0300
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 Glamor depends on dri3
In-Reply-To: <1426429839-6908-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426429839-6908-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <551BF58B.1060805@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/15/2015 11:30 AM, Bernd Kuhls wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Found it via another defconfig (simplified) when testing EGL/GLES
webkitgtk mojo:

BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV=y

Thanks.
Regards.
