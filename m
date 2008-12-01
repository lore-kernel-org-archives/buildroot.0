From: Burt Silverman <bsilverman@effician.com>
Date: Mon, 1 Dec 2008 12:09:17 -0500
Subject: [Buildroot]  svn commit: trunk/buildroot/package:  libraw1394
Message-ID: <9D47D7435BD5094E806E5C2216B8500112001E@itchy.rtp.effician.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The .compiled .PHONY target shown in the libraw1394.mk file is not
removed when making the libraw1394-clean target.  This is a problem for
anyone issuing the "make libraw1394-clean" command.  The same problem
appears in the pciutils package.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081201/885534a9/attachment.htm 
