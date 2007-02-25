From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Sun, 25 Feb 2007 13:22:38 +0200
Subject: [Buildroot] [RFC/PATCH 1/3] fix buildroot sed handling on Mac OS X
Message-ID: <45E1717E.1030305@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Improve the checking of sed by adding some common GNU sed installation
names (gsed/gnused), checking for a basic OS X sed feature in command
line option handling, checking the actual result of the sed run against
the expected result, and placing common code for the check under
toolchain/dependencies/.

-- Heikki Lindholm

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-070225-sed-check.patch
Url: http://busybox.net/lists/buildroot/attachments/20070225/a7aa3d03/attachment.pot 
