From: Simon Pasch <fpasch@googlemail.com>
Date: Mon, 10 Mar 2008 10:59:49 +0100
Subject: [Buildroot] make source fails
Message-ID: <f90898420803100259u1e2cb011gd2536eea662f3ef7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"make source" fails, because busybox-Makefile contains a wrong
dependency (BUSYBOX_CONFIG_FILE)

This patch removes the dependency from target busybox-source.

Greets

Simon
-------------- next part --------------
A non-text attachment was scrubbed...
Name: busybox-source.patch
Type: text/x-patch
Size: 365 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080310/aca8a2a5/attachment-0001.bin 
