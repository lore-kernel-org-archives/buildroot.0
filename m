From: =?big5?B?qkwgrEyn0w==?= <georgelin1984@hotmail.com>
Date: Fri, 24 Feb 2012 10:29:59 +0800
Subject: [Buildroot] How to configure the configuration to generae files in
 /usr/include/linux/mtd
Message-ID: <COL106-W49EA2D054C55257CDAE655BD6A0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi guys.

Recently, I got a job to using buildroot to generate toolchain for building our 
project code. But we dont backup the old configuration about the toolchain, I
cant build the toolchain the same as the old one.

I try my best to test many configuration to build the toolchain. But it always
miss following two diretories:

ex:

/opt/buildroot-gcc434/include/linux/mtd
/opt/buildroot-gcc434/mipsel-linux

Does anyone know how to solve the problem?

BR,
George Lin
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120224/40ca03ca/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 17641 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120224/40ca03ca/attachment-0001.obj>
