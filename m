From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 17 Mar 2014 07:32:37 +0100
Subject: [Buildroot] Error building Qt5Multimedia
Message-ID: <53269705.6060805@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
I ran into another error building Qt5:

cp: impossibile eseguire stat di 
"/home/marco/dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libqgsttools*.so.*": 
File o directory non esistente

It says it doesn't find libqgsttools*.so.*, I searched in the nconfig 
(using F8) and using find -name in the package directory without chance.

Which package is required?

Attached the .config file.
Thanks
Marco

-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 52186 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140317/28960e03/attachment-0001.wsdl>
