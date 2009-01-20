From: Quick X <quickx@hotmail.com>
Date: Mon, 19 Jan 2009 17:19:27 -0800
Subject: [Buildroot] Installing Buildroot built u-boot on an
	AT91SAM9261EK?
Message-ID: <BAY124-W5143F6E9FF804F523517D4D2D00@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The Angstrom TCL script will work, for the u-boot environment, with the newest u-boot that buildroot makes (u-boot 2009-01-rc1) or later.  If your using the older u-boot-1.2.0-atmel, then I found that you have to change the "0x4200" to "0x2000" in the "set sectorSize [expr 0x4200 - 4]" part of the tcl script, for the correct CRC to be generated.
_________________________________________________________________
Keep in touch and up to date with friends and family. Make the connection now.
http://www.microsoft.com/windows/windowslive/
