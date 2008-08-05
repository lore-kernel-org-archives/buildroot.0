From: Matuschka, Sebastian <Sebastian.Matuschka@gcd-solutions.de>
Date: Tue, 5 Aug 2008 09:45:53 +0200
Subject: [Buildroot] gdb debugger for atmel is not possible
Message-ID: <49ED01FC03EE524BB7BB258E8F93BFF32654FC@bfl-exchange-1.BFL.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

when I enable the Gdb debugger or server for the target (Atmel AVR32) i
get the following message:
configure: error: "*** Gdb does not support native target
avr32-unknown-linux-uclibc"
make[2]: *** [configure-gdb] Error 1
make[2]: Leaving directory
`/atmel/buildrootWork/build_avr32/gdb-6.7.1-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/atmel/buildrootWork/build_avr32/gdb-6.7.1-target'
make: *** [/atmel/buildrootWork/build_avr32/gdb-6.7.1-target/gdb/gdb]
Error 2

I'm using the most recent buildroot. How can I build gdb for avr32?
Could someone add this to buildroot please?
I attached my buildroot .config in case it is necessary.
Thanks
Sebastian

-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.config
Type: application/octet-stream
Size: 28659 bytes
Desc: buildroot.config
Url : http://busybox.net/lists/buildroot/attachments/20080805/adabd653/attachment-0001.obj 
