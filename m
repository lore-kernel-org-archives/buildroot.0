From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Sun, 25 Feb 2007 13:38:06 +0200
Subject: [Buildroot] Mac OS X status
Message-ID: <45E1751E.2010406@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In case there are some other parties interested in seeing buildroot 
working on a Mac OS X host, here's a short status report. Using the sed 
patch I posted and after fixing some incompatible "cp"'s, one "du -l", a 
few missing headers, and a missing "getline" function, I can build a 
simple uclibc+busybox installation up to where it would need fakeroot, 
which, unfortunately, doesn't seem to work on OS X.

-- Heikki Lindholm
