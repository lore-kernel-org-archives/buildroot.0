From: abhishek desai <abhi00@gmail.com>
Date: Wed, 15 Apr 2009 14:02:59 +0530
Subject: [Buildroot] Problem compiling libgcj
Message-ID: <898285d30904150132q6bbf1971h5932bc366f5e5131@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am getting the following errors when compiling gcc for uclibc for the mips
platform. Is this a known issue ? Any idea how I can resolve it ?


# Ok... that's enough of that.
#
mkdir -p
/root/mipsel/buildroot-2009.02/project_build_mips/uclibc/root/usr/lib
/root/mipsel/buildroot-2009.02/project_build_mips/uclibc/root/usr/sbin
touch
/root/mipsel/buildroot-2009.02/toolchain_build_mips/gcc-3.4.6-final/.installed
# These are in /lib, so...
rm -rf
/root/mipsel/buildroot-2009.02/project_build_mips/uclibc/root/usr/lib/libgcc_s*.so*
cp -dpf
/root/mipsel/buildroot-2009.02/build_mips/staging_dir/usr/mips-linux-uclibc/lib/libgcc_s*
\

 /root/mipsel/buildroot-2009.02/project_build_mips/uclibc/root/lib/
/root/mipsel/buildroot-2009.02/build_mips/staging_dir/usr/bin/mips-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/root/mipsel/buildroot-2009.02/project_build_mips/uclibc/root/lib/libgcc_s*
mkdir -p
/root/mipsel/buildroot-2009.02/project_build_mips/uclibc/root/usr/lib
cp -dpf
/root/mipsel/buildroot-2009.02/build_mips/staging_dir/lib/libstdc++.so*
/root/mipsel/buildroot-2009.02/project_build_mips/uclibc/root/usr/lib/
/root/mipsel/buildroot-2009.02/build_mips/staging_dir/usr/bin/mips-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/root/mipsel/buildroot-2009.02/project_build_mips/uclibc/root/usr/lib/libstdc++.so*
cp -dpf /root/mipsel/buildroot-2009.02/build_mips/staging_dir/lib/libgcj.so*
/root/mipsel/buildroot-2009.02/project_build_mips/uclibc/root/usr/lib/
cp: cannot stat
`/root/mipsel/buildroot-2009.02/build_mips/staging_dir/lib/libgcj.so*': No
such file or directory
make: ***
[/root/mipsel/buildroot-2009.02/project_build_mips/uclibc/autotools-stamps/gcc_libs_target_installed]
Error 1


Please help.

Thanks

Regards,
Abhishek
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090415/bb74f08e/attachment.htm>
