Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4685C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 13:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F23460B9B;
	Mon, 28 Mar 2022 13:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bZygcFSFPsqn; Mon, 28 Mar 2022 13:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6563160B17;
	Mon, 28 Mar 2022 13:40:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C71531BF297
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 13:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B370D40354
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 13:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6EPvL6W7Ii7z for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 13:39:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B4514018F
 for <buildroot@uclibc.org>; Mon, 28 Mar 2022 13:39:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 36ED085EDA; Mon, 28 Mar 2022 13:30:48 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 28 Mar 2022 13:39:58 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: w.meganck@televic.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14706-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14706] New: nodjs build problem
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14706

            Bug ID: 14706
           Summary: nodjs build problem
           Product: buildroot
           Version: 2022.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: w.meganck@televic.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Have a build problem with nodejs.

mkdir -p
/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/bin
ln -sf
/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/bin/python3
/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/bin/python
/bin/sed -i -e "s%@MAYBE_WRAPPER@%%g"
/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/node.gyp
/bin/sed -i -e "s%@MAYBE_WRAPPER@%%g"
/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/tools/v8_gypfiles/v8.gyp
(cd
/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3;
PATH="/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/bin:/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/microchip/xc16/v1.41/bin:/opt/microchip/xc16/v1.41/bin"
PKG_CONFIG="/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/lib/pkgconfig:/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/share/pkgconfig"
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/usr/bin/gcc" GCC="/usr/bin/gcc" CXX="/usr/bin/g++" CPP="/usr/bin/cpp"
OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/include"
CFLAGS="-O2
-I/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/include"
CXXFLAGS="-O2
-I/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/include"
LDFLAGS="-L/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/lib
-Wl,-rpath,/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/lib"
INTLTOOL_PERL=/usr/bin/perl
PATH=/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/bin:"/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/bin:/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/microchip/xc16/v1.41/bin:/opt/microchip/xc16/v1.41/bin"
PYTHON=/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/bin/python3
/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/bin/python3
./configure
--prefix=/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host
--without-dtrace --without-etw --shared-openssl
--shared-openssl-includes=/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/include
--shared-openssl-libpath=/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/lib
--shared-zlib --no-cross-compiling --with-intl=system-icu )
Node.js configure: Found Python 3.10.2...
Traceback (most recent call last):
  File
"/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/./configure",
line 30, in <module>
    import configure
  File
"/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/configure.py",
line 14, in <module>
    import bz2
  File
"/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/host/lib/python3.10/bz2.py",
line 17, in <module>
    from _bz2 import BZ2Compressor, BZ2Decompressor
ModuleNotFoundError: No module named '_bz2'
package/pkg-generic.mk:272: recipe for target
'/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/.stamp_configured'
failed
make[1]: ***
[/home/wm/projects/televic/dev/buildroot-new4/output_confidea_g4_wcap/build/host-nodejs-14.18.3/.stamp_configured]
Error 1
Makefile:23: recipe for target '_all' failed
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
