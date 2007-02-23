From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Fri, 23 Feb 2007 18:11:03 +0200
Subject: [Buildroot] [RFC/PATCH 3/3] fix buildroot sed handling on Mac OS X
Message-ID: <45DF1217.3020703@cs.helsinki.fi>
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
Name: buildroot-070223-sed-hostdir.patch
Url: http://busybox.net/lists/buildroot/attachments/20070223/f64fbe11/attachment.pot 
