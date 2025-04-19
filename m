Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B743C369CB
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F36D81362;
	Sat, 19 Apr 2025 14:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBhHsJA6SdXd; Sat, 19 Apr 2025 14:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C3CE8144A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C3CE8144A;
	Sat, 19 Apr 2025 14:31:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56768230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A81FC400EA
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdnoDDhqWV3E for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:31:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12349405F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12349405F9
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:31:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 029F8851A6; Sat, 19 Apr 2025 14:31:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:12:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c298c0971b154c4489cad2c511df1b89ecb6e663
X-Git-Newrev: 0ba6de8a0c9763b8f37490ebccd539e024859f90
X-Patchwork-Hint: ignore
Message-Id: <20250419143108.029F8851A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-for-modern-cpp: bump to
 version 3.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ba6de8a0c9763b8f37490ebccd539e024859f90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Release Notes: https://github.com/nlohmann/json/releases/tag/v3.12.0
- updated LICENSE.MIT hash due to updated year

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 4 ++--
 package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index 1f0e5efdb8..d3c8f2501e 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0d8ef5af7f9794e3263480193c491549b2ba6cc74bb018906202ada498a79406  json-3.11.3.tar.gz
-sha256  86b998c792894ccb911a1cb7994f7a9652894e7a094c0b5e45be2f553f45cf14  LICENSE.MIT
+sha256  4b92eb0c06d10683f7447ce9406cb97cd4b453be18d7279320f7b2f025c10187  json-3.12.0.tar.gz
+sha256  46a65cffd1ea955132d95a8dd921640714a8d6b537d2e4e482d31145ae95b603  LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 345280b346..7935e1bad3 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = 3.11.3
+JSON_FOR_MODERN_CPP_VERSION = 3.12.0
 JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
