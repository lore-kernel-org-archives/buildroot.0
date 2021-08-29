Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9C7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:47:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B89D060E9B
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B89D060E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90D5F42769;
	Sat,  4 Sep 2021 18:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rn2gTgUvfOv; Sat,  4 Sep 2021 18:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7F7542702;
	Sat,  4 Sep 2021 18:47:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 115A11BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0A93402B4
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICGOyeAI-aFi for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 297E5402C5
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E617F8834D; Sat,  4 Sep 2021 18:23:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 19:24:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92207bc03f2358b28e0fd2cc3a41e40504b5d3d4
X-Git-Newrev: d7f0a9bd932b5fee8541f0fbb2c83c6da09d0575
X-Patchwork-Hint: ignore
Message-Id: <20210904182356.E617F8834D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-for-modern-cpp: bump version
 to 3.10.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d7f0a9bd932b5fee8541f0fbb2c83c6da09d0575
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file year changed to 2021.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Arnout: update license hash]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 4 ++--
 package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index eb9270b311..068868c048 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9943db11eeaa5b23e58a88fbc26c453faccef7b546e55063ad00e7caaaf76d0b  json-3.9.0.tar.gz
-sha256  50be9457e5c9faaba5e60d9c73f8eabe9e0737a2d9c3e58357d856661862c18e  LICENSE.MIT
+sha256  081ed0f9f89805c2d96335c3acfa993b39a0a5b4b4cef7edb68dd2210a13458c  json-3.10.2.tar.gz
+sha256  c983d69523377819db3c377b390d5644f5ec53bec9b7c4a0f1ed893bb743d045  LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index b644f3354c..14843380ee 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = 3.9.0
+JSON_FOR_MODERN_CPP_VERSION = 3.10.2
 JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
