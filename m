From: =?windows-1251?B?1+jt6u7iIMDt5PDl6Q==?= <blackmesa@rambler.ru>
Date: Mon, 24 Nov 2008 11:21:29 +0300
Subject: [Buildroot] Buildroot does not generates target image.
Message-ID: <402224706.1227514889.172836360.21697@mcgi41.rambler.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I did these steps:

1) download buildroot-20081110.tar.bz2
2) unpack
3) cd ./buildroot
4) make menuconfig
4.1) Reset produce target JFFS2 image
4.2) Set Linux advanced configuration (set Alchemy Based Processor, 
Little Endian, vmlinux)
5) make all

So I have the following question:

1) .../buildroot/project_build_mipsel/uclibc/root - is it the root 
folder for target JFFS2 image ?

2) Could I invoke this command "mkfs.jffs2 -d 
.../buildroot/project_build_mipsel/uclibc/root -o MY_IMAGE_NAME 
--little-endian" to produce target JFFS2 image by hand?

3) If I goto 4.1 item and set produce target JFFS2 image flag then I get 
an error after Linux compiles: "No rule to make 'mtd-host'".
What does this error means? How to force BUILDROOT to produce target 
image (like JFFS2) ??

--
Andrew.
