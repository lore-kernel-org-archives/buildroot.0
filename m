From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Mar 2012 08:30:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2012-03-28
Message-ID: <20120329063012.3B50352C13D@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

On 2012-03-28, 126 random build tests have been done and
submitted on autobuild.buildroot.net.
 60 builds have been successful
 66 builds have failed

Build 48243df9d38534ca0d4bb18b5951429d2eeaadd0
==============================================

Status         : NOK
Failure reason : lttng-libust-1.9.2
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 00:06:11
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/48243df9d38534ca0d4bb18b5951429d2eeaadd0/build-end.log
Complete log   : http://autobuild.buildroot.net/results/48243df9d38534ca0d4bb18b5951429d2eeaadd0/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/48243df9d38534ca0d4bb18b5951429d2eeaadd0/config
Defconfig      : http://autobuild.buildroot.net/results/48243df9d38534ca0d4bb18b5951429d2eeaadd0/defconfig

Build 0c13e1bec60eb792e217bd3f35b414236c2c270a
==============================================

Status         : TIMEOUT
Failure reason : (cd /home/test/test/output/build/libnspr-4.8.7/mozilla/nsprpub && rm -rf config.cache && PATH="/home/test/test/output/host/bin:/home/test/test/output/host/usr/bin:/home/test/test/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/games" AR="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-ar" AS="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-as" LD="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-ld" NM="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-nm" CC="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-gcc" GCC="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-gcc" CPP="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-cpp" CXX="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-g++" FC="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-gfortran" RANLIB="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-ranlib" STRIP="/home/test/test/output/host/usr/b
 in/arm-none-linux-gnueabi-strip" OBJCOPY="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-objcopy" OBJDUMP="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-objdump" AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" FC_FOR_BUILD="/usr/bin/ld" LD_FOR_BUILD="/usr/bin/ld" CFLAGS_FOR_BUILD="-O2 -I/home/test/test/output/host/include -I/home/test/test/output/host/usr/include" CXXFLAGS_FOR_BUILD="-I/home/test/test/output/host/include -I/home/test/test/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home/test/test/output/host/lib -L/home/test/test/output/host/usr/lib -Wl,-rpath,/home/test/test/output/host/usr/lib" FCFLAGS_FOR_BUILD="" DEFAULT_ASSEMBLER="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-as" DEFAULT_LINKER="/home/test/test/output/host/usr/bin/arm-none-linux-gnueabi-ld" CFLAGS=" -mthumb -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS
 =64" CXXFLAGS=" -mthumb -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="" FCFLAGS="" PKG_CONFIG="/home/test/test/output/host/usr/bin/pkg-config" PERLLIB="/home/test/test/output/host/usr/lib/perl" STAGING_DIR="/home/test/test/output/host/usr/arm-unknown-linux-gnueabi/sysroot" ac_cv_lbl_unaligned_fail=yes ac_cv_func_mmap_fixed_mapped=yes ac_cv_func_memcmp_working=yes ac_cv_have_decl_malloc=yes gl_cv_func_malloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes ac_cv
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 00:57:00
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/0c13e1bec60eb792e217bd3f35b414236c2c270a/build-end.log
Complete log   : http://autobuild.buildroot.net/results/0c13e1bec60eb792e217bd3f35b414236c2c270a/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/0c13e1bec60eb792e217bd3f35b414236c2c270a/config
Defconfig      : http://autobuild.buildroot.net/results/0c13e1bec60eb792e217bd3f35b414236c2c270a/defconfig

Build 9cf2589e0bac2423b9d93d7ad44d35f4db2557a3
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 00:57:24
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/9cf2589e0bac2423b9d93d7ad44d35f4db2557a3/build-end.log
Complete log   : http://autobuild.buildroot.net/results/9cf2589e0bac2423b9d93d7ad44d35f4db2557a3/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/9cf2589e0bac2423b9d93d7ad44d35f4db2557a3/config
Defconfig      : http://autobuild.buildroot.net/results/9cf2589e0bac2423b9d93d7ad44d35f4db2557a3/defconfig

Build 591ae9a8447daee4a3779df72e3d4757f279b0ae
==============================================

Status         : NOK
Failure reason : host-intltool-0.40.6
Architecture   : x86_64
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 01:19:18
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/591ae9a8447daee4a3779df72e3d4757f279b0ae/build-end.log
Complete log   : http://autobuild.buildroot.net/results/591ae9a8447daee4a3779df72e3d4757f279b0ae/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/591ae9a8447daee4a3779df72e3d4757f279b0ae/config
Defconfig      : http://autobuild.buildroot.net/results/591ae9a8447daee4a3779df72e3d4757f279b0ae/defconfig

Build a86ef3f95a5dda4838e2bc8d916e3836f54e800c
==============================================

Status         : NOK
Failure reason : host-intltool-0.40.6
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 01:21:31
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/a86ef3f95a5dda4838e2bc8d916e3836f54e800c/build-end.log
Complete log   : http://autobuild.buildroot.net/results/a86ef3f95a5dda4838e2bc8d916e3836f54e800c/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/a86ef3f95a5dda4838e2bc8d916e3836f54e800c/config
Defconfig      : http://autobuild.buildroot.net/results/a86ef3f95a5dda4838e2bc8d916e3836f54e800c/defconfig

Build 4cb475bdf0850cb3290feb7720839d940493a3b0
==============================================

Status         : NOK
Failure reason : libmpeg2-0.5.1
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 01:24:39
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/4cb475bdf0850cb3290feb7720839d940493a3b0/build-end.log
Complete log   : http://autobuild.buildroot.net/results/4cb475bdf0850cb3290feb7720839d940493a3b0/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/4cb475bdf0850cb3290feb7720839d940493a3b0/config
Defconfig      : http://autobuild.buildroot.net/results/4cb475bdf0850cb3290feb7720839d940493a3b0/defconfig

Build 918d3aa21df63b19d907255fecd8e9f790575656
==============================================

Status         : NOK
Failure reason : libgtk2-2.24.9
Architecture   : i686
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 01:38:33
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/918d3aa21df63b19d907255fecd8e9f790575656/build-end.log
Complete log   : http://autobuild.buildroot.net/results/918d3aa21df63b19d907255fecd8e9f790575656/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/918d3aa21df63b19d907255fecd8e9f790575656/config
Defconfig      : http://autobuild.buildroot.net/results/918d3aa21df63b19d907255fecd8e9f790575656/defconfig

Build 35e01e6c571b256b20735d9e7cea55d90e35b964
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 01:44:22
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/35e01e6c571b256b20735d9e7cea55d90e35b964/build-end.log
Complete log   : http://autobuild.buildroot.net/results/35e01e6c571b256b20735d9e7cea55d90e35b964/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/35e01e6c571b256b20735d9e7cea55d90e35b964/config
Defconfig      : http://autobuild.buildroot.net/results/35e01e6c571b256b20735d9e7cea55d90e35b964/defconfig

Build 346cb6e95a51366d76f599a7aa927d7655d8c7ac
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 01:47:47
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/346cb6e95a51366d76f599a7aa927d7655d8c7ac/build-end.log
Complete log   : http://autobuild.buildroot.net/results/346cb6e95a51366d76f599a7aa927d7655d8c7ac/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/346cb6e95a51366d76f599a7aa927d7655d8c7ac/config
Defconfig      : http://autobuild.buildroot.net/results/346cb6e95a51366d76f599a7aa927d7655d8c7ac/defconfig

Build d1f9438cd8dea862d4c7d27eb228437820c732db
==============================================

Status         : NOK
Failure reason : logrotate-3.7.9
Architecture   : mips
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 01:49:08
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/d1f9438cd8dea862d4c7d27eb228437820c732db/build-end.log
Complete log   : http://autobuild.buildroot.net/results/d1f9438cd8dea862d4c7d27eb228437820c732db/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/d1f9438cd8dea862d4c7d27eb228437820c732db/config
Defconfig      : http://autobuild.buildroot.net/results/d1f9438cd8dea862d4c7d27eb228437820c732db/defconfig

Build eb39e7e5690cf6490a958fd908ef4a8985a0b4a5
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 01:59:34
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/eb39e7e5690cf6490a958fd908ef4a8985a0b4a5/build-end.log
Complete log   : http://autobuild.buildroot.net/results/eb39e7e5690cf6490a958fd908ef4a8985a0b4a5/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/eb39e7e5690cf6490a958fd908ef4a8985a0b4a5/config
Defconfig      : http://autobuild.buildroot.net/results/eb39e7e5690cf6490a958fd908ef4a8985a0b4a5/defconfig

Build 5700f56b4cd22fc2ee90f616cd9eb43e4e87cd30
==============================================

Status         : NOK
Failure reason : host-intltool-0.40.6
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 02:09:28
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/5700f56b4cd22fc2ee90f616cd9eb43e4e87cd30/build-end.log
Complete log   : http://autobuild.buildroot.net/results/5700f56b4cd22fc2ee90f616cd9eb43e4e87cd30/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/5700f56b4cd22fc2ee90f616cd9eb43e4e87cd30/config
Defconfig      : http://autobuild.buildroot.net/results/5700f56b4cd22fc2ee90f616cd9eb43e4e87cd30/defconfig

Build b6b2ce8b7c595de58929791834e8a33c3a4aa2ae
==============================================

Status         : NOK
Failure reason : icu-4.4.2
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 02:11:01
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/b6b2ce8b7c595de58929791834e8a33c3a4aa2ae/build-end.log
Complete log   : http://autobuild.buildroot.net/results/b6b2ce8b7c595de58929791834e8a33c3a4aa2ae/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/b6b2ce8b7c595de58929791834e8a33c3a4aa2ae/config
Defconfig      : http://autobuild.buildroot.net/results/b6b2ce8b7c595de58929791834e8a33c3a4aa2ae/defconfig

Build e88e856bf9d0d8ab62f3edbfacccb65c83d9a7f7
==============================================

Status         : NOK
Failure reason : libffi-3.0.10
Architecture   : sh2a
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 02:13:57
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/e88e856bf9d0d8ab62f3edbfacccb65c83d9a7f7/build-end.log
Complete log   : http://autobuild.buildroot.net/results/e88e856bf9d0d8ab62f3edbfacccb65c83d9a7f7/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/e88e856bf9d0d8ab62f3edbfacccb65c83d9a7f7/config
Defconfig      : http://autobuild.buildroot.net/results/e88e856bf9d0d8ab62f3edbfacccb65c83d9a7f7/defconfig

Build f5252987e3cc160823a9c83b583dcc4b052e56cb
==============================================

Status         : NOK
Failure reason : libev-4.11
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 02:19:37
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/f5252987e3cc160823a9c83b583dcc4b052e56cb/build-end.log
Complete log   : http://autobuild.buildroot.net/results/f5252987e3cc160823a9c83b583dcc4b052e56cb/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/f5252987e3cc160823a9c83b583dcc4b052e56cb/config
Defconfig      : http://autobuild.buildroot.net/results/f5252987e3cc160823a9c83b583dcc4b052e56cb/defconfig

Build 4ef171fde921e4c9df0fc60dd3338b7363e91e57
==============================================

Status         : NOK
Failure reason : pulseaudio-1.1
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 02:45:37
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/4ef171fde921e4c9df0fc60dd3338b7363e91e57/build-end.log
Complete log   : http://autobuild.buildroot.net/results/4ef171fde921e4c9df0fc60dd3338b7363e91e57/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/4ef171fde921e4c9df0fc60dd3338b7363e91e57/config
Defconfig      : http://autobuild.buildroot.net/results/4ef171fde921e4c9df0fc60dd3338b7363e91e57/defconfig

Build fde54dba22fa6effe758c178a164448051fbdffe
==============================================

Status         : NOK
Failure reason : libmpeg2-0.5.1
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 02:52:08
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/fde54dba22fa6effe758c178a164448051fbdffe/build-end.log
Complete log   : http://autobuild.buildroot.net/results/fde54dba22fa6effe758c178a164448051fbdffe/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/fde54dba22fa6effe758c178a164448051fbdffe/config
Defconfig      : http://autobuild.buildroot.net/results/fde54dba22fa6effe758c178a164448051fbdffe/defconfig

Build 75f522ecfc9fcb6089db873c382a9942ff22b260
==============================================

Status         : NOK
Failure reason : microperl-5.12.4
Architecture   : sh2a
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 02:54:29
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/75f522ecfc9fcb6089db873c382a9942ff22b260/build-end.log
Complete log   : http://autobuild.buildroot.net/results/75f522ecfc9fcb6089db873c382a9942ff22b260/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/75f522ecfc9fcb6089db873c382a9942ff22b260/config
Defconfig      : http://autobuild.buildroot.net/results/75f522ecfc9fcb6089db873c382a9942ff22b260/defconfig

Build 0bb26b13f582d0b9bd452cacddff330d55969e0f
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 02:59:44
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/0bb26b13f582d0b9bd452cacddff330d55969e0f/build-end.log
Complete log   : http://autobuild.buildroot.net/results/0bb26b13f582d0b9bd452cacddff330d55969e0f/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/0bb26b13f582d0b9bd452cacddff330d55969e0f/config
Defconfig      : http://autobuild.buildroot.net/results/0bb26b13f582d0b9bd452cacddff330d55969e0f/defconfig

Build b04258e3a4875606ed267aa1ae1f7714c9c9fe90
==============================================

Status         : OK
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 03:26:35
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/b04258e3a4875606ed267aa1ae1f7714c9c9fe90/build-end.log
Complete log   : http://autobuild.buildroot.net/results/b04258e3a4875606ed267aa1ae1f7714c9c9fe90/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/b04258e3a4875606ed267aa1ae1f7714c9c9fe90/config
Defconfig      : http://autobuild.buildroot.net/results/b04258e3a4875606ed267aa1ae1f7714c9c9fe90/defconfig

Build beefc3a9d19c3e0f0ab40d20e9f19c1c58eb7da7
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 03:39:05
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/beefc3a9d19c3e0f0ab40d20e9f19c1c58eb7da7/build-end.log
Complete log   : http://autobuild.buildroot.net/results/beefc3a9d19c3e0f0ab40d20e9f19c1c58eb7da7/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/beefc3a9d19c3e0f0ab40d20e9f19c1c58eb7da7/config
Defconfig      : http://autobuild.buildroot.net/results/beefc3a9d19c3e0f0ab40d20e9f19c1c58eb7da7/defconfig

Build 313e9cf13a7d5883717d0564920b0d570d1773fd
==============================================

Status         : NOK
Failure reason : host-intltool-0.40.6
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 03:46:35
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/313e9cf13a7d5883717d0564920b0d570d1773fd/build-end.log
Complete log   : http://autobuild.buildroot.net/results/313e9cf13a7d5883717d0564920b0d570d1773fd/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/313e9cf13a7d5883717d0564920b0d570d1773fd/config
Defconfig      : http://autobuild.buildroot.net/results/313e9cf13a7d5883717d0564920b0d570d1773fd/defconfig

Build 302c54f5943cd153300665c53a32ece8f7560cc1
==============================================

Status         : NOK
Failure reason : zlib-1.2.6
Architecture   : bfin
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 03:46:52
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/302c54f5943cd153300665c53a32ece8f7560cc1/build-end.log
Complete log   : http://autobuild.buildroot.net/results/302c54f5943cd153300665c53a32ece8f7560cc1/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/302c54f5943cd153300665c53a32ece8f7560cc1/config
Defconfig      : http://autobuild.buildroot.net/results/302c54f5943cd153300665c53a32ece8f7560cc1/defconfig

Build 37de7099ccde03a55deb3b6f15cd3c978b02c5ab
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 04:17:38
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/37de7099ccde03a55deb3b6f15cd3c978b02c5ab/build-end.log
Complete log   : http://autobuild.buildroot.net/results/37de7099ccde03a55deb3b6f15cd3c978b02c5ab/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/37de7099ccde03a55deb3b6f15cd3c978b02c5ab/config
Defconfig      : http://autobuild.buildroot.net/results/37de7099ccde03a55deb3b6f15cd3c978b02c5ab/defconfig

Build b3eb3d0ccbf32aac54fc7b9233c769b576d4784e
==============================================

Status         : NOK
Failure reason : host-intltool-0.40.6
Architecture   : sh4
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 04:21:57
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/b3eb3d0ccbf32aac54fc7b9233c769b576d4784e/build-end.log
Complete log   : http://autobuild.buildroot.net/results/b3eb3d0ccbf32aac54fc7b9233c769b576d4784e/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/b3eb3d0ccbf32aac54fc7b9233c769b576d4784e/config
Defconfig      : http://autobuild.buildroot.net/results/b3eb3d0ccbf32aac54fc7b9233c769b576d4784e/defconfig

Build 17b8cfeebc607f5bad65b36bea6cf248ae841592
==============================================

Status         : NOK
Failure reason : lttng-libust-1.9.2
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 04:24:01
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/17b8cfeebc607f5bad65b36bea6cf248ae841592/build-end.log
Complete log   : http://autobuild.buildroot.net/results/17b8cfeebc607f5bad65b36bea6cf248ae841592/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/17b8cfeebc607f5bad65b36bea6cf248ae841592/config
Defconfig      : http://autobuild.buildroot.net/results/17b8cfeebc607f5bad65b36bea6cf248ae841592/defconfig

Build da0f83ce1092a2a83d4b11ad9e16afea948c9cfe
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 04:53:08
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/da0f83ce1092a2a83d4b11ad9e16afea948c9cfe/build-end.log
Complete log   : http://autobuild.buildroot.net/results/da0f83ce1092a2a83d4b11ad9e16afea948c9cfe/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/da0f83ce1092a2a83d4b11ad9e16afea948c9cfe/config
Defconfig      : http://autobuild.buildroot.net/results/da0f83ce1092a2a83d4b11ad9e16afea948c9cfe/defconfig

Build 02b84e7c7e0bb02769964e8a5dc06ced6446b279
==============================================

Status         : NOK
Failure reason : attr-2.4.46
Architecture   : bfin
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 04:53:23
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/02b84e7c7e0bb02769964e8a5dc06ced6446b279/build-end.log
Complete log   : http://autobuild.buildroot.net/results/02b84e7c7e0bb02769964e8a5dc06ced6446b279/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/02b84e7c7e0bb02769964e8a5dc06ced6446b279/config
Defconfig      : http://autobuild.buildroot.net/results/02b84e7c7e0bb02769964e8a5dc06ced6446b279/defconfig

Build d18ab5d43a137ca28f3bdb9de945097372ad531d
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 05:17:04
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/d18ab5d43a137ca28f3bdb9de945097372ad531d/build-end.log
Complete log   : http://autobuild.buildroot.net/results/d18ab5d43a137ca28f3bdb9de945097372ad531d/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/d18ab5d43a137ca28f3bdb9de945097372ad531d/config
Defconfig      : http://autobuild.buildroot.net/results/d18ab5d43a137ca28f3bdb9de945097372ad531d/defconfig

Build 519622b1f77cf26a0d8047e282d96fe49074cd7d
==============================================

Status         : NOK
Failure reason : liburcu-0.6.7
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 05:20:01
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/519622b1f77cf26a0d8047e282d96fe49074cd7d/build-end.log
Complete log   : http://autobuild.buildroot.net/results/519622b1f77cf26a0d8047e282d96fe49074cd7d/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/519622b1f77cf26a0d8047e282d96fe49074cd7d/config
Defconfig      : http://autobuild.buildroot.net/results/519622b1f77cf26a0d8047e282d96fe49074cd7d/defconfig

Build 0e08c4a03a6f01f98aab20e43f95a0c67498586c
==============================================

Status         : NOK
Failure reason : lua-5.1.4
Architecture   : mips
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 05:26:48
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/0e08c4a03a6f01f98aab20e43f95a0c67498586c/build-end.log
Complete log   : http://autobuild.buildroot.net/results/0e08c4a03a6f01f98aab20e43f95a0c67498586c/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/0e08c4a03a6f01f98aab20e43f95a0c67498586c/config
Defconfig      : http://autobuild.buildroot.net/results/0e08c4a03a6f01f98aab20e43f95a0c67498586c/defconfig

Build 884edb6673b9be04a5fd809e4a3ded9684a25dd5
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 05:36:37
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/884edb6673b9be04a5fd809e4a3ded9684a25dd5/build-end.log
Complete log   : http://autobuild.buildroot.net/results/884edb6673b9be04a5fd809e4a3ded9684a25dd5/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/884edb6673b9be04a5fd809e4a3ded9684a25dd5/config
Defconfig      : http://autobuild.buildroot.net/results/884edb6673b9be04a5fd809e4a3ded9684a25dd5/defconfig

Build 3b53ac1812e40d1cb005b5a49eaaa82250ca2b3c
==============================================

Status         : NOK
Failure reason : host-intltool-0.40.6
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 05:38:08
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/3b53ac1812e40d1cb005b5a49eaaa82250ca2b3c/build-end.log
Complete log   : http://autobuild.buildroot.net/results/3b53ac1812e40d1cb005b5a49eaaa82250ca2b3c/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/3b53ac1812e40d1cb005b5a49eaaa82250ca2b3c/config
Defconfig      : http://autobuild.buildroot.net/results/3b53ac1812e40d1cb005b5a49eaaa82250ca2b3c/defconfig

Build 375c16e74ca916cb234124bd1ace8464326c7595
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 06:08:16
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/375c16e74ca916cb234124bd1ace8464326c7595/build-end.log
Complete log   : http://autobuild.buildroot.net/results/375c16e74ca916cb234124bd1ace8464326c7595/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/375c16e74ca916cb234124bd1ace8464326c7595/config
Defconfig      : http://autobuild.buildroot.net/results/375c16e74ca916cb234124bd1ace8464326c7595/defconfig

Build 2cfd2e06b4eef977c64368374c90689fe3140e24
==============================================

Status         : NOK
Failure reason : host-intltool-0.40.6
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 06:09:12
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/2cfd2e06b4eef977c64368374c90689fe3140e24/build-end.log
Complete log   : http://autobuild.buildroot.net/results/2cfd2e06b4eef977c64368374c90689fe3140e24/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/2cfd2e06b4eef977c64368374c90689fe3140e24/config
Defconfig      : http://autobuild.buildroot.net/results/2cfd2e06b4eef977c64368374c90689fe3140e24/defconfig

Build d076a1b75f6a31691ab8e1e07047809fdc2e897f
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 06:32:07
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/d076a1b75f6a31691ab8e1e07047809fdc2e897f/build-end.log
Complete log   : http://autobuild.buildroot.net/results/d076a1b75f6a31691ab8e1e07047809fdc2e897f/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/d076a1b75f6a31691ab8e1e07047809fdc2e897f/config
Defconfig      : http://autobuild.buildroot.net/results/d076a1b75f6a31691ab8e1e07047809fdc2e897f/defconfig

Build 76fbc2b4ffb95690671a6b2e9da70c2d0d286e82
==============================================

Status         : NOK
Failure reason : boost-1.47.0
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 06:35:24
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/76fbc2b4ffb95690671a6b2e9da70c2d0d286e82/build-end.log
Complete log   : http://autobuild.buildroot.net/results/76fbc2b4ffb95690671a6b2e9da70c2d0d286e82/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/76fbc2b4ffb95690671a6b2e9da70c2d0d286e82/config
Defconfig      : http://autobuild.buildroot.net/results/76fbc2b4ffb95690671a6b2e9da70c2d0d286e82/defconfig

Build 93b63e9bdf9d39f32c5cdd2bfcf29320bff9417a
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 06:46:36
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/93b63e9bdf9d39f32c5cdd2bfcf29320bff9417a/build-end.log
Complete log   : http://autobuild.buildroot.net/results/93b63e9bdf9d39f32c5cdd2bfcf29320bff9417a/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/93b63e9bdf9d39f32c5cdd2bfcf29320bff9417a/config
Defconfig      : http://autobuild.buildroot.net/results/93b63e9bdf9d39f32c5cdd2bfcf29320bff9417a/defconfig

Build 0f040fe017134978daa7037d4737ce4089522d91
==============================================

Status         : NOK
Failure reason : mrouted-3.9.4
Architecture   : mipsel
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 06:58:40
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/0f040fe017134978daa7037d4737ce4089522d91/build-end.log
Complete log   : http://autobuild.buildroot.net/results/0f040fe017134978daa7037d4737ce4089522d91/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/0f040fe017134978daa7037d4737ce4089522d91/config
Defconfig      : http://autobuild.buildroot.net/results/0f040fe017134978daa7037d4737ce4089522d91/defconfig

Build 6b2894ef1bb90267ef5940a50784edb5ef32c891
==============================================

Status         : NOK
Failure reason : libev-4.11
Architecture   : mips
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 07:18:02
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/6b2894ef1bb90267ef5940a50784edb5ef32c891/build-end.log
Complete log   : http://autobuild.buildroot.net/results/6b2894ef1bb90267ef5940a50784edb5ef32c891/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/6b2894ef1bb90267ef5940a50784edb5ef32c891/config
Defconfig      : http://autobuild.buildroot.net/results/6b2894ef1bb90267ef5940a50784edb5ef32c891/defconfig

Build 830729afce2fb7b95dd0b1f69f8a5fe930554bfc
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 07:23:09
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/830729afce2fb7b95dd0b1f69f8a5fe930554bfc/build-end.log
Complete log   : http://autobuild.buildroot.net/results/830729afce2fb7b95dd0b1f69f8a5fe930554bfc/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/830729afce2fb7b95dd0b1f69f8a5fe930554bfc/config
Defconfig      : http://autobuild.buildroot.net/results/830729afce2fb7b95dd0b1f69f8a5fe930554bfc/defconfig

Build df833abd75d144b68d4a0abb6f48a1ca4e55b57d
==============================================

Status         : NOK
Failure reason : pv-1.2.0
Architecture   : x86_64
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 07:44:22
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/df833abd75d144b68d4a0abb6f48a1ca4e55b57d/build-end.log
Complete log   : http://autobuild.buildroot.net/results/df833abd75d144b68d4a0abb6f48a1ca4e55b57d/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/df833abd75d144b68d4a0abb6f48a1ca4e55b57d/config
Defconfig      : http://autobuild.buildroot.net/results/df833abd75d144b68d4a0abb6f48a1ca4e55b57d/defconfig

Build 9b854cd6240fbc258755776fae95ca6ea53f6791
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 08:02:06
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/9b854cd6240fbc258755776fae95ca6ea53f6791/build-end.log
Complete log   : http://autobuild.buildroot.net/results/9b854cd6240fbc258755776fae95ca6ea53f6791/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/9b854cd6240fbc258755776fae95ca6ea53f6791/config
Defconfig      : http://autobuild.buildroot.net/results/9b854cd6240fbc258755776fae95ca6ea53f6791/defconfig

Build 6fdad763c75046449f346f74e26961d4c72e5969
==============================================

Status         : OK
Architecture   : mips
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 08:04:04
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/6fdad763c75046449f346f74e26961d4c72e5969/build-end.log
Complete log   : http://autobuild.buildroot.net/results/6fdad763c75046449f346f74e26961d4c72e5969/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/6fdad763c75046449f346f74e26961d4c72e5969/config
Defconfig      : http://autobuild.buildroot.net/results/6fdad763c75046449f346f74e26961d4c72e5969/defconfig

Build 51e27d7cba0728e68715bab341062d797e6559dc
==============================================

Status         : NOK
Failure reason : socketcand-7d06986fa4b5fd2c210ec4e248dab41107be1ccd
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 08:12:20
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/51e27d7cba0728e68715bab341062d797e6559dc/build-end.log
Complete log   : http://autobuild.buildroot.net/results/51e27d7cba0728e68715bab341062d797e6559dc/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/51e27d7cba0728e68715bab341062d797e6559dc/config
Defconfig      : http://autobuild.buildroot.net/results/51e27d7cba0728e68715bab341062d797e6559dc/defconfig

Build be5a597ca1027a2cfc84fd6eddb117de376f27b7
==============================================

Status         : NOK
Failure reason : host-intltool-0.40.6
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 08:20:19
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/be5a597ca1027a2cfc84fd6eddb117de376f27b7/build-end.log
Complete log   : http://autobuild.buildroot.net/results/be5a597ca1027a2cfc84fd6eddb117de376f27b7/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/be5a597ca1027a2cfc84fd6eddb117de376f27b7/config
Defconfig      : http://autobuild.buildroot.net/results/be5a597ca1027a2cfc84fd6eddb117de376f27b7/defconfig

Build c593d9d5c1c2c687ff1251b831562a61984ac437
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 08:20:48
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/c593d9d5c1c2c687ff1251b831562a61984ac437/build-end.log
Complete log   : http://autobuild.buildroot.net/results/c593d9d5c1c2c687ff1251b831562a61984ac437/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/c593d9d5c1c2c687ff1251b831562a61984ac437/config
Defconfig      : http://autobuild.buildroot.net/results/c593d9d5c1c2c687ff1251b831562a61984ac437/defconfig

Build 88a4227fe1b74a8992c69b0c3b0a5ffb4703564c
==============================================

Status         : OK
Architecture   : mips
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 08:47:02
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/88a4227fe1b74a8992c69b0c3b0a5ffb4703564c/build-end.log
Complete log   : http://autobuild.buildroot.net/results/88a4227fe1b74a8992c69b0c3b0a5ffb4703564c/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/88a4227fe1b74a8992c69b0c3b0a5ffb4703564c/config
Defconfig      : http://autobuild.buildroot.net/results/88a4227fe1b74a8992c69b0c3b0a5ffb4703564c/defconfig

Build 803a5369d578bc93b6a8bb1ffff6e1e466cbf826
==============================================

Status         : NOK
Failure reason : icu-4.4.2
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 09:02:16
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/803a5369d578bc93b6a8bb1ffff6e1e466cbf826/build-end.log
Complete log   : http://autobuild.buildroot.net/results/803a5369d578bc93b6a8bb1ffff6e1e466cbf826/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/803a5369d578bc93b6a8bb1ffff6e1e466cbf826/config
Defconfig      : http://autobuild.buildroot.net/results/803a5369d578bc93b6a8bb1ffff6e1e466cbf826/defconfig

Build ea0ef66a2df1cdc1846d0d2c8e094043a79ef746
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 09:07:42
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/ea0ef66a2df1cdc1846d0d2c8e094043a79ef746/build-end.log
Complete log   : http://autobuild.buildroot.net/results/ea0ef66a2df1cdc1846d0d2c8e094043a79ef746/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/ea0ef66a2df1cdc1846d0d2c8e094043a79ef746/config
Defconfig      : http://autobuild.buildroot.net/results/ea0ef66a2df1cdc1846d0d2c8e094043a79ef746/defconfig

Build 24897be19e1778684218112355532eebb24a7fe2
==============================================

Status         : NOK
Failure reason : libhid-0.2.16
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 09:13:58
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/24897be19e1778684218112355532eebb24a7fe2/build-end.log
Complete log   : http://autobuild.buildroot.net/results/24897be19e1778684218112355532eebb24a7fe2/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/24897be19e1778684218112355532eebb24a7fe2/config
Defconfig      : http://autobuild.buildroot.net/results/24897be19e1778684218112355532eebb24a7fe2/defconfig

Build 6f69ec7bacfba846c0b2331a44874c4cedbe5600
==============================================

Status         : NOK
Failure reason : dhcpdump-1.8
Architecture   : sh2a
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 09:14:47
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/6f69ec7bacfba846c0b2331a44874c4cedbe5600/build-end.log
Complete log   : http://autobuild.buildroot.net/results/6f69ec7bacfba846c0b2331a44874c4cedbe5600/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/6f69ec7bacfba846c0b2331a44874c4cedbe5600/config
Defconfig      : http://autobuild.buildroot.net/results/6f69ec7bacfba846c0b2331a44874c4cedbe5600/defconfig

Build 43a351472682c7de3acf441ec8f6299a26e20da6
==============================================

Status         : OK
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 09:31:23
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/43a351472682c7de3acf441ec8f6299a26e20da6/build-end.log
Complete log   : http://autobuild.buildroot.net/results/43a351472682c7de3acf441ec8f6299a26e20da6/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/43a351472682c7de3acf441ec8f6299a26e20da6/config
Defconfig      : http://autobuild.buildroot.net/results/43a351472682c7de3acf441ec8f6299a26e20da6/defconfig

Build 3a4d4858dc09d38befa1f66208f213c656fffccd
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 09:43:34
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/3a4d4858dc09d38befa1f66208f213c656fffccd/build-end.log
Complete log   : http://autobuild.buildroot.net/results/3a4d4858dc09d38befa1f66208f213c656fffccd/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/3a4d4858dc09d38befa1f66208f213c656fffccd/config
Defconfig      : http://autobuild.buildroot.net/results/3a4d4858dc09d38befa1f66208f213c656fffccd/defconfig

Build 81a08a38a5af8f19a2614ce1269a87b9e898408d
==============================================

Status         : NOK
Failure reason : lttng-libust-1.9.2
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 10:01:14
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=9127ab6eaa8ed4477850dd62470ac3c80f440eef
End of log     : http://autobuild.buildroot.net/results/81a08a38a5af8f19a2614ce1269a87b9e898408d/build-end.log
Complete log   : http://autobuild.buildroot.net/results/81a08a38a5af8f19a2614ce1269a87b9e898408d/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/81a08a38a5af8f19a2614ce1269a87b9e898408d/config
Defconfig      : http://autobuild.buildroot.net/results/81a08a38a5af8f19a2614ce1269a87b9e898408d/defconfig

Build 61ecd78df26070ace429f05611f0716412be8ec7
==============================================

Status         : OK
Architecture   : i586
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 10:06:49
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/61ecd78df26070ace429f05611f0716412be8ec7/build-end.log
Complete log   : http://autobuild.buildroot.net/results/61ecd78df26070ace429f05611f0716412be8ec7/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/61ecd78df26070ace429f05611f0716412be8ec7/config
Defconfig      : http://autobuild.buildroot.net/results/61ecd78df26070ace429f05611f0716412be8ec7/defconfig

Build 8873bd28a18b9f2662ed560baf2a3d749e4ce375
==============================================

Status         : NOK
Failure reason : pixman-0.25.2
Architecture   : sh2a
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 10:09:28
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/8873bd28a18b9f2662ed560baf2a3d749e4ce375/build-end.log
Complete log   : http://autobuild.buildroot.net/results/8873bd28a18b9f2662ed560baf2a3d749e4ce375/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/8873bd28a18b9f2662ed560baf2a3d749e4ce375/config
Defconfig      : http://autobuild.buildroot.net/results/8873bd28a18b9f2662ed560baf2a3d749e4ce375/defconfig

Build 4e1f119e5082227b1e7bd20a8e49006cbf3c4c2c
==============================================

Status         : NOK
Failure reason : libffi-3.0.10
Architecture   : bfin
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 10:12:10
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/4e1f119e5082227b1e7bd20a8e49006cbf3c4c2c/build-end.log
Complete log   : http://autobuild.buildroot.net/results/4e1f119e5082227b1e7bd20a8e49006cbf3c4c2c/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/4e1f119e5082227b1e7bd20a8e49006cbf3c4c2c/config
Defconfig      : http://autobuild.buildroot.net/results/4e1f119e5082227b1e7bd20a8e49006cbf3c4c2c/defconfig

Build 1101ba11adafa9019cd1651d46f60aeee8cbdf98
==============================================

Status         : NOK
Failure reason : acl-2.2.51
Architecture   : bfin
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 10:12:24
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/1101ba11adafa9019cd1651d46f60aeee8cbdf98/build-end.log
Complete log   : http://autobuild.buildroot.net/results/1101ba11adafa9019cd1651d46f60aeee8cbdf98/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/1101ba11adafa9019cd1651d46f60aeee8cbdf98/config
Defconfig      : http://autobuild.buildroot.net/results/1101ba11adafa9019cd1651d46f60aeee8cbdf98/defconfig

Build 99df8b0d3917cc9a1347b5cf9cd029c9d6ef0dff
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 10:29:38
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/99df8b0d3917cc9a1347b5cf9cd029c9d6ef0dff/build-end.log
Complete log   : http://autobuild.buildroot.net/results/99df8b0d3917cc9a1347b5cf9cd029c9d6ef0dff/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/99df8b0d3917cc9a1347b5cf9cd029c9d6ef0dff/config
Defconfig      : http://autobuild.buildroot.net/results/99df8b0d3917cc9a1347b5cf9cd029c9d6ef0dff/defconfig

Build 65e60509aea566349e5b314e020c6a4a812e18db
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 10:41:12
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/65e60509aea566349e5b314e020c6a4a812e18db/build-end.log
Complete log   : http://autobuild.buildroot.net/results/65e60509aea566349e5b314e020c6a4a812e18db/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/65e60509aea566349e5b314e020c6a4a812e18db/config
Defconfig      : http://autobuild.buildroot.net/results/65e60509aea566349e5b314e020c6a4a812e18db/defconfig

Build 6d0ef8a8982bab207001b07b907ff42b269c3145
==============================================

Status         : OK
Architecture   : mips
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 10:44:28
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/6d0ef8a8982bab207001b07b907ff42b269c3145/build-end.log
Complete log   : http://autobuild.buildroot.net/results/6d0ef8a8982bab207001b07b907ff42b269c3145/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/6d0ef8a8982bab207001b07b907ff42b269c3145/config
Defconfig      : http://autobuild.buildroot.net/results/6d0ef8a8982bab207001b07b907ff42b269c3145/defconfig

Build 60406e65669fa77e7bdd6af1da97817de975caa4
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 11:05:39
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/60406e65669fa77e7bdd6af1da97817de975caa4/build-end.log
Complete log   : http://autobuild.buildroot.net/results/60406e65669fa77e7bdd6af1da97817de975caa4/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/60406e65669fa77e7bdd6af1da97817de975caa4/config
Defconfig      : http://autobuild.buildroot.net/results/60406e65669fa77e7bdd6af1da97817de975caa4/defconfig

Build e9b407204db480ed19742bfd5d7916ab5bbb0c5e
==============================================

Status         : NOK
Failure reason : microperl-5.12.4
Architecture   : bfin
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 11:07:48
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/e9b407204db480ed19742bfd5d7916ab5bbb0c5e/build-end.log
Complete log   : http://autobuild.buildroot.net/results/e9b407204db480ed19742bfd5d7916ab5bbb0c5e/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/e9b407204db480ed19742bfd5d7916ab5bbb0c5e/config
Defconfig      : http://autobuild.buildroot.net/results/e9b407204db480ed19742bfd5d7916ab5bbb0c5e/defconfig

Build be75f451ef1756089cb629811e29caef31bcabbb
==============================================

Status         : NOK
Failure reason : kexec-2.0.2
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 11:17:24
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/be75f451ef1756089cb629811e29caef31bcabbb/build-end.log
Complete log   : http://autobuild.buildroot.net/results/be75f451ef1756089cb629811e29caef31bcabbb/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/be75f451ef1756089cb629811e29caef31bcabbb/config
Defconfig      : http://autobuild.buildroot.net/results/be75f451ef1756089cb629811e29caef31bcabbb/defconfig

Build f916e8b7982d4537802bd62af50895eace9d3dd2
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 11:21:46
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/f916e8b7982d4537802bd62af50895eace9d3dd2/build-end.log
Complete log   : http://autobuild.buildroot.net/results/f916e8b7982d4537802bd62af50895eace9d3dd2/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/f916e8b7982d4537802bd62af50895eace9d3dd2/config
Defconfig      : http://autobuild.buildroot.net/results/f916e8b7982d4537802bd62af50895eace9d3dd2/defconfig

Build a94c1038365884c2d8c5f5a8cd209713a906b996
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 11:36:43
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/a94c1038365884c2d8c5f5a8cd209713a906b996/build-end.log
Complete log   : http://autobuild.buildroot.net/results/a94c1038365884c2d8c5f5a8cd209713a906b996/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/a94c1038365884c2d8c5f5a8cd209713a906b996/config
Defconfig      : http://autobuild.buildroot.net/results/a94c1038365884c2d8c5f5a8cd209713a906b996/defconfig

Build 4a0333d23b14da97575fce60bf30377cce55c1da
==============================================

Status         : NOK
Failure reason : qt-4.8.0
Architecture   : sh4
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 11:49:59
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/4a0333d23b14da97575fce60bf30377cce55c1da/build-end.log
Complete log   : http://autobuild.buildroot.net/results/4a0333d23b14da97575fce60bf30377cce55c1da/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/4a0333d23b14da97575fce60bf30377cce55c1da/config
Defconfig      : http://autobuild.buildroot.net/results/4a0333d23b14da97575fce60bf30377cce55c1da/defconfig

Build 62cdfca0ca36375b233caee892f4bca570f5a120
==============================================

Status         : NOK
Failure reason : ncurses-5.7
Architecture   : bfin
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 11:50:49
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/62cdfca0ca36375b233caee892f4bca570f5a120/build-end.log
Complete log   : http://autobuild.buildroot.net/results/62cdfca0ca36375b233caee892f4bca570f5a120/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/62cdfca0ca36375b233caee892f4bca570f5a120/config
Defconfig      : http://autobuild.buildroot.net/results/62cdfca0ca36375b233caee892f4bca570f5a120/defconfig

Build c1c9b0725867d178f6cba78aa4021907457bb181
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 11:56:33
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/c1c9b0725867d178f6cba78aa4021907457bb181/build-end.log
Complete log   : http://autobuild.buildroot.net/results/c1c9b0725867d178f6cba78aa4021907457bb181/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/c1c9b0725867d178f6cba78aa4021907457bb181/config
Defconfig      : http://autobuild.buildroot.net/results/c1c9b0725867d178f6cba78aa4021907457bb181/defconfig

Build 903062ce383428930f7957f730e40bba503435b2
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 12:01:03
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/903062ce383428930f7957f730e40bba503435b2/build-end.log
Complete log   : http://autobuild.buildroot.net/results/903062ce383428930f7957f730e40bba503435b2/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/903062ce383428930f7957f730e40bba503435b2/config
Defconfig      : http://autobuild.buildroot.net/results/903062ce383428930f7957f730e40bba503435b2/defconfig

Build 8e8fbd06a6ba7734c1661a10bbe5e90c36da609f
==============================================

Status         : NOK
Failure reason : icu-4.4.2
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 12:18:08
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/8e8fbd06a6ba7734c1661a10bbe5e90c36da609f/build-end.log
Complete log   : http://autobuild.buildroot.net/results/8e8fbd06a6ba7734c1661a10bbe5e90c36da609f/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/8e8fbd06a6ba7734c1661a10bbe5e90c36da609f/config
Defconfig      : http://autobuild.buildroot.net/results/8e8fbd06a6ba7734c1661a10bbe5e90c36da609f/defconfig

Build 9c969857019678c3cf319878ee524799c48c50bf
==============================================

Status         : NOK
Failure reason : socketcand-7d06986fa4b5fd2c210ec4e248dab41107be1ccd
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 12:45:21
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/9c969857019678c3cf319878ee524799c48c50bf/build-end.log
Complete log   : http://autobuild.buildroot.net/results/9c969857019678c3cf319878ee524799c48c50bf/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/9c969857019678c3cf319878ee524799c48c50bf/config
Defconfig      : http://autobuild.buildroot.net/results/9c969857019678c3cf319878ee524799c48c50bf/defconfig

Build 28d455f5422ea1d001a2b47fbf827f490e7e7040
==============================================

Status         : NOK
Failure reason : socketcand-7d06986fa4b5fd2c210ec4e248dab41107be1ccd
Architecture   : x86_64
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 12:52:16
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/28d455f5422ea1d001a2b47fbf827f490e7e7040/build-end.log
Complete log   : http://autobuild.buildroot.net/results/28d455f5422ea1d001a2b47fbf827f490e7e7040/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/28d455f5422ea1d001a2b47fbf827f490e7e7040/config
Defconfig      : http://autobuild.buildroot.net/results/28d455f5422ea1d001a2b47fbf827f490e7e7040/defconfig

Build 48fbc146883340a04dba94d346c4de61c6c549d3
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 13:05:05
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/48fbc146883340a04dba94d346c4de61c6c549d3/build-end.log
Complete log   : http://autobuild.buildroot.net/results/48fbc146883340a04dba94d346c4de61c6c549d3/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/48fbc146883340a04dba94d346c4de61c6c549d3/config
Defconfig      : http://autobuild.buildroot.net/results/48fbc146883340a04dba94d346c4de61c6c549d3/defconfig

Build f53c5967f41f4a81a91bf3fe26851f761d740181
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 13:06:48
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/f53c5967f41f4a81a91bf3fe26851f761d740181/build-end.log
Complete log   : http://autobuild.buildroot.net/results/f53c5967f41f4a81a91bf3fe26851f761d740181/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/f53c5967f41f4a81a91bf3fe26851f761d740181/config
Defconfig      : http://autobuild.buildroot.net/results/f53c5967f41f4a81a91bf3fe26851f761d740181/defconfig

Build 60d5e3a5990dabde1d7fef0f665b2b42699dd131
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 13:58:08
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/60d5e3a5990dabde1d7fef0f665b2b42699dd131/build-end.log
Complete log   : http://autobuild.buildroot.net/results/60d5e3a5990dabde1d7fef0f665b2b42699dd131/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/60d5e3a5990dabde1d7fef0f665b2b42699dd131/config
Defconfig      : http://autobuild.buildroot.net/results/60d5e3a5990dabde1d7fef0f665b2b42699dd131/defconfig

Build dcfc9c52cbdc6b47928167adce5e849cbc43ee67
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 14:24:30
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/dcfc9c52cbdc6b47928167adce5e849cbc43ee67/build-end.log
Complete log   : http://autobuild.buildroot.net/results/dcfc9c52cbdc6b47928167adce5e849cbc43ee67/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/dcfc9c52cbdc6b47928167adce5e849cbc43ee67/config
Defconfig      : http://autobuild.buildroot.net/results/dcfc9c52cbdc6b47928167adce5e849cbc43ee67/defconfig

Build b8a0d288b26f707d7c044e1326936c745f421385
==============================================

Status         : NOK
Failure reason : libnspr-4.8.7
Architecture   : x86_64
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 14:35:22
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/b8a0d288b26f707d7c044e1326936c745f421385/build-end.log
Complete log   : http://autobuild.buildroot.net/results/b8a0d288b26f707d7c044e1326936c745f421385/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/b8a0d288b26f707d7c044e1326936c745f421385/config
Defconfig      : http://autobuild.buildroot.net/results/b8a0d288b26f707d7c044e1326936c745f421385/defconfig

Build e282e7db9231d566f818880be95aac4a84ebe46f
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 14:37:45
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/e282e7db9231d566f818880be95aac4a84ebe46f/build-end.log
Complete log   : http://autobuild.buildroot.net/results/e282e7db9231d566f818880be95aac4a84ebe46f/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/e282e7db9231d566f818880be95aac4a84ebe46f/config
Defconfig      : http://autobuild.buildroot.net/results/e282e7db9231d566f818880be95aac4a84ebe46f/defconfig

Build 26778f40b1ea4c4ad342727923a2efbec89b7096
==============================================

Status         : NOK
Failure reason : socketcand-7d06986fa4b5fd2c210ec4e248dab41107be1ccd
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 14:39:27
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/26778f40b1ea4c4ad342727923a2efbec89b7096/build-end.log
Complete log   : http://autobuild.buildroot.net/results/26778f40b1ea4c4ad342727923a2efbec89b7096/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/26778f40b1ea4c4ad342727923a2efbec89b7096/config
Defconfig      : http://autobuild.buildroot.net/results/26778f40b1ea4c4ad342727923a2efbec89b7096/defconfig

Build 739d0e0ebf58f3b44621de5c7ac631c3a39610a8
==============================================

Status         : OK
Architecture   : mips
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 15:02:23
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/739d0e0ebf58f3b44621de5c7ac631c3a39610a8/build-end.log
Complete log   : http://autobuild.buildroot.net/results/739d0e0ebf58f3b44621de5c7ac631c3a39610a8/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/739d0e0ebf58f3b44621de5c7ac631c3a39610a8/config
Defconfig      : http://autobuild.buildroot.net/results/739d0e0ebf58f3b44621de5c7ac631c3a39610a8/defconfig

Build 75923b6c0552fdcc0c7208952ee5e05c234ceaa3
==============================================

Status         : NOK
Failure reason : ltrace-0.5.3
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 15:12:15
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/75923b6c0552fdcc0c7208952ee5e05c234ceaa3/build-end.log
Complete log   : http://autobuild.buildroot.net/results/75923b6c0552fdcc0c7208952ee5e05c234ceaa3/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/75923b6c0552fdcc0c7208952ee5e05c234ceaa3/config
Defconfig      : http://autobuild.buildroot.net/results/75923b6c0552fdcc0c7208952ee5e05c234ceaa3/defconfig

Build a9e6a8ecce6a58234e5c279fec4ea5c6dd975b62
==============================================

Status         : NOK
Failure reason : libmpeg2-0.5.1
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 15:32:19
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/a9e6a8ecce6a58234e5c279fec4ea5c6dd975b62/build-end.log
Complete log   : http://autobuild.buildroot.net/results/a9e6a8ecce6a58234e5c279fec4ea5c6dd975b62/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/a9e6a8ecce6a58234e5c279fec4ea5c6dd975b62/config
Defconfig      : http://autobuild.buildroot.net/results/a9e6a8ecce6a58234e5c279fec4ea5c6dd975b62/defconfig

Build 9cd50434a2a265c2202ae2af5f620dbe068a4b99
==============================================

Status         : NOK
Failure reason : binutils-2.21
Architecture   : avr32
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 15:36:10
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/9cd50434a2a265c2202ae2af5f620dbe068a4b99/build-end.log
Complete log   : http://autobuild.buildroot.net/results/9cd50434a2a265c2202ae2af5f620dbe068a4b99/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/9cd50434a2a265c2202ae2af5f620dbe068a4b99/config
Defconfig      : http://autobuild.buildroot.net/results/9cd50434a2a265c2202ae2af5f620dbe068a4b99/defconfig

Build 6ebf009f58518d82bf0b68ec414045030b305cb4
==============================================

Status         : NOK
Failure reason : icu-4.4.2
Architecture   : x86_64
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 15:45:26
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/6ebf009f58518d82bf0b68ec414045030b305cb4/build-end.log
Complete log   : http://autobuild.buildroot.net/results/6ebf009f58518d82bf0b68ec414045030b305cb4/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/6ebf009f58518d82bf0b68ec414045030b305cb4/config
Defconfig      : http://autobuild.buildroot.net/results/6ebf009f58518d82bf0b68ec414045030b305cb4/defconfig

Build 52e61f47878317e0d94d1cb6776c4b9784eb23fa
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 15:54:09
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/52e61f47878317e0d94d1cb6776c4b9784eb23fa/build-end.log
Complete log   : http://autobuild.buildroot.net/results/52e61f47878317e0d94d1cb6776c4b9784eb23fa/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/52e61f47878317e0d94d1cb6776c4b9784eb23fa/config
Defconfig      : http://autobuild.buildroot.net/results/52e61f47878317e0d94d1cb6776c4b9784eb23fa/defconfig

Build a67bb236ddb36950de66a131e5d9e316bf35bf60
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 15:55:38
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/a67bb236ddb36950de66a131e5d9e316bf35bf60/build-end.log
Complete log   : http://autobuild.buildroot.net/results/a67bb236ddb36950de66a131e5d9e316bf35bf60/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/a67bb236ddb36950de66a131e5d9e316bf35bf60/config
Defconfig      : http://autobuild.buildroot.net/results/a67bb236ddb36950de66a131e5d9e316bf35bf60/defconfig

Build 57c1e1a21d340a82813e2c12bbe7a4fff94a95d2
==============================================

Status         : NOK
Failure reason : speex-1.2rc1
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 16:14:02
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/57c1e1a21d340a82813e2c12bbe7a4fff94a95d2/build-end.log
Complete log   : http://autobuild.buildroot.net/results/57c1e1a21d340a82813e2c12bbe7a4fff94a95d2/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/57c1e1a21d340a82813e2c12bbe7a4fff94a95d2/config
Defconfig      : http://autobuild.buildroot.net/results/57c1e1a21d340a82813e2c12bbe7a4fff94a95d2/defconfig

Build c8fe99b615f00d6dcb4e538c27cdf084f24b0221
==============================================

Status         : NOK
Failure reason : libffi-3.0.10
Architecture   : sh2a
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 16:16:51
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/c8fe99b615f00d6dcb4e538c27cdf084f24b0221/build-end.log
Complete log   : http://autobuild.buildroot.net/results/c8fe99b615f00d6dcb4e538c27cdf084f24b0221/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/c8fe99b615f00d6dcb4e538c27cdf084f24b0221/config
Defconfig      : http://autobuild.buildroot.net/results/c8fe99b615f00d6dcb4e538c27cdf084f24b0221/defconfig

Build f2e24f265cbbf354ef55d8a265c496e0c12c1761
==============================================

Status         : NOK
Failure reason : socat-2.0.0-b4
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 16:28:22
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/f2e24f265cbbf354ef55d8a265c496e0c12c1761/build-end.log
Complete log   : http://autobuild.buildroot.net/results/f2e24f265cbbf354ef55d8a265c496e0c12c1761/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/f2e24f265cbbf354ef55d8a265c496e0c12c1761/config
Defconfig      : http://autobuild.buildroot.net/results/f2e24f265cbbf354ef55d8a265c496e0c12c1761/defconfig

Build 32dfd9bf4b06745a74506aa7135a1f327d78bbf6
==============================================

Status         : NOK
Failure reason : boost-1.47.0
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 16:43:37
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/32dfd9bf4b06745a74506aa7135a1f327d78bbf6/build-end.log
Complete log   : http://autobuild.buildroot.net/results/32dfd9bf4b06745a74506aa7135a1f327d78bbf6/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/32dfd9bf4b06745a74506aa7135a1f327d78bbf6/config
Defconfig      : http://autobuild.buildroot.net/results/32dfd9bf4b06745a74506aa7135a1f327d78bbf6/defconfig

Build 3dce9fa4f4f81f2f0e71b8e59170f4e69ef844f4
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 16:46:27
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/3dce9fa4f4f81f2f0e71b8e59170f4e69ef844f4/build-end.log
Complete log   : http://autobuild.buildroot.net/results/3dce9fa4f4f81f2f0e71b8e59170f4e69ef844f4/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/3dce9fa4f4f81f2f0e71b8e59170f4e69ef844f4/config
Defconfig      : http://autobuild.buildroot.net/results/3dce9fa4f4f81f2f0e71b8e59170f4e69ef844f4/defconfig

Build 493977a7c982dc9d7306a0140f3d806f9d2abd2a
==============================================

Status         : NOK
Failure reason : libnspr-4.8.7
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 17:04:55
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/493977a7c982dc9d7306a0140f3d806f9d2abd2a/build-end.log
Complete log   : http://autobuild.buildroot.net/results/493977a7c982dc9d7306a0140f3d806f9d2abd2a/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/493977a7c982dc9d7306a0140f3d806f9d2abd2a/config
Defconfig      : http://autobuild.buildroot.net/results/493977a7c982dc9d7306a0140f3d806f9d2abd2a/defconfig

Build 3494c8c22c211e72587f3dfce6ce7a256a00e194
==============================================

Status         : NOK
Failure reason : beecrypt-4.2.1
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 17:11:39
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/3494c8c22c211e72587f3dfce6ce7a256a00e194/build-end.log
Complete log   : http://autobuild.buildroot.net/results/3494c8c22c211e72587f3dfce6ce7a256a00e194/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/3494c8c22c211e72587f3dfce6ce7a256a00e194/config
Defconfig      : http://autobuild.buildroot.net/results/3494c8c22c211e72587f3dfce6ce7a256a00e194/defconfig

Build cf6f06bcdd2a5ab12215b70571bd755586a5415c
==============================================

Status         : OK
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 17:34:34
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/cf6f06bcdd2a5ab12215b70571bd755586a5415c/build-end.log
Complete log   : http://autobuild.buildroot.net/results/cf6f06bcdd2a5ab12215b70571bd755586a5415c/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/cf6f06bcdd2a5ab12215b70571bd755586a5415c/config
Defconfig      : http://autobuild.buildroot.net/results/cf6f06bcdd2a5ab12215b70571bd755586a5415c/defconfig

Build ef9e8f511f06cf6c30a88b54d09579efc3a20527
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 17:38:17
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/ef9e8f511f06cf6c30a88b54d09579efc3a20527/build-end.log
Complete log   : http://autobuild.buildroot.net/results/ef9e8f511f06cf6c30a88b54d09579efc3a20527/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/ef9e8f511f06cf6c30a88b54d09579efc3a20527/config
Defconfig      : http://autobuild.buildroot.net/results/ef9e8f511f06cf6c30a88b54d09579efc3a20527/defconfig

Build d5cf87d36315b5f9a671880c345adfd5327229ed
==============================================

Status         : NOK
Failure reason : socketcand-7d06986fa4b5fd2c210ec4e248dab41107be1ccd
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 17:50:10
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/d5cf87d36315b5f9a671880c345adfd5327229ed/build-end.log
Complete log   : http://autobuild.buildroot.net/results/d5cf87d36315b5f9a671880c345adfd5327229ed/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/d5cf87d36315b5f9a671880c345adfd5327229ed/config
Defconfig      : http://autobuild.buildroot.net/results/d5cf87d36315b5f9a671880c345adfd5327229ed/defconfig

Build 9394a3ab1d613088ba8f8d0539cf1316eb9a5dc6
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 18:23:41
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/9394a3ab1d613088ba8f8d0539cf1316eb9a5dc6/build-end.log
Complete log   : http://autobuild.buildroot.net/results/9394a3ab1d613088ba8f8d0539cf1316eb9a5dc6/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/9394a3ab1d613088ba8f8d0539cf1316eb9a5dc6/config
Defconfig      : http://autobuild.buildroot.net/results/9394a3ab1d613088ba8f8d0539cf1316eb9a5dc6/defconfig

Build 8e06433a7320b2f83ffc87b6c7b9bc2a93774014
==============================================

Status         : OK
Architecture   : x86_64
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 18:29:03
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/8e06433a7320b2f83ffc87b6c7b9bc2a93774014/build-end.log
Complete log   : http://autobuild.buildroot.net/results/8e06433a7320b2f83ffc87b6c7b9bc2a93774014/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/8e06433a7320b2f83ffc87b6c7b9bc2a93774014/config
Defconfig      : http://autobuild.buildroot.net/results/8e06433a7320b2f83ffc87b6c7b9bc2a93774014/defconfig

Build f3deff6edd0079893c80c7e04be9c824f116a1de
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 18:31:20
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/f3deff6edd0079893c80c7e04be9c824f116a1de/build-end.log
Complete log   : http://autobuild.buildroot.net/results/f3deff6edd0079893c80c7e04be9c824f116a1de/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/f3deff6edd0079893c80c7e04be9c824f116a1de/config
Defconfig      : http://autobuild.buildroot.net/results/f3deff6edd0079893c80c7e04be9c824f116a1de/defconfig

Build 65c00c5992bf0148e2d49c90547752524d04aee7
==============================================

Status         : NOK
Failure reason : socat-2.0.0-b4
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 18:34:52
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/65c00c5992bf0148e2d49c90547752524d04aee7/build-end.log
Complete log   : http://autobuild.buildroot.net/results/65c00c5992bf0148e2d49c90547752524d04aee7/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/65c00c5992bf0148e2d49c90547752524d04aee7/config
Defconfig      : http://autobuild.buildroot.net/results/65c00c5992bf0148e2d49c90547752524d04aee7/defconfig

Build 1d51669a3df3d1bb78d37df9fc77c848b1e2d36c
==============================================

Status         : NOK
Failure reason : icu-4.4.2
Architecture   : bfin
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 18:35:08
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/1d51669a3df3d1bb78d37df9fc77c848b1e2d36c/build-end.log
Complete log   : http://autobuild.buildroot.net/results/1d51669a3df3d1bb78d37df9fc77c848b1e2d36c/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/1d51669a3df3d1bb78d37df9fc77c848b1e2d36c/config
Defconfig      : http://autobuild.buildroot.net/results/1d51669a3df3d1bb78d37df9fc77c848b1e2d36c/defconfig

Build a6edcf1a3f1bf1b102e3db68dbbbd3f142bf681d
==============================================

Status         : NOK
Failure reason : mrouted-3.9.4
Architecture   : sh4
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 18:56:21
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/a6edcf1a3f1bf1b102e3db68dbbbd3f142bf681d/build-end.log
Complete log   : http://autobuild.buildroot.net/results/a6edcf1a3f1bf1b102e3db68dbbbd3f142bf681d/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/a6edcf1a3f1bf1b102e3db68dbbbd3f142bf681d/config
Defconfig      : http://autobuild.buildroot.net/results/a6edcf1a3f1bf1b102e3db68dbbbd3f142bf681d/defconfig

Build f75fbf90a53f1b7d0f88d5b5878b701cc31a05f5
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 19:21:52
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/f75fbf90a53f1b7d0f88d5b5878b701cc31a05f5/build-end.log
Complete log   : http://autobuild.buildroot.net/results/f75fbf90a53f1b7d0f88d5b5878b701cc31a05f5/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/f75fbf90a53f1b7d0f88d5b5878b701cc31a05f5/config
Defconfig      : http://autobuild.buildroot.net/results/f75fbf90a53f1b7d0f88d5b5878b701cc31a05f5/defconfig

Build 42231211329e732ae519c3f78428854a6aa92eb2
==============================================

Status         : OK
Architecture   : sh4
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 19:35:10
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/42231211329e732ae519c3f78428854a6aa92eb2/build-end.log
Complete log   : http://autobuild.buildroot.net/results/42231211329e732ae519c3f78428854a6aa92eb2/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/42231211329e732ae519c3f78428854a6aa92eb2/config
Defconfig      : http://autobuild.buildroot.net/results/42231211329e732ae519c3f78428854a6aa92eb2/defconfig

Build 44779ec0bd31a258ccf0b233092c52bf79ac9bae
==============================================

Status         : OK
Architecture   : i586
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 19:49:21
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/44779ec0bd31a258ccf0b233092c52bf79ac9bae/build-end.log
Complete log   : http://autobuild.buildroot.net/results/44779ec0bd31a258ccf0b233092c52bf79ac9bae/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/44779ec0bd31a258ccf0b233092c52bf79ac9bae/config
Defconfig      : http://autobuild.buildroot.net/results/44779ec0bd31a258ccf0b233092c52bf79ac9bae/defconfig

Build af5a42b6181d3a1e6025b38f153289a50b205cab
==============================================

Status         : NOK
Failure reason : lttng-libust-1.9.2
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 20:03:03
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/af5a42b6181d3a1e6025b38f153289a50b205cab/build-end.log
Complete log   : http://autobuild.buildroot.net/results/af5a42b6181d3a1e6025b38f153289a50b205cab/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/af5a42b6181d3a1e6025b38f153289a50b205cab/config
Defconfig      : http://autobuild.buildroot.net/results/af5a42b6181d3a1e6025b38f153289a50b205cab/defconfig

Build 3eaceb75b91cc689c965474704e4a778e8daed2c
==============================================

Status         : OK
Architecture   : x86_64
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 20:06:28
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/3eaceb75b91cc689c965474704e4a778e8daed2c/build-end.log
Complete log   : http://autobuild.buildroot.net/results/3eaceb75b91cc689c965474704e4a778e8daed2c/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/3eaceb75b91cc689c965474704e4a778e8daed2c/config
Defconfig      : http://autobuild.buildroot.net/results/3eaceb75b91cc689c965474704e4a778e8daed2c/defconfig

Build f8169f8e01e50329e070606561c92c8f34d7609a
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 20:14:02
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/f8169f8e01e50329e070606561c92c8f34d7609a/build-end.log
Complete log   : http://autobuild.buildroot.net/results/f8169f8e01e50329e070606561c92c8f34d7609a/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/f8169f8e01e50329e070606561c92c8f34d7609a/config
Defconfig      : http://autobuild.buildroot.net/results/f8169f8e01e50329e070606561c92c8f34d7609a/defconfig

Build 57207bf27f277eef2f80999ae738503454e30c42
==============================================

Status         : NOK
Failure reason : lttng-libust-1.9.2
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 20:43:49
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/57207bf27f277eef2f80999ae738503454e30c42/build-end.log
Complete log   : http://autobuild.buildroot.net/results/57207bf27f277eef2f80999ae738503454e30c42/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/57207bf27f277eef2f80999ae738503454e30c42/config
Defconfig      : http://autobuild.buildroot.net/results/57207bf27f277eef2f80999ae738503454e30c42/defconfig

Build 6184daa47f56ac7365da20cdedd4cf8628e0c9fd
==============================================

Status         : NOK
Failure reason : libgtk2-2.24.9
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 20:59:52
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/6184daa47f56ac7365da20cdedd4cf8628e0c9fd/build-end.log
Complete log   : http://autobuild.buildroot.net/results/6184daa47f56ac7365da20cdedd4cf8628e0c9fd/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/6184daa47f56ac7365da20cdedd4cf8628e0c9fd/config
Defconfig      : http://autobuild.buildroot.net/results/6184daa47f56ac7365da20cdedd4cf8628e0c9fd/defconfig

Build e9cb1c9964422ef544ef1bc04b3fd6939686915e
==============================================

Status         : NOK
Failure reason : libgtk2-2.24.9
Architecture   : i686
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 21:04:20
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/e9cb1c9964422ef544ef1bc04b3fd6939686915e/build-end.log
Complete log   : http://autobuild.buildroot.net/results/e9cb1c9964422ef544ef1bc04b3fd6939686915e/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/e9cb1c9964422ef544ef1bc04b3fd6939686915e/config
Defconfig      : http://autobuild.buildroot.net/results/e9cb1c9964422ef544ef1bc04b3fd6939686915e/defconfig

Build 96a653844702c33c23627fa1c58e46fa624042f3
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 21:05:11
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/96a653844702c33c23627fa1c58e46fa624042f3/build-end.log
Complete log   : http://autobuild.buildroot.net/results/96a653844702c33c23627fa1c58e46fa624042f3/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/96a653844702c33c23627fa1c58e46fa624042f3/config
Defconfig      : http://autobuild.buildroot.net/results/96a653844702c33c23627fa1c58e46fa624042f3/defconfig

Build bc3d82644014f405b1026c459bc0116fd0f8c648
==============================================

Status         : OK
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 21:15:03
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/bc3d82644014f405b1026c459bc0116fd0f8c648/build-end.log
Complete log   : http://autobuild.buildroot.net/results/bc3d82644014f405b1026c459bc0116fd0f8c648/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/bc3d82644014f405b1026c459bc0116fd0f8c648/config
Defconfig      : http://autobuild.buildroot.net/results/bc3d82644014f405b1026c459bc0116fd0f8c648/defconfig

Build 397a4b92f72b8d870d8cafcbd3ef1bf6fb37c696
==============================================

Status         : OK
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 21:43:52
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/397a4b92f72b8d870d8cafcbd3ef1bf6fb37c696/build-end.log
Complete log   : http://autobuild.buildroot.net/results/397a4b92f72b8d870d8cafcbd3ef1bf6fb37c696/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/397a4b92f72b8d870d8cafcbd3ef1bf6fb37c696/config
Defconfig      : http://autobuild.buildroot.net/results/397a4b92f72b8d870d8cafcbd3ef1bf6fb37c696/defconfig

Build 32722b90409fcdeacacb5307610563cc729eb284
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 21:46:46
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/32722b90409fcdeacacb5307610563cc729eb284/build-end.log
Complete log   : http://autobuild.buildroot.net/results/32722b90409fcdeacacb5307610563cc729eb284/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/32722b90409fcdeacacb5307610563cc729eb284/config
Defconfig      : http://autobuild.buildroot.net/results/32722b90409fcdeacacb5307610563cc729eb284/defconfig

Build 2cf4a04c0351d9a58ace331e1fa89bf26c5bf5b5
==============================================

Status         : OK
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 22:18:39
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/2cf4a04c0351d9a58ace331e1fa89bf26c5bf5b5/build-end.log
Complete log   : http://autobuild.buildroot.net/results/2cf4a04c0351d9a58ace331e1fa89bf26c5bf5b5/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/2cf4a04c0351d9a58ace331e1fa89bf26c5bf5b5/config
Defconfig      : http://autobuild.buildroot.net/results/2cf4a04c0351d9a58ace331e1fa89bf26c5bf5b5/defconfig

Build 81b7e1cd8961a9f93b17df0a1227b5f2828b4169
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 22:26:05
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/81b7e1cd8961a9f93b17df0a1227b5f2828b4169/build-end.log
Complete log   : http://autobuild.buildroot.net/results/81b7e1cd8961a9f93b17df0a1227b5f2828b4169/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/81b7e1cd8961a9f93b17df0a1227b5f2828b4169/config
Defconfig      : http://autobuild.buildroot.net/results/81b7e1cd8961a9f93b17df0a1227b5f2828b4169/defconfig

Build 6c5cbdb1508b4b921c4c8c248188679237d51974
==============================================

Status         : OK
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 22:37:38
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/6c5cbdb1508b4b921c4c8c248188679237d51974/build-end.log
Complete log   : http://autobuild.buildroot.net/results/6c5cbdb1508b4b921c4c8c248188679237d51974/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/6c5cbdb1508b4b921c4c8c248188679237d51974/config
Defconfig      : http://autobuild.buildroot.net/results/6c5cbdb1508b4b921c4c8c248188679237d51974/defconfig

Build 5b8ad7c15a4fde6f89920034f0ed4b5fead10794
==============================================

Status         : NOK
Failure reason : lttng-libust-1.9.2
Architecture   : arm
Submitted by   : Peter Korsgaard (gcc10)
Submitted at   : 2012-03-28 22:45:37
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/5b8ad7c15a4fde6f89920034f0ed4b5fead10794/build-end.log
Complete log   : http://autobuild.buildroot.net/results/5b8ad7c15a4fde6f89920034f0ed4b5fead10794/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/5b8ad7c15a4fde6f89920034f0ed4b5fead10794/config
Defconfig      : http://autobuild.buildroot.net/results/5b8ad7c15a4fde6f89920034f0ed4b5fead10794/defconfig

Build 7294b8283a571afbb10ed63eac6800c77e4a09c9
==============================================

Status         : OK
Architecture   : powerpc
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 22:50:44
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/7294b8283a571afbb10ed63eac6800c77e4a09c9/build-end.log
Complete log   : http://autobuild.buildroot.net/results/7294b8283a571afbb10ed63eac6800c77e4a09c9/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/7294b8283a571afbb10ed63eac6800c77e4a09c9/config
Defconfig      : http://autobuild.buildroot.net/results/7294b8283a571afbb10ed63eac6800c77e4a09c9/defconfig

Build 7f56b397cc298c4836540bac98a2684caee80bd3
==============================================

Status         : OK
Architecture   : i686
Submitted by   : Peter Korsgaard (gcc110)
Submitted at   : 2012-03-28 23:09:52
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/7f56b397cc298c4836540bac98a2684caee80bd3/build-end.log
Complete log   : http://autobuild.buildroot.net/results/7f56b397cc298c4836540bac98a2684caee80bd3/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/7f56b397cc298c4836540bac98a2684caee80bd3/config
Defconfig      : http://autobuild.buildroot.net/results/7f56b397cc298c4836540bac98a2684caee80bd3/defconfig

Build 4703d81d84a8699280f1681629ec57525505237e
==============================================

Status         : OK
Architecture   : mips
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 23:12:40
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/4703d81d84a8699280f1681629ec57525505237e/build-end.log
Complete log   : http://autobuild.buildroot.net/results/4703d81d84a8699280f1681629ec57525505237e/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/4703d81d84a8699280f1681629ec57525505237e/config
Defconfig      : http://autobuild.buildroot.net/results/4703d81d84a8699280f1681629ec57525505237e/defconfig

Build 60951c315722577586f62d887b9b7e0cd5d08e12
==============================================

Status         : NOK
Failure reason : directfb-1.4.15
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 23:14:35
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/60951c315722577586f62d887b9b7e0cd5d08e12/build-end.log
Complete log   : http://autobuild.buildroot.net/results/60951c315722577586f62d887b9b7e0cd5d08e12/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/60951c315722577586f62d887b9b7e0cd5d08e12/config
Defconfig      : http://autobuild.buildroot.net/results/60951c315722577586f62d887b9b7e0cd5d08e12/defconfig

Build 0cd2fd36710b69644c3ba4e4451bcd3e244f1adf
==============================================

Status         : NOK
Failure reason : openssl-1.0.0h
Architecture   : arm
Submitted by   : Thomas Petazzoni (Free Electrons build server)
Submitted at   : 2012-03-28 23:44:14
Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
End of log     : http://autobuild.buildroot.net/results/0cd2fd36710b69644c3ba4e4451bcd3e244f1adf/build-end.log
Complete log   : http://autobuild.buildroot.net/results/0cd2fd36710b69644c3ba4e4451bcd3e244f1adf/build.log.bz2
Configuration  : http://autobuild.buildroot.net/results/0cd2fd36710b69644c3ba4e4451bcd3e244f1adf/config
Defconfig      : http://autobuild.buildroot.net/results/0cd2fd36710b69644c3ba4e4451bcd3e244f1adf/defconfig



-- 
http://autobuild.buildroot.net
