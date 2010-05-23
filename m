From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 23 May 2010 11:26:19 +0200
Subject: [Buildroot] extra patch to add to the package/qt directory
Message-ID: <5C407878DFA842C98E7FF55AC99B4CF6@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
 
 
This patch is needed in order to build QT 4.6.2   Webkit and Script Module
with uclibc 0.9.31
 
 
the qt.mk  has already been changed ( x86x86fix) so i send this patch
instead of making a patch over the package/qt dir.
 
the patch is a workaround for pthread_getattr_np
i refer to this
:http://lists.busybox.net/pipermail/buildroot/2010-March/033000.html
 
 
Johan
 
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100523/4f258bdb/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qt-4.6.2-pthread_getattr_np.patch
Type: application/octet-stream
Size: 3819 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100523/4f258bdb/attachment.obj>
