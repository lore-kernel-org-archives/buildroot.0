Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60607E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2971C849B4;
	Fri,  6 Sep 2024 20:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_fr2752QPBM; Fri,  6 Sep 2024 20:06:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0612E84A7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0612E84A7E;
	Fri,  6 Sep 2024 20:06:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAF011BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9A5D6066B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1gGjEqyKDLq for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D936111C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2D936111C
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFDFC86C5A; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Aug 2024 18:49:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88c3ea5a08aa7393a110ecc39a7194d8b5a64685
X-Git-Newrev: e3db27120f6e58ed96514bc925a12822e8b0a113
X-Patchwork-Hint: ignore
Message-Id: <20240906195857.CFDFC86C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mongoose: bump to version 7.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3db27120f6e58ed96514bc925a12822e8b0a113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/cesanta/mongoose/releases/tag/7.15

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 8874ba4171..6e8d1e3804 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7c4aecf92f7f27f1cbb2cbda3c185c385f2b7af84f6bd7c0ce31b84742b15691  mongoose-7.14.tar.gz
+sha256  efcb5aa89b85d40373dcff3241316ddc0f2f130ad7f05c9c964f8cc1e2078a0b  mongoose-7.15.tar.gz
 sha256  7e2bc5dabbc27b431a530540161ba860906f12109d4b84b1e4bc8879f1afc3bc  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index d2cd45451e..e3c57c8e8a 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.14
+MONGOOSE_VERSION = 7.15
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
