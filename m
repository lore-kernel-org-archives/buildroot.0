From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Wed, 11 Jun 2008 09:40:07 +0200
Subject: [Buildroot] kernel image size depends on toolchain?
Message-ID: <484F8157.2050902@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Its probably one of these "again" questions but I couldn't get a 
reasonable/sound answer.

I'm building an arm rootfs and an 2.6.23.14 kernel with the actual svn 
buildroot and uclibc. It works quite well but produces really large 
kernel images.

Created:      Tue Jun 10 11:45:43 2008
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    4528112 Bytes = 4421.98 kB = 4.32 MB

With an old toolchain I can achive regular sizes:

Created:      Tue Jun 10 13:44:26 2008
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    1412792 Bytes = 1379.68 kB = 1.35 MB


Unfortunately, the old toolchain has a buggy uclibc and I need a new 
one. -- How can I fix that greedy kernel thing ? --

Thanks in advance...
akuehn
