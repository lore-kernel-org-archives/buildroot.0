From: Robin Mordasiewicz <rmordasiewicz@samuelmanutech.com>
Date: Tue, 19 Dec 2006 23:13:04 -0500 (EST)
Subject: [Buildroot] make clean error
Message-ID: <Pine.LNX.4.64.0612192312010.31862@smtcorms05.samuelmanutech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using an svn checkout from yesterday I built fine but when I run
make clean I get an error

make -j1 -C /var/home/rmordasiewicz/busybox/buildroot/toolchain_build_i386/ccache-2.4 uninstall
make[1]: Entering directory `/var/home/rmordasiewicz/busybox/buildroot/toolchain_build_i386/ccache-2.4'
make[1]: *** No rule to make target `uninstall'.  Stop.
make[1]: Leaving directory `/var/home/rmordasiewicz/busybox/buildroot/toolchain_build_i386/ccache-2.4'
make: *** [ccache-clean] Error 2
