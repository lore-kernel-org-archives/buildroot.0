From: Benedict, Michael <MBenedict@twacs.com>
Date: Thu, 5 Apr 2007 16:05:56 -0500
Subject: [Buildroot] Udev with BR2_PACKAGE_UDEV_VOLUME_ID=y build problems
	(patch attached)
Message-ID: <CF7E46FCFF66AD478BB72724345289EC2795B2@twx-exch01.twacs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was experiencing intermittent problems trying to get libvolume to
compile with udev for the PowerPC.  Defining a target for the install
rule seemed to do the trick.  I think this is assumed to be built by
default, even though "EXTRAS=extras/volume_id" is only passed in for
this rule.  See the attached patch file.
	Cheers,
		Michael
-------------- next part --------------
A non-text attachment was scrubbed...
Name: udev.mk.patch
Type: application/octet-stream
Size: 1045 bytes
Desc: udev.mk.patch
Url : http://busybox.net/lists/buildroot/attachments/20070405/486ce8c1/attachment.obj 
