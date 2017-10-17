From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Oct 2017 11:01:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/supertuxkart: needs freetype
In-Reply-To: <20170929190140.32645-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 29 Sep 2017 21:01:40 +0200")
References: <20170929190140.32645-1-bernd.kuhls@t-online.de>
Message-ID: <87po9mkv1o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > https://github.com/supertuxkart/stk-code/blob/master/CMakeLists.txt#L231
 > Build would fail without this patch using this defconfig:

 > BR2_x86_64=y
 > BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 > BR2_TOOLCHAIN_BUILDROOT_CXX=y
 > BR2_PACKAGE_SUPERTUXKART=y
 > BR2_PACKAGE_MESA3D=y
 > BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
 > BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 > BR2_PACKAGE_XORG7=y

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
