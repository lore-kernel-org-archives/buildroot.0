From: Candy Man <candyman80211@gmail.com>
Date: Tue, 1 Apr 2008 22:39:41 -0400
Subject: [Buildroot] Error when enabling Java Compiler in toolchain [other
	options default]
Message-ID: <3ca501d60804011939n58fbd162y6b26733c57561fa6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mkdir -p /home/will/box/buildroot/project_build_i686/uclibc/root/usr/lib
/home/will/box/buildroot/project_build_i686/uclibc/root/usr/sbin
touch /home/will/box/buildroot/toolchain_build_i686/gcc-4.2.1-final/.installed
# These are in /lib, so...
rm -rf /home/will/box/buildroot/project_build_i686/uclibc/root/usr/lib/libgcc_s*.so*
cp -dpf /home/will/box/buildroot/build_i686/staging_dir/usr/i686-linux-uclibc/lib/libgcc_s*
\
                /home/will/box/buildroot/project_build_i686/uclibc/root/lib/
cp -dpf /home/will/box/buildroot/build_i686/staging_dir/usr/i686-linux-uclibc/lib/libstdc++.so*
\
                /home/will/box/buildroot/project_build_i686/uclibc/root/usr/lib/
cp -dpf /home/will/box/buildroot/build_i686/staging_dir/lib/libgcj.so*
/home/will/box/buildroot/project_build_i686/uclibc/root/lib/
cp: cannot stat
`/home/will/box/buildroot/build_i686/staging_dir/lib/libgcj.so*': No
such file or directory
make: *** [/home/will/box/buildroot/toolchain_build_i686/gcc-4.2.1-final/.libs_installed]
Error 1
