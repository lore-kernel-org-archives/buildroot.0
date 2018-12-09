From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 16:53:28 +0100
Subject: [Buildroot] raspberrypi3_qt5we_defconfig fails to build qt5webengine
Message-ID: <20181209165328.1d320e03@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter and Ga?l,

According to
https://gitlab.com/buildroot.org/buildroot/-/jobs/131217091, the
raspberrypi3_qt5we_defconfig fails to build qt5webengine:

[...]
Qt WebEngine on Linux requires clang or GCC.
QtWebEngine will not be built.
[...]
>>> qt5webengine 5.11.2 Installing to target
cp -dpf /builds/buildroot.org/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.* /builds/buildroot.org/buildroot/output/target/usr/lib
cp: cannot stat '/builds/buildroot.org/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libQt5WebEngine*.so.*': No such file or directory
package/pkg-generic.mk:315: recipe for target '/builds/buildroot.org/buildroot/output/build/qt5webengine-5.11.2/.stamp_target_installed' failed

Do you have any idea?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
