Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB96E728CA
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 17:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC3EA829FD;
	Fri, 29 Sep 2023 17:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC3EA829FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNrfhQYOYGQ8; Fri, 29 Sep 2023 17:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C68383C84;
	Fri, 29 Sep 2023 17:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C68383C84
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3C3A1BF267
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC7DB60A9B
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC7DB60A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRHS_xK_65bt for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 17:40:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7A0F60E07
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 17:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A0F60E07
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D40088354A; Fri, 29 Sep 2023 17:39:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 19:34:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4fcdc680155d726c7d23842bb00ebc0c77ffd12
X-Git-Newrev: 9eff64e8163b0cb039db8e817f2f97ee8ccfc1e5
X-Patchwork-Hint: ignore
Message-Id: <20230929173959.D40088354A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/upx: bump to version 4.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9eff64e8163b0cb039db8e817f2f97ee8ccfc1e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/upx/upx/blob/v4.1.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upx/upx.hash | 2 +-
 package/upx/upx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/upx/upx.hash b/package/upx/upx.hash
index 7c24906152..072bc0656e 100644
--- a/package/upx/upx.hash
+++ b/package/upx/upx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1221e725b1a89e06739df27fae394d6bc88aedbe12f137c630ec772522cbc76f  upx-4.0.2-src.tar.xz
+sha256  0582f78b517ea87ba1caa6e8c111474f58edd167e5f01f074d7d9ca2f81d47d0  upx-4.1.0-src.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 6018b0a63d..0a0e9086e5 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPX_VERSION = 4.0.2
+UPX_VERSION = 4.1.0
 UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
