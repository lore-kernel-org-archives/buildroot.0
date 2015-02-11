From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Feb 2015 07:04:07 +0100
Subject: [Buildroot] getting X running
In-Reply-To: <C38A85CB5FEC4109BAF0D0D300EEA72C@JohanW7>
References: <C860A811EEF34E4793E67D45FD390387@JohanW7>
 <20150210142938.3d715c88@free-electrons.com>
 <C38A85CB5FEC4109BAF0D0D300EEA72C@JohanW7>
Message-ID: <20150211070407.274bc162@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Tue, 10 Feb 2015 22:33:18 +0100, Sagaert Johan wrote:

> I found no conf_opt to disable systemd.
> (Did a build with eglibc, but systemd itself seems to be broken here,,so dead end here too.)

Please make bug reports.

> m /home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtGui/5.4.0/QtGui -isystem
> /home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5 -isystem
> /home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtGui -isystem
> /home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtNetwork -isystem
> /home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtSql -isystem
> /home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtCore/5.4.0 -isystem
> /home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtCore/5.4.0/QtCore -isystem
> /home/buildroot12git2/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/qt5/QtCore -I.moc -o .obj/css/MediaAllInOne.o
> css/MediaAllInOne.cpp
> {standard input}: Assembler messages:
> {standard input}:153012: Warning: end of file not at end of a line; newline inserted
> arm-buildroot-linux-gnueabi-g++: internal compiler error: Killed (program cc1plus)

Same thing, please make bug reports.

Without bug reports, there is no way we can reproduce those problems
and fix them. And there is no way for us to improve our autobuilder
infrastructure to cover those cases.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
