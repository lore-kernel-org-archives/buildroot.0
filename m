From: =?windows-1251?B?1+jt6u7iIMDt5PDl6Q==?= <blackmesa@rambler.ru>
Date: Fri, 21 Nov 2008 12:58:47 +0300
Subject: [Buildroot] Had anybody ever basically create JFFS2 image using
	BUILDROOT ???
Message-ID: <948240856.1227261527.234222620.1629@mcgi39.rambler.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At this moment I am waiting for buildroot process
after invoke in terminal such commands:

1. make menuconfig
1.1 select MIPSEL
1.2 select mips32
1.3 select Linux-Advanced-Configuration - set 2.6.22 version there and 
also set 'make menuconfig' command to be invoked before Linux build
1.4 select jffs2 as target filesystem
2. make all

Now waiting..............
