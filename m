Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331E1C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA90560888;
	Mon, 29 Jul 2024 18:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoYfJUdz0SVS; Mon, 29 Jul 2024 18:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2585F60826
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2585F60826;
	Mon, 29 Jul 2024 18:25:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 779FF1BF42C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7294380B14
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkOGPp2Ah3-7 for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 18:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8AEF80AE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8AEF80AE0
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 18:25:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9DF1183487; Mon, 29 Jul 2024 18:25:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 20:21:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 956c5224ab85f6bc5086a2d1270181be7743113c
X-Git-Newrev: ee72631572ead69685e9a84f7fdd3d99d63b1514
X-Patchwork-Hint: ignore
Message-Id: <20240729182520.9DF1183487@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rapidjson: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee72631572ead69685e9a84f7fdd3d99d63b1514
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Last release dates back to 2016, project is active so bump to current
HEAD. Upstream issue to tag a new release is open:
https://github.com/Tencent/rapidjson/issues/2284

Updated _SITE due to upstream move in 2017:
https://github.com/Tencent/rapidjson/commit/4a2f2729f1313a7150d1275185f4888224a48753

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rapidjson/rapidjson.hash | 2 +-
 package/rapidjson/rapidjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rapidjson/rapidjson.hash b/package/rapidjson/rapidjson.hash
index 3c16abee60..ca5befdefc 100644
--- a/package/rapidjson/rapidjson.hash
+++ b/package/rapidjson/rapidjson.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e  rapidjson-1.1.0.tar.gz
+sha256  39f96f17b40f7201042c9b45d6444cb7eae1b7adfb7455412a86f6140450d32d  rapidjson-ab1842a2dae061284c0a62dca1cc6d5e7e37e346.tar.gz
 sha256  a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  license.txt
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index d3bcef7df1..3091edeab9 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RAPIDJSON_VERSION = 1.1.0
-RAPIDJSON_SITE = $(call github,miloyip,rapidjson,v$(RAPIDJSON_VERSION))
+RAPIDJSON_VERSION = ab1842a2dae061284c0a62dca1cc6d5e7e37e346
+RAPIDJSON_SITE = $(call github,Tencent,rapidjson,$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
 RAPIDJSON_CPE_ID_VENDOR = tencent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
