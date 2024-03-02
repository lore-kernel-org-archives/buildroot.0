Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EEAC54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 17:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4770400D1;
	Sat,  2 Mar 2024 17:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCIygurLTwIA; Sat,  2 Mar 2024 17:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A595B403C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A595B403C4;
	Sat,  2 Mar 2024 17:01:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A181B1BF2F1
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 17:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CAFE41762
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 17:01:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qo-ewbyNKGRF for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 17:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1B1B41526
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1B1B41526
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 17:01:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9F8587E2B; Sat,  2 Mar 2024 17:01:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 17:56:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7a9ba7a71e49f11e2c8d28a578ddef3a1ad96064
X-Git-Newrev: 3c73f6ed3e04eefdc6c224ad1bbd3730400e1e11
X-Patchwork-Hint: ignore
Message-Id: <20240302170132.D9F8587E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mongoose: bump to
 version 7.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c73f6ed3e04eefdc6c224ad1bbd3730400e1e11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/cesanta/mongoose/releases/tag/7.13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index ed5db5ebf6..716833eeed 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  91e719e164816b349be3cb71293927f3f6abbe3fb02187e2d9b5e56f542c2063  mongoose-7.12.tar.gz
+sha256  5c9dc8d1d1762ef483b6d2fbf5234e421ca944b722225bb533d2d0507b118a0f  mongoose-7.13.tar.gz
 sha256  4ba646f5a7012d8b52f3a74398e446f56960dde0572f7241a2215430da5dd5a2  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 74594ff48c..e2e3be790a 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.12
+MONGOOSE_VERSION = 7.13
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
