Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2364BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2AA5611C3;
	Thu, 28 Apr 2022 21:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tx1VCVGMkS0; Thu, 28 Apr 2022 21:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED1C3611BE;
	Thu, 28 Apr 2022 21:12:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E61D1BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CDE74048A
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gALf-8VUFXu2 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:10:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43413400E3
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:10:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2A553846A5; Thu, 28 Apr 2022 21:00:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:10:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b492a2671bea67b9af033df2ae0d3aec0ba5ded1
X-Git-Newrev: 29bd9004b48e75c84bb83918f40b40ba6ec65ca6
X-Patchwork-Hint: ignore
Message-Id: <20220428210006.2A553846A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vlc: bump version to 3.0.17.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=29bd9004b48e75c84bb83918f40b40ba6ec65ca6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: http://www.videolan.org/vlc/releases/3.0.17.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vlc/vlc.hash | 8 ++++----
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 468ec7df35..9060097906 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/vlc/3.0.16/vlc-3.0.16.tar.xz.sha256
-sha256  ffae35fc64f625c175571d2346bc5f6207be99762517f15423e74f18399410f6  vlc-3.0.16.tar.xz
-# From https://get.videolan.org/vlc/3.0.16/vlc-3.0.16.tar.xz.sha1
-sha1  e22ac839a09b5ead8992ae6aa8ea886364283e6a  vlc-3.0.16.tar.xz
+# From https://get.videolan.org/vlc/3.0.17.4/vlc-3.0.17.4.tar.xz.sha256
+sha256  8c5a62d88a4fb45c1b095cf10befef217dfa87aedcec5184b9e7d590b6dd4133  vlc-3.0.17.4.tar.xz
+# From https://get.videolan.org/vlc/3.0.17.4/vlc-3.0.17.4.tar.xz.sha1
+sha1  ebcd9939103fda141267c5a8f1c603df4533218e  vlc-3.0.17.4.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index b793e0efe0..aee3b735a9 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.16
+VLC_VERSION = 3.0.17.4
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
