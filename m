From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 21 Aug 2007 13:55:48 +0200
Subject: [Buildroot] error in dbus installation
In-Reply-To: <46BB8E28.5090804@promwad.com>
References: <46BB8E28.5090804@promwad.com>
Message-ID: <20070821115548.GC15996@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 10, 2007 at 12:59:04AM +0300, Ivan Kuten wrote:
>Hello,
>
>Got error in dbus installation,
>
>make[1]: Leaving directory `/root/buildroot/build_arm/dbus-1.1.1/bus'
>/usr/bin/install -m 0755 -D package/dbus/S97messagebus /root/buildroot/project_build_arm/my_project/root/etc/init.d
>/usr/bin/install: cannot overwrite directory `/root/buildroot/project_build_arm/my_project/root/etc/init.d' with non-directory
>make: *** [/root/buildroot/project_build_arm/my_project/root/usr/bin/dbus-daemon] Error 1
>
>seems "-D" option to install is excessive.

Should be fixed in r19613. Thanks for mentioning this
