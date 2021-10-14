Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D59C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:46:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D70546108B
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D70546108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A362C4058B;
	Thu, 14 Oct 2021 21:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcQcYHnG2qL9; Thu, 14 Oct 2021 21:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4A954058D;
	Thu, 14 Oct 2021 21:46:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A269A1BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1751C823F6
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ls2iqynPuc7j for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:42:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 722ED831F5
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 47D5695291; Thu, 14 Oct 2021 21:39:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:33:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4acebc8fb45558a73bef0bac878d153ae45ec47
X-Git-Newrev: 9c5f47fb360e353f4e26e46f93a02cae0362e21b
X-Patchwork-Hint: ignore
Message-Id: <20211014213947.47D5695291@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-for-modern-cpp: bump version
 to 3.10.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c5f47fb360e353f4e26e46f93a02cae0362e21b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release fixes two more bug introduced in release 3.10.0: the extended diagnostics triggered
assertions when used with update() or when inserting elements into arrays. All changes are
backward-compatible.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 2 +-
 package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index 068868c048..1a98971dbc 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  081ed0f9f89805c2d96335c3acfa993b39a0a5b4b4cef7edb68dd2210a13458c  json-3.10.2.tar.gz
+sha256  e0d7c1b120cac47fa7f14a41d10a5d390f67d423d8e97b9d6834887285d6873c  json-3.10.3.tar.gz
 sha256  c983d69523377819db3c377b390d5644f5ec53bec9b7c4a0f1ed893bb743d045  LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 14843380ee..53cf17d2c6 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = 3.10.2
+JSON_FOR_MODERN_CPP_VERSION = 3.10.3
 JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
