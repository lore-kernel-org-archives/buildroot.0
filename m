From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 06 May 2017 15:31:54 +0000
Subject: [Buildroot] [Bug 9856] New: build libubox failed on ubuntu 17.04
	64bit
Message-ID: <bug-9856-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9856

            Bug ID: 9856
           Summary: build libubox failed on ubuntu 17.04  64bit
           Product: buildroot
           Version: 2017.02.1
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: linhuikui at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7061
  --> https://bugs.busybox.net/attachment.cgi?id=7061&action=edit
build libubox failed

I config builbroot with lua5.1 and libubox. but built failed.
buildroot2017.02.1  on ubuntu 17.04  64bit

below is the build output with cmd make V=1. and the attachment is my .config
file.

begin output:
make V=1
umask 0022 && make -C /home/lhk/workspace/buildroot-2017.02.2
O=/home/lhk/workspace/orangepi/. 
>>> libubox 290c64ef5b5c3e75be851594f269d6a9568e64e5 Installing to staging directory
PATH="/home/lhk/workspace/orangepi/host/bin:/home/lhk/workspace/orangepi/host/sbin:/home/lhk/workspace/orangepi/host/usr/bin:/home/lhk/workspace/orangepi/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games/opt/Qt5.8.0/5.8/gcc_64/bin"
 /usr/bin/make -j5 
DESTDIR=/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot
install/fast -C
/home/lhk/workspace/orangepi/build/libubox-290c64ef5b5c3e75be851594f269d6a9568e64e5/
/usr/bin/make -f CMakeFiles/Makefile2 preinstall
make[3]: Nothing to be done for 'preinstall'.
Install the project...
/usr/bin/cmake -P cmake_install.cmake
-- Install configuration: "Release"
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/avl-cmp.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/avl.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/blob.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/blobmsg.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/blobmsg_json.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/json_script.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/kvlist.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/list.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/md5.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/runqueue.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/safe_list.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/ulog.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/uloop.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/usock.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/ustream.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/utils.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libubox/vlist.h
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libubox.so
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libubox.a
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libblobmsg_json.so
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libblobmsg_json.a
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/jshn
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libjson_script.so
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/share/libubox/jshn.sh
-- Up-to-date:
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/lua/5.1/uloop.so
if test -n "" ; then \
        echo ">>> libubox 290c64ef5b5c3e75be851594f269d6a9568e64e5 Fixing
package configuration files" ;\
                /bin/sed -i -e  "s,/home/lhk/workspace/orangepi, at BASE_DIR@,g" \
                        -e
"s,/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot, at STAGING_DIR@,g"
\
                        -e
"s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
                        -e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
                        -e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
                        -e
"s, at STAGING_DIR@,/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot,g"
\
                        -e "s, at BASE_DIR@,/home/lhk/workspace/orangepi,g" \
                         ;\
fi
>>> libubox 290c64ef5b5c3e75be851594f269d6a9568e64e5 Fixing libtool files
find
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib*
-name "*.la" | xargs --no-run-if-empty \
        /bin/sed -i -e "s:/home/lhk/workspace/orangepi:@BASE_DIR@:g" \
                -e
"s:/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot:@STAGING_DIR@:g"
\
                 -e
"s:/home/lhk/workspace/orangepi/host/opt/ext-toolchain:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g"
\
                -e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
                 -e
"s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:/home/lhk/workspace/orangepi/host/opt/ext-toolchain:g"
\
                -e
"s:@STAGING_DIR@:/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot:g"
\
                -e "s:@BASE_DIR@:/home/lhk/workspace/orangepi:g"
libubox: installs files in
/home/lhk/workspace/orangepi/host/usr/arm-buildroot-linux-gnueabihf/sysroot//home/lhk/workspace/orangepi
package/pkg-generic.mk:255: recipe for target
'/home/lhk/workspace/orangepi/build/libubox-290c64ef5b5c3e75be851594f269d6a9568e64e5/.stamp_staging_installed'
failed
make[1]: ***
[/home/lhk/workspace/orangepi/build/libubox-290c64ef5b5c3e75be851594f269d6a9568e64e5/.stamp_staging_installed]
Error 1
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2


End of output.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
