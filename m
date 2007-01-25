From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 25 Jan 2007 23:44:36 +0100
Subject: [Buildroot] (no subject)
Message-ID: <1169765076.25586.8.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author:	Ulf Samuelsson
Date:	2007-01-25

Log:
	Here is my suggestion for supporting different BSP's
	in the same buildroot structure
	Add BINARIES_DIR directory, 
	where resulting binaries can be stored
	Typically this directory contains a subdirectory for each BSP.

	Add TARGET_BUILD_DIR directory, where BSP for different
	boards can be built without destroying results of previous
	builds. Typically each BSP would build in a subdirectory of 
	TARGET_BUILD_DIR

Modified:
	Config.in
	Makefile
	package/Makefile.in

Changeset
	Config.in
	Makefile
	package/Makefile.in

-------------- next part --------------
A non-text attachment was scrubbed...
Name: BSP_Support.patch
Type: text/x-patch
Size: 3404 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070125/ac5ae11f/attachment.bin 
