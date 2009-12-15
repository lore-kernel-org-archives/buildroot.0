From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 15 Dec 2009 17:49:06 +0100
Subject: [Buildroot] mtd-utils  mkfs.ubifs build fails : can't find uuid.h
Message-ID: <06EA853CB7CC4BCC80BC4655066CAE79@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
When building i noticed that the build of mkfs.ubifs fails.
It seems to be that the uuid.h is missng from the staging include dir (
staging_dir/usr/include/uuid/uuid.h)
 
The uuid lib is part of the e2fsprogs package and i think that its makefile
should be modified so that the uuid.h is added to the staging_dir
 
Johan
 
 
 
 
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091215/c8ef649f/attachment.htm>
