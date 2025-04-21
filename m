Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD47C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3767140487;
	Mon, 21 Apr 2025 21:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhTb0oASLju8; Mon, 21 Apr 2025 21:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D06E403F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D06E403F7;
	Mon, 21 Apr 2025 21:22:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F6AC1BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C89A403DA
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyMnogyCM2qe for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E90A94034D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E90A94034D
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:21:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEBD085FEF; Mon, 21 Apr 2025 21:21:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 19:07:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d0fbaf1134ccbb89393e496c9281cb829aaeee1
X-Git-Newrev: 58d616e6875102194fbf8cfcc8c2b4e0faf78935
X-Patchwork-Hint: ignore
Message-Id: <20250421212157.CEBD085FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ivi-homescreen: bump to version
 a038ce00031ed5a9a89b4d8dd7dbde5e3d7ade6e
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=58d616e6875102194fbf8cfcc8c2b4e0faf78935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ivi-homescreen/ivi-homescreen.hash | 2 +-
 package/ivi-homescreen/ivi-homescreen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ivi-homescreen/ivi-homescreen.hash b/package/ivi-homescreen/ivi-homescreen.hash
index 60b9281abc..484ecfb128 100644
--- a/package/ivi-homescreen/ivi-homescreen.hash
+++ b/package/ivi-homescreen/ivi-homescreen.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  733a95a9b50875e8b45b0b69118656edba3ba88ecc65e3c0d76ea5df9761c433  ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a-git4.tar.gz
+sha256  aba31437dd90eca1fc5723619c269394e475b3000309eda86efcfd252452a85e  ivi-homescreen-a038ce00031ed5a9a89b4d8dd7dbde5e3d7ade6e-git4.tar.gz
 
 # Apache-2.0
 sha256  6b96fa0a3def85caaf466caa2bd82d4ca4f22d106ff88f97a00c537c00cc714b  LICENSE
diff --git a/package/ivi-homescreen/ivi-homescreen.mk b/package/ivi-homescreen/ivi-homescreen.mk
index 4293b2bc35..525fb4e11b 100644
--- a/package/ivi-homescreen/ivi-homescreen.mk
+++ b/package/ivi-homescreen/ivi-homescreen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IVI_HOMESCREEN_VERSION = 5ab78a19e95c88cc5d6b173ab1260a211e78cf0a
+IVI_HOMESCREEN_VERSION = a038ce00031ed5a9a89b4d8dd7dbde5e3d7ade6e
 IVI_HOMESCREEN_SITE = https://github.com/toyota-connected/ivi-homescreen.git
 IVI_HOMESCREEN_SITE_METHOD = git
 IVI_HOMESCREEN_LICENSE = Apache-2.0, BSD-3-Clause, BSD-Style, BSL-1.0, MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
