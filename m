From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 10:06:23 +0200
Subject: [Buildroot] [PATCH 0/8] Various OpenGL-related updates
In-Reply-To: <1405575780-26496-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405575780-26496-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140717100623.3e6cbf29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu, 17 Jul 2014 07:42:52 +0200, Bernd Kuhls wrote:

> Bernd Kuhls (8):
>   xlib_libxshmfence: New package
>   package/mesa3d: Fix optional DRI3 support
>   package/mesa3d: Depend on xorg meta package instead of
>     xserver_xorg-server
>   package/mesa3d: Remove dependency for the libxml2 module of
>     host-python
>   package/mesa3d: Bump to version 10.2.3

I've applied those first 5 patches.

>   libglu: New package
>   libglew: New package
>   xdriver_xf86-video-intel: Bump version to 2.99.911

I'll look at those ones a bit later, hopefully tonight.

Thanks a lot for updating the series.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
