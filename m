Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105FBC4167D
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 21:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B9B41B42;
	Mon, 13 Nov 2023 21:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0B9B41B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Aw2cS8IK9OU; Mon, 13 Nov 2023 21:49:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E089B41BC1;
	Mon, 13 Nov 2023 21:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E089B41BC1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52A431BF389
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B86D401CA
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B86D401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdt4nnHccx77 for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 21:49:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1672E4018F
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 21:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1672E4018F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E814C870F5; Mon, 13 Nov 2023 21:49:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 22:43:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29fb06a3fb0b043e7850575b67789fef3424f235
X-Git-Newrev: 15bfec42c26ca0663d3fe9a86b833dabe88c0553
X-Patchwork-Hint: ignore
Message-Id: <20231113214925.E814C870F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongoose: bump to version 7.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=15bfec42c26ca0663d3fe9a86b833dabe88c0553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file (date updated with
https://github.com/cesanta/mongoose/commit/d7eb3db60bdbf42ebce0cd03924f815ed0c490e6)

https://github.com/cesanta/mongoose/releases/tag/7.12
https://github.com/cesanta/mongoose/releases/tag/7.11
https://github.com/cesanta/mongoose/releases/tag/7.10
https://github.com/cesanta/mongoose/releases/tag/7.9

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/mongoose.hash | 4 ++--
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index ffef9f446c..ed5db5ebf6 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  55073dcd427ab9475731ad855e417884f4fbfb24b7d5694f6cabadbee1329f16  mongoose-7.8.tar.gz
-sha256  b41c293820074278291813af9f181918154875c94d744a90bf4eec331be28ac5  LICENSE
+sha256  91e719e164816b349be3cb71293927f3f6abbe3fb02187e2d9b5e56f542c2063  mongoose-7.12.tar.gz
+sha256  4ba646f5a7012d8b52f3a74398e446f56960dde0572f7241a2215430da5dd5a2  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 0693f7553a..74594ff48c 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.8
+MONGOOSE_VERSION = 7.12
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
