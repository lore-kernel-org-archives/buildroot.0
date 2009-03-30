From: Lloyd Sargent <lloyd@cannasoftware.com>
Date: Mon, 30 Mar 2009 18:17:36 -0500
Subject: [Buildroot] Couldn't stat mkimage
Message-ID: <62B5FC63-F4EF-452D-A3DC-B50E860A70E2@cannasoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've done a "make clean" and I'm still getting the following issue

:
:
mkdir -p /home/lloyd/Projects/buildroot-2009.02/build_arm/staging_dir/ 
usr/bin /home/lloyd/Projects/buildroot-2009.02/build_arm/staging_dir/ 
usr/arm-linux-uclibc/bin
/usr/bin/gcc -g -O2 .//toolchain/sstrip/sstrip.c -o /home/lloyd/ 
Projects/buildroot-2009.02/build_arm/staging_dir/usr/bin/arm-linux- 
uclibc-sstrip
ln -snf ../../bin/arm-linux-uclibc-sstrip \
                 /home/lloyd/Projects/buildroot-2009.02/build_arm/ 
staging_dir/usr/arm-linux-uclibc/bin/sstrip
ln -snf arm-linux-uclibc-sstrip \
                 /home/lloyd/Projects/buildroot-2009.02/build_arm/ 
staging_dir/usr/bin/arm-linux-sstrip
cp -dpf /home/lloyd/Projects/buildroot-2009.02/project_build_arm/ 
at91sam9261ek/u-boot-2009.01/tools/mkimage /home/lloyd/Projects/ 
buildroot-2009.02/build_arm/staging_dir/usr/bin/
cp: cannot stat `/home/lloyd/Projects/buildroot-2009.02/ 
project_build_arm/at91sam9261ek/u-boot-2009.01/tools/mkimage': No such  
file or directory
make: *** [/home/lloyd/Projects/buildroot-2009.02/build_arm/ 
staging_dir/usr/bin/mkimage] Error 1


I'm trying to build for at91sam9261ek - just as a sanity check I'm  
building on two other machines to see if I run into this problem.

Any help would be gladly accepted!

Cheers,

Lloyd
