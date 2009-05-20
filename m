From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 20 May 2009 16:18:42 +0200
Subject: [Buildroot] Kernel headers 2.36.8.10 not matching patch level
Message-ID: <4A33C433D49245E0AF2FB390E7B24639@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
(2009.5 rc2)
 
I noticed while running make and having selected patch level 9 ( 2.6.28.9)
that buildroot downloads the kernel source 2.6.28.10 ?
It seems to use the 2.6.28.10 in the toolchain_build_arm,  the one in
project_build_arm was the right one.
I have o idea if this could cause problems.
 
Running make linux26menuconfig fails if a full build was never done before.
 
 
Johan
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090520/6757e50f/attachment.htm>
