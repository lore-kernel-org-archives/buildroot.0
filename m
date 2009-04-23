From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Thu, 23 Apr 2009 16:57:23 +0300
Subject: [Buildroot] quick way of doing make atngw100-expanded_defconfig
Message-ID: <49F073C3.7050104@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

It there is a quick way of doing atngw100-expanded_defconfig?
I'm trying this way but getting error (svn trunk):

make atngw100-expanded_defconfig
cp ./target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig .config
make[1]: Entering directory `/home/users/Ivan/buildroot'
package/dbus-glib/Config.in:2:error: found recursive dependency: BR2_PACKAGE_DBUS_GLIB -> BR2_PACKAGE_EXPAT -> BR2_PACKAGE_DBUS -> BR2_PACKAGE_DBUS_PYTHON -> BR2_PACKAGE_DBUS_GLIB
make[1]: *** [oldconfig] Error 1
make[1]: Leaving directory `/home/users/Ivan/buildroot'
make: [atngw100-expanded_defconfig] Error 2 (ignored)

Best regards,
Ivan
