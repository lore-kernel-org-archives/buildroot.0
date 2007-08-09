From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 10 Aug 2007 00:59:04 +0300
Subject: [Buildroot] error in dbus installation
Message-ID: <46BB8E28.5090804@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Got error in dbus installation,

make[1]: Leaving directory `/root/buildroot/build_arm/dbus-1.1.1/bus'
/usr/bin/install -m 0755 -D package/dbus/S97messagebus /root/buildroot/project_build_arm/my_project/root/etc/init.d
/usr/bin/install: cannot overwrite directory `/root/buildroot/project_build_arm/my_project/root/etc/init.d' with non-directory
make: *** [/root/buildroot/project_build_arm/my_project/root/usr/bin/dbus-daemon] Error 1

seems "-D" option to install is excessive.

Best regards,
Ivan
