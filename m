From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Sun, 25 Feb 2007 13:22:53 +0200
Subject: [Buildroot] [RFC/PATCH 3/3] fix buildroot sed handling on Mac OS X
Message-ID: <45E1718D.9080403@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Propagate HOST_SED_DIR to the dependencies script so that it may use the
local sed build as well.

-- Heikki Lindholm

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-070225-sed-hostdir.patch
Url: http://busybox.net/lists/buildroot/attachments/20070225/035efee6/attachment.pot 
