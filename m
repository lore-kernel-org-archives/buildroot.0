Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BFAECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 15:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C8CE812B4;
	Sun, 30 Oct 2022 15:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C8CE812B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Moy-il8pTXp; Sun, 30 Oct 2022 15:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A92F48129E;
	Sun, 30 Oct 2022 15:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A92F48129E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2942A1BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 15:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0483140352
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 15:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0483140352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1IB0CmuV8Tje for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 15:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32A2A40198
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32A2A40198
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F90487539; Sun, 30 Oct 2022 15:57:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 16:56:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d0c70370c48c3cc12baee1e572948c73e13cb4c
X-Git-Newrev: f9e51e1150f59962577358b3da5c390ca4749291
X-Patchwork-Hint: ignore
Message-Id: <20221030155749.1F90487539@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongoose: bump to version 7.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9e51e1150f59962577358b3da5c390ca4749291
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file (date and URL updated with
https://github.com/cesanta/mongoose/commit/aaf55b6da0d4687cf6aae40011d38d0485bf8b34
https://github.com/cesanta/mongoose/commit/f8c84ca6722dbc47027af309ba64eaac34c7cfe9)

https://github.com/cesanta/mongoose/releases/tag/7.8
https://github.com/cesanta/mongoose/releases/tag/7.7
https://github.com/cesanta/mongoose/releases/tag/7.6
https://github.com/cesanta/mongoose/releases/tag/7.5
https://github.com/cesanta/mongoose/releases/tag/7.4
https://github.com/cesanta/mongoose/releases/tag/7.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.hash | 4 ++--
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 809f160cf0..ffef9f446c 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8c5024a4e5b5a0c7fdae3c24ebc68e2b3ccfaba08cf25c2e76fc7f14f92fd4a5  mongoose-7.2.tar.gz
-sha256  9553d057f2ba980642f2c18d87ed38896cff1c9612d77d684a73a11fe1443b05  LICENSE
+sha256  55073dcd427ab9475731ad855e417884f4fbfb24b7d5694f6cabadbee1329f16  mongoose-7.8.tar.gz
+sha256  b41c293820074278291813af9f181918154875c94d744a90bf4eec331be28ac5  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 2c5df1d0cc..8d06ed4689 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.2
+MONGOOSE_VERSION = 7.8
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
