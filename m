From: Benedict, Michael <MBenedict@twacs.com>
Date: Thu, 5 Apr 2007 16:06:38 -0500
Subject: [Buildroot] NPTL build fails by default, see uClibc bug #0000820
Message-ID: <CF7E46FCFF66AD478BB72724345289EC2795B3@twx-exch01.twacs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If I configure buildroot to build uClibc with NPTL, I get an error like
the one in uClibc bug #820.  If I change the uclibc.mk to define
LINUXTHREADS_OLD in addition to UCLIBC_HAS_THREADS_NATIVE, everything
works fine.  See attached patchfile.
	-Michael
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclibc.mk.patch
Type: application/octet-stream
Size: 1543 bytes
Desc: uclibc.mk.patch
Url : http://busybox.net/lists/buildroot/attachments/20070405/96f8a3c8/attachment.obj 
