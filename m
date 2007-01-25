From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 26 Jan 2007 00:00:30 +0100
Subject: [Buildroot] [PATCH] Support building different boards in same
	buildroot	structure (Resend)
Message-ID: <1169766030.25586.17.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: Ulf Samuelsson
Date:   2007-01-25

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

-------
Had to resend since previous patch contained an unseen bugfix for
the "Prepatory patch to Config.in to allow AT91/AVR32 support"
With the resends, the Prepatory patch is fixed inside itself.

Best Regards
Ulf Samuelsson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: BSP_Support.patch
Type: text/x-patch
Size: 3142 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070126/e74733df/attachment.bin 
