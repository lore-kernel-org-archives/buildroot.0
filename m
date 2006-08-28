From: Bill Somerville <bill.3@classdesign.com>
Date: Mon, 28 Aug 2006 01:17:53 +0100
Subject: [Buildroot] libsysfs doesn't build correctly
Message-ID: <1156724273.30424.9.camel@wallace.classdesign.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsysfs builds with the staging prefix in the installed libtool
archive, attached is a patch to resolve this.

Some warnings occur when DirectFB builds with it but I think these can
be safely ignored as libtool is just griping about libsysfs.la not being
where it says it should be ($(STAGING_DIR)/usr/lib instead of /usr/lib).

Bill Somerville


-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-svn.patch
Type: text/x-patch
Size: 1729 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060828/36a6b9fb/attachment.bin 
