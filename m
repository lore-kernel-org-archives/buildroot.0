From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 23 Jul 2015 15:45:16 +0200
Subject: [Buildroot] qt5base build issue
Message-ID: <CAGm1_kumsLYH8RmBn3WWr64_yN1mjhc5DGhiZfpqCSdc3jvPtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Toolchain: Sourcery CodeBench ARM 2014.05

BR2_PACKAGE_QT5_JSCORE_AVAILABLE=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_CONFIG_FILE=""
BR2_PACKAGE_QT5BASE_NETWORK=y
BR2_PACKAGE_QT5BASE_SQL=y
BR2_PACKAGE_QT5BASE_SQLITE_NONE=y
BR2_PACKAGE_QT5BASE_TEST=y
BR2_PACKAGE_QT5BASE_XML=y
BR2_PACKAGE_QT5BASE_GUI=y
BR2_PACKAGE_QT5BASE_WIDGETS=y
BR2_PACKAGE_QT5BASE_LINUXFB=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA=""
BR2_PACKAGE_QT5BASE_PRINTSUPPORT=y
BR2_PACKAGE_QT5SVG=y

During compilation I get following error:

Running configuration tests...
Failed to process makespec for platform 'devices/linux-buildroot-g++'
Project ERROR: Compiler
/home/user/MyProjects/oss/buildroot/prods1/host/usr/bin/ccache
/home/user/MyProjects/oss/buildroot/prods1/host/usr/bin/arm-none-linux-gnueabi-g++
not found. Check the value of CROSS_COMPILE -device-option
Could not read qmake configuration file
/home/user/MyProjects/oss/buildroot/prods1/build/qt5base-5.5.0/mkspecs/devices/linux-buildroot-g++/qmake.conf.
Error processing project file: /dev/null
package/pkg-generic.mk:146: recipe for target
'/home/user/MyProjects/oss/buildroot/prods1/build/qt5base-5.5.0/.stamp_configured'
failed

Any idea? I also tried uclibc-ng toolchain - same result.

Regards,
Yegor
