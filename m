From: Arndt Kritzner <kritzner@logicway.de>
Date: Thu, 24 Apr 2008 16:04:09 +0200
Subject: [Buildroot] irda-utils problem and (possible) patch
Message-ID: <48109359.5010204@logicway.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Irda-utils's package makefile is a stub without real function at the moment.

The patch adds functionality to download and compile the package. But on
avr32 only irattach could be built successfully.

Gru? und tsch?s
Arndt

-------------- next part --------------
A non-text attachment was scrubbed...
Name: irda.mk.20080424.diff
Type: text/x-patch
Size: 2458 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080424/472000ae/attachment.bin 
