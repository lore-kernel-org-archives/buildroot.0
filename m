From: Doug the RockRat <rickyrockrat@yahoo.com>
Date: Fri, 23 Feb 2007 04:56:46 -0800 (PST)
Subject: [Buildroot] PATCH to fix mkdosfs for target
Message-ID: <162313.80492.qm@web62013.mail.re1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fsck.msdos is missing for the target. This will do a
complete install instead of just the partial one now.


 
____________________________________________________________________________________
Looking for earth-friendly autos? 
Browse Top Cars by "Green Rating" at Yahoo! Autos' Green Center.
http://autos.yahoo.com/green_center/
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mkdosfs.diff
Type: text/x-patch
Size: 701 bytes
Desc: 1474655765-mkdosfs.diff
Url : http://busybox.net/lists/buildroot/attachments/20070223/5e965a02/attachment.bin 
