From: Tim Barr <tbarr@multitech.com>
Date: Mon, 18 Feb 2008 17:20:55 -0600
Subject: [Buildroot] Latest build problem
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60A3420CD@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is the latest error I get when I try to make a buildroot. This time
I did  clean and dir clean. And this is the error I get now:
 
mkdir -p /home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin
/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/arm-linux-ucl
ibc/bin

/usr/bin/gcc -g -O2 .//toolchain/sstrip/sstrip.c -o
/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
-uclibc-sstrip

ln -snf ../../bin/arm-linux-uclibc-sstrip \

/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/arm-linux-ucl
ibc/bin/sstrip

ln -snf arm-linux-uclibc-sstrip \

/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
-sstrip

/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
-uclibc-gcc -Os -pipe
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/include
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/include
--sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/
-isysroot /home/falingtrea/buildroot/build_arm_wchar/staging_dir
.//toolchain/sstrip/sstrip.c -o
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot/usr/bin/sstrip

/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin-ccache/..
/lib/gcc/arm-linux-uclibc/4.2.1/../../../../arm-linux-uclibc/bin/ld:
cannot open output file
/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot/usr/bin/sstrip: No such file or directory

collect2: ld returned 1 exit status

make: ***
[/home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/
root/usr/bin/sstrip] Error 1

Any suggestions on what I can do to move forward would be appreciated.

 


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080218/9bf74382/attachment.htm 
