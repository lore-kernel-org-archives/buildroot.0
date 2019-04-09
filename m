From: Serhii Sakhno <sergei.sakhno@gmail.com>
Date: Tue, 9 Apr 2019 11:02:41 +0300
Subject: [Buildroot] systemd 241 build after second start make
Message-ID: <CAOqJNTfVnFqzvX01aQPgFTJTtodJVLyUQRV3KOi11G31AsuZ7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hile first build< i got error:

In file included from ../src/core/dbus-manager.c:10:0:
../src/basic/build.h:4:10: fatal error: version.h: No such file or directory
 #include "version.h"
          ^~~~~~~~~~~
compilation terminated.
[187/788] Compiling C object
'src/udev/3eb56e7@@udev-basic at sta/.._libudev_libudev-device.c.o'.
[188/788] Generating systemd.fr.catalog with a meson_exe.py custom command.
[189/788] Generating systemd.it.catalog with a meson_exe.py custom command.
[190/788] Generating systemd.pl.catalog with a meson_exe.py custom command.
[191/788] Generating systemd.ru.catalog with a meson_exe.py custom command.
[192/788] Compiling C object
'src/udev/3eb56e7@@udev-basic at sta/.._libudev_libudev-queue.c.o'.
[193/788] Linking static target src/udev/libudev_static.a.
[194/788] Compiling C object
'src/udev/3eb56e7@@udev at sha/.._libsystemd_disable-mempool.c.o'.
[195/788] Generating systemd.zh_TW.catalog with a meson_exe.py custom command.
[196/788] Compiling C object
'src/udev/3eb56e7@@udev-basic at sta/.._libudev_libudev-util.c.o'.
[197/788] Generating cap-list.txt with a meson_exe.py custom command.
[198/788] Compiling C object 'src/udev/3eb56e7@@ata_id@exe/ata_id_ata_id.c.o'.
[199/788] Generating systemd.bg.catalog with a meson_exe.py custom command.
[200/788] Generating systemd.zh_CN.catalog with a meson_exe.py custom command.
[201/788] Generating systemd.be.catalog with a meson_exe.py custom command.
[202/788] Generating systemd.pt_BR.catalog with a meson_exe.py custom command.
[203/788] Generating errno-list.txt with a meson_exe.py custom command.
[204/788] Generating af-list.txt with a meson_exe.py custom command.
[205/788] Generating arphrd-list.txt with a meson_exe.py custom command.
[206/788] Generating audit_type-list.txt with a meson_exe.py custom command.
[207/788] Generating load-fragment-gperf.gperf with a meson_exe.py
custom command.
[208/788] Generating ip-protocol-list.txt with a meson_exe.py custom command.
[209/788] Generating keyboard-keys-list.txt with a meson_exe.py custom command.
[210/788] Generating version.h with a custom command.
ninja: build stopped: subcommand failed.
make: *** [/builds/new_numus/ntc_images/standard/output/build/systemd-241/.stamp_built]
Error 1
package/pkg-generic.mk:238: recipe for target
'/builds/new_numus/ntc_images/standard/output/build/systemd-241/.stamp_built'
failed

If again start build (without clean) all finished successful. Problem,
after merge with master of buildroot few days ago.

Regards,
Sakhno Serhii
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190409/be6c3839/attachment.html>
