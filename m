From: ashok vardhan <rashokvardhan@yahoo.co.in>
Date: Mon, 1 Oct 2007 11:50:58 +0100 (BST)
Subject: [Buildroot] Error with building ARM cross toolchain using buildroot
Message-ID: <543018.86390.qm@web7906.mail.in.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sir/Madam,
 I did the things as suggested by Sir/Madam Brian Austin. I successfully downloaded and  I extracted the tar file. I shown a brief things regarding this below.............
 
 http://buildroot.uclibc.org/downloads/snapshots/buildroot-snapshot.tar.bz2, buildroot  buildroot-snapshot.tar.bz2
 
 [root at knowx4 buildroot]# make menuconfig
 
 [root at knowx4 buildroot]# make
 ALL tar files related to the configuration done by me are downloaded.
 
 rm -rf /root/porting/tools/buildroot/project_build_arm/uclibc/buildroot-config
 mkdir -p /root/porting/tools/buildroot/project_build_arm/uclibc
 cp -dpRf package/config/buildroot-config /root/porting/tools/buildroot/project_build_arm/uclibc/buildroot-config
 cp -dpf  /root/porting/tools/buildroot/project_build_arm/uclibc/linux-2.6.22.1/.config
 cp: missing destination file
 Try `cp --help' for more information.
 make: *** [/root/porting/tools/buildroot/project_build_arm/uclibc/linux-2.6.22.1/.configured] Error 1
 
 [root at knowx4 buildroot]# ls
 binaries   Config.in  docs      package  project_build_arm  TODO       toolchain_build_arm
 build_arm  dl         Makefile  project  target             toolchain
 
 Please give some suggestive solutions regarding this error............
 Thanking You Sir/Madam.
 
 Regards,
 Ashok   
 
 
 
 
       
---------------------------------
 Now you can chat without downloading messenger. Click here to know how.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071001/dc731e99/attachment.htm 
