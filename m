From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 6 Sep 2008 20:30:44 +0200
Subject: [Buildroot] make menuconfig fails - festival??
In-Reply-To: <20080906181210.248920@gmx.net>
References: <20080906181210.248920@gmx.net>
Message-ID: <200809062030.45703.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt Wood, 06.09.2008:
> I just checked out the latest snapshot of buildroot and when I try to run make menuconfig, I get the following error:
> 
> ...
> ...
> ...
> /usr/bin/gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE  -g -O2  mconf.o zconf.tab.o lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o -lncursesw -o mconf
> make[1]: Leaving directory `/usr/arm/buildroot/package/config'
> target/device/KwikByte/Config.in:78 warning: Overlong line
> toolchain/external-toolchain/Config.in:17 warning: Overlong line
> package/ipsec-tools/Config.in:7 warning: Overlong line
> package/audio/festival/Config.in:11: can't open file "package/festival/speech-tools/Config.in"
> 
> Any ideas?  Thanks, Matt.

2 hours ago I sent a patch that fixes it. See the mail with subject
Re: [Buildroot] [PATCH] svn commit: trunk/buildroot/package: audio

Markus
