From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 08 May 2008 02:43:08 +0200
Subject: [Buildroot] AVR32 toolchain
Message-ID: <1210207388.2385.6.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I checked if I could build with the new gcc-4.2.2 /binutils/gdb-4.7.1

My patches for buildroot are at
ftp://www.at91.com/pub/buildroot/avr32-tools-20080508.patch
287 kB so I did not want to send to the list.

The build of gcc-4.2.2 at least completes.
The binutils fails, complaining about building for
i386-pc-linux-gnu.
gdb also fails.

Some patches will be duplicated with the patches in the toolchain
directory, but they should go away in a final version.

-- 
Best Regards
Ulf Samuelsson
Atmel Nordic AB
Mail: Box 2033, 174 50 Sundbyberg
Visit:Kavalleriv?gen 24, 174 58 Sundbyberg
Phone: +46 8 441 54 22, GSM: +46 706 22 44 57
eMail: ulf at atmel.com
