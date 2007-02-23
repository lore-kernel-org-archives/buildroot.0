From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Fri, 23 Feb 2007 18:10:27 +0200
Subject: [Buildroot] [RFC/PATCH 1/3] fix buildroot sed handling on Mac OS X
Message-ID: <45DF11F3.9000108@cs.helsinki.fi>
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
Name: buildroot-070223-sed-check.patch
Url: http://busybox.net/lists/buildroot/attachments/20070223/cb11255e/attachment.pot 
