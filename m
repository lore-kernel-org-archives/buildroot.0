Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D514C47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 09:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0415B83E7E;
	Fri, 26 Jan 2024 09:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0415B83E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNzQcvY__kQE; Fri, 26 Jan 2024 09:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB8F835F2;
	Fri, 26 Jan 2024 09:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB8F835F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A3E91BF2B0
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 09:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 747C1850D8
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 09:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 747C1850D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id stDWWE7R2lRW for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 09:08:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9260850D6
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 09:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9260850D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7EC786537; Fri, 26 Jan 2024 09:08:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 10:06:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a933c807957df8c38216652437bb9a2d8bb1765c
X-Git-Newrev: 23534a6b41d6dd530395fa3727dd080aaca27a3d
X-Patchwork-Hint: ignore
Message-Id: <20240126090809.C7EC786537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/genimage: bump version to 17.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=23534a6b41d6dd530395fa3727dd080aaca27a3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This changes bumps the version of the genimage package,
which brings in fixes when generating flash images that
reference sparse files, along with other fixes and features.

Signed-off-by: Hudson Ayers <hudson.ayers@getcruise.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/genimage/genimage.hash | 2 +-
 package/genimage/genimage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
index 7ea8f99fda..e09ffd82be 100644
--- a/package/genimage/genimage.hash
+++ b/package/genimage/genimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  869f9662d3b778c69b1d1fe70df658e1c9e90aeda26abb753f6fe55e8b0c6e73  genimage-16.tar.xz
+sha256  a8756e3567a0d4d82c36b08ccc1e088250b9006d5670c6b2b014185e6ec60671  genimage-17.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index d1671f335d..2be8e1137e 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 16
+GENIMAGE_VERSION = 17
 GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
 GENIMAGE_SITE = https://github.com/pengutronix/genimage/releases/download/v$(GENIMAGE_VERSION)
 HOST_GENIMAGE_DEPENDENCIES = host-pkgconf host-libconfuse
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
