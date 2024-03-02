Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37147C54E41
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 20:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9A0941800;
	Tue,  5 Mar 2024 20:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QrdT6LAPSqFJ; Tue,  5 Mar 2024 20:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 716B641808
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 716B641808;
	Tue,  5 Mar 2024 20:44:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86B2B1BF3FD
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 20:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA3260F3D
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 20:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zeXC2QP_X5dM for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 20:44:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B805A6059D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B805A6059D
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 20:44:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9ACCA8811E; Tue,  5 Mar 2024 20:44:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 21:36:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c73f6ed3e04eefdc6c224ad1bbd3730400e1e11
X-Git-Newrev: 814f9f17d5c345f4c20ed3cca4873f7411db96d5
X-Patchwork-Hint: ignore
Message-Id: <20240305204439.9ACCA8811E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quickjs: bump to version 2024-01-13
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

commit: https://git.buildroot.net/buildroot/commit/?id=814f9f17d5c345f4c20ed3cca4873f7411db96d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quickjs/quickjs.hash | 2 +-
 package/quickjs/quickjs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/quickjs.hash b/package/quickjs/quickjs.hash
index 916fb6e3a2..30613b982a 100644
--- a/package/quickjs/quickjs.hash
+++ b/package/quickjs/quickjs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e8afe386f875d0e52310ea91aa48e2b0e04182e821f19147794e3e272f4c8d8c  quickjs-2023-12-09.tar.xz
+sha256  3c4bf8f895bfa54beb486c8d1218112771ecfc5ac3be1036851ef41568212e03  quickjs-2024-01-13.tar.xz
 sha256  f41baf09eef895d468d18c23055d74f711e4b8b2641cef279b5d71285c07bfe8  LICENSE
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 186397f9aa..e745923b87 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUICKJS_VERSION = 2023-12-09
+QUICKJS_VERSION = 2024-01-13
 QUICKJS_SOURCE = quickjs-$(QUICKJS_VERSION).tar.xz
 QUICKJS_SITE = https://bellard.org/quickjs
 QUICKJS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
