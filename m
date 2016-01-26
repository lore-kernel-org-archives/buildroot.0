From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:37:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-r128:
 bump version to 6.10.1
In-Reply-To: <1453648930-18207-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453648930-18207-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126213745.4632ed1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 24 Jan 2016 16:22:10 +0100, Bernd Kuhls wrote:
> select BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST like we do in
> xdriver_xf86-video-mach64 to have gl support in xserver.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I don't quite understand why gl support should be mandatory for this
driver, the mach64 driver or any other X.org video driver. Can you give
some details about this dependency ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
