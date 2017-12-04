From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 04 Dec 2017 08:20:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/icu: bump version to 60.1
References: <20171203194140.8138-1-bernd.kuhls@t-online.de>
 <20171203210012.0cb2bc4c@windsurf.home>
Message-ID: <pi9ffex2o8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 03 Dec 2017 21:00:12 +0100 schrieb Thomas Petazzoni:

> Curious: how many packages that depend on ICU did you build? From past
> experience, each major ICU bump very often causes a number of build
> failures in other packages.

this defconfig builds fine:

BR2_x86_64=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/
tarballs/br-x86-64-core2-full-2017.05-1078-g95b1dae.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_MPD=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_NODEJS=y
BR2_PACKAGE_PHP=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PYICU=y
BR2_PACKAGE_HARFBUZZ=y
BR2_PACKAGE_RAPTOR=y
BR2_PACKAGE_XERCES=y
BR2_PACKAGE_CPPCMS=y
BR2_PACKAGE_CPPCMS_ICU=y
BR2_PACKAGE_DOVECOT=y
BR2_PACKAGE_ZNC=y

> What are the changes between 59.1 and 60.1 ? Anything significant that
> has a chance of breaking packages that depend on ICU ?

The release notes can be found here:
http://site.icu-project.org/download/60
and, afaics, they do not include a hint for breaking changes.

Regards, Bernd
