From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 27 Aug 2007 00:31:28 +0100
Subject: [Buildroot] [PATCH] Fix pppd make clean and small cleanup
Message-ID: <d6cda7730708261631y44e4c353p15a94212bee372da@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

   As subject sayd, this fixes make clean on pppd package (there is no
rule uninstall in pppd's makefile) and does some small bits of clean
up.

Cheers,
   Thiago A. Correa
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pppd.patch
Type: application/octet-stream
Size: 994 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070827/53ee32e9/attachment.obj 
