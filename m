From: Matt Wood <mattwood2000@gmx.net>
Date: Sat, 06 Sep 2008 20:12:10 +0200
Subject: [Buildroot] make menuconfig fails - festival??
Message-ID: <20080906181210.248920@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I just checked out the latest snapshot of buildroot and when I try to run make menuconfig, I get the following error:

...
...
...
/usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  mconf.o zconf.tab.o lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o -lncursesw -o mconf
make[1]: Leaving directory `/usr/arm/buildroot/package/config'
target/device/KwikByte/Config.in:78 warning: Overlong line
toolchain/external-toolchain/Config.in:17 warning: Overlong line
package/ipsec-tools/Config.in:7 warning: Overlong line
package/audio/festival/Config.in:11: can't open file "package/festival/speech-tools/Config.in"

Any ideas?  Thanks, Matt.
-- 
GMX Kostenlose Spiele: Einfach online spielen und Spa? haben mit Pastry Passion!
http://games.entertainment.gmx.net/de/entertainment/games/free/puzzle/6169196
