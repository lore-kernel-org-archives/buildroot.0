From: Benjamin Delagoutte <benjamin.delagoutte@gmail.com>
Date: Mon, 20 Nov 2006 11:19:31 +0100
Subject: [Buildroot] [patch] Space instead of tab separated fields in
	device_table.txt
Message-ID: <30f88efd0611200219h323136f9h4b43e9a694d85a2d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I noticed one line in generic device_table.txt has its field separated with
spaces whereas others have tab-separated fields.

Benjamin

Index: target/generic/device_table.txt
=================================--- target/generic/device_table.txt     (r?vision 16473)
+++ target/generic/device_table.txt     (copie de travail)
@@ -64,7 +64,7 @@
 /dev/tty       c       666     0       0       5       0       -
-       -
 /dev/tty       c       666     0       0       4       0       0
1       8
 /dev/ttyp      c       666     0       0       3       0       0
1       10
-/dev/ptyp      c       666     0       0       2       0       0
1       10
+/dev/ptyp      c       666     0       0       2       0       0
1       10
 /dev/ptmx      c       666     0       0       5       2       -
-       -
 /dev/ttyP      c       666     0       0       57      0       0
1       4
 /dev/ttyS      c       666     0       0       4       64      0
1       4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061120/97c4b467/attachment.htm 
