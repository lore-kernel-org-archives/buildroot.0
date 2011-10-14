From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 14 Oct 2011 15:55:50 +0100
Subject: [Buildroot] [PATCH 0/9] Miscellaneous patch series
Message-ID: <4E984D76.9040108@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series of patches have a number of different fixes

First one adds option to set the timezone in the default target skeleton

Second one allows gdbserver to be copied from an external toolchain, 
comments on this welcome

The Qt patches allow compilation for X11, add back Qt Commercial 
support, all tighter control over fonts on target and fix specifying a 
custom config
