Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7525C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B2156118A;
	Fri,  9 Dec 2022 17:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2156118A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMvBZ9Byqtv3; Fri,  9 Dec 2022 17:05:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94F14610D2;
	Fri,  9 Dec 2022 17:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94F14610D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A3911BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDBA560EC6
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDBA560EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNS38yVNWuGb for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9739611A2
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9739611A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA5FF85E9E; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e20641dcf85dada48621f46e1f30966c90696317
X-Git-Newrev: 7b0c8c6aee402bc6e9128bc8bb535ad1ef1f2fc5
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.BA5FF85E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xlsatoms: bump version
 to 1.1.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b0c8c6aee402bc6e9128bc8bb535ad1ef1f2fc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-November/003258.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash | 8 +++-----
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
index 21484fdcdf..be9ed6f0b4 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002951.html
-md5  61671fee12535347db24ec3a715032a7  xlsatoms-1.1.3.tar.bz2
-sha1  9fdb1e8df6bb08529a812ac90f63d500bf5174cc  xlsatoms-1.1.3.tar.bz2
-sha256  57868f958c263976727881f3078e55b86b4a109dc578d2b92f5c6d690850a382  xlsatoms-1.1.3.tar.bz2
-sha512  c267ccfdc5a83e834bfb5c3b144e22642badcadef4eb146eeec2df6fe6f85e9379500ae4219912c70fa2e535036a1a96cf496381f5d814e79af075e03c975f30  xlsatoms-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-November/003258.html
+sha256  f4bfa15f56c066d326a5d5b292646708f25b9247506840b9047cd2687dcc71b7  xlsatoms-1.1.4.tar.xz
+sha512  82f0d1e17850770537eac82947eff4514639f8122bd864e02685ede49db110a4c90c7782702ffb677a2b581f3eacd10dba80e63e29e7a1ed1c9255ee163fe0c4  xlsatoms-1.1.4.tar.xz
 # Locally computed
 sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index a3230fc2dc..2ef09ef2d5 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XLSATOMS_VERSION = 1.1.3
-XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
-XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLSATOMS_VERSION = 1.1.4
+XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.xz
+XAPP_XLSATOMS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLSATOMS_LICENSE = MIT
 XAPP_XLSATOMS_LICENSE_FILES = COPYING
 XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
