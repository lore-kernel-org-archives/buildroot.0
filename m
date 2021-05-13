From: Andrey Krasheninnikov <akrashenin@gmail.com>
Date: Thu, 13 May 2021 15:05:45 +0300
Subject: [Buildroot] Building buildroot-2014.08
Message-ID: <CAAtAE2SyKGrskeFEWhwH0E7GNRVGU=TGk2AuFrv4haxqaJHGGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!
I have buildroot-2014.08.
My linux is ubuntu-16.4.
Kernel 4.9.14. glibc-2.18.
I built zImage and dtb-file.
I need to build rootfs.
Compilation was broken for package ncurses-5.0.
Error:
-------
PATH="/home/akrashenin/buildroot/buildroot-2014.08/output/host/bin:/home/akrashenin/buildroot/buildroot-2014.08/output/host/sbin:/home/akrashenin/buildroot/buildroot-2014.08/output/host/usr/bin:/home/akrashenin/buildroot/buildroot-2014.08/output/host/usr/sbin:/home/akrashenin/bin:/home/akrashenin/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
 /usr/bin/make -j5
DESTDIR=/home/akrashenin/buildroot/buildroot-2014.08/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot
install -C
/home/akrashenin/buildroot/buildroot-2014.08/output/build/ncurses-5.0/
make[1]: ???? ? ???????
?/home/akrashenin/buildroot/buildroot-2014.08/output/build/ncurses-5.0?
cd man && /usr/bin/make INSTALL_PREFIX="" install
make[2]: ???? ? ???????
?/home/akrashenin/buildroot/buildroot-2014.08/output/build/ncurses-5.0/man?
./../mkinstalldirs /usr/man
mkdir /usr/man
mkdir: ?????????? ??????? ???????(impossible to create dir) ?/usr/man?:
???????? ? ???????(permission denied)
Makefile:56: ?????? ?????????? ??????? ??? ???? ?/usr/man?
make[2]: *** [/usr/man] ?????? 1
make[2]: ????? ?? ????????
?/home/akrashenin/buildroot/buildroot-2014.08/output/build/ncurses-5.0/man?
Makefile:94: ?????? ?????????? ??????? ??? ???? ?install? (install error)
make[1]: *** [install] ?????? 2
make[1]: ????? ?? ????????
?/home/akrashenin/buildroot/buildroot-2014.08/output/build/ncurses-5.0?
package/pkg-generic.mk:197: ?????? ?????????? ??????? ??? ????
?/home/akrashenin/buildroot/buildroot-2014.08/output/build/ncurses-5.0/.stamp_staging_installed?
make: ***
[/home/akrashenin/buildroot/buildroot-2014.08/output/build/ncurses-5.0/.stamp_staging_installed]
?????? 2
-------
What Can I do for fixing this bug?
Can I remove this package from assembly?
How can I remove this package from assembly?
-------
?????? ?????????????
???. +7(926) 24 7777 2
WhatsApp
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210513/474db5ed/attachment.html>
