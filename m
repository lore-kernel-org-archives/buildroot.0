From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Tue, 8 Apr 2008 13:40:13 +0100
Subject: [Buildroot] Hi There
Message-ID: <200804081340.13053.buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I've been using buildroot via atmel's AVR32 git tree for some time, and I 
started to fix problems. It's been suggested that I push my 'general' patches 
to you guys so they will come back down the feeding chain to us :-)

First a question : is there an official git repositiory somewhere ? I've 
quickly grown to rely on git, and it would make things easier for me...

Alternatively, should I push patch emails directly to this list ? I do try to 
make them as small as possible.

What I have to push right now is :
+ NCURSES: Fixed GNU URL pathname for ncurses
+ SCREEN: Added support for GNU screen
+ NCURSES: ncurses install procedure now also copies the 'extra' libraries 
like libpanel.so into the target. This allows tools like 'iptraf' to work
+ IPTRAF: Added support for 'iptraf' curses based traffic monitor
+ U-BOOT: A patch to fix the fw_printenv compilation
+ U-BOOT: Added support for linux userland environmnet access
+ U-BOOT: Documented that the fw_setenv will only work if the MTD partition is 
R/W

Please advise.
Michel
