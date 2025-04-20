Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E982CC369D2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 16:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 992EC607A5;
	Sun, 20 Apr 2025 16:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lb8utw6qc_V4; Sun, 20 Apr 2025 16:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4028607E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4028607E8;
	Sun, 20 Apr 2025 16:04:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B20AB230
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A451A811B8
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHODXhHN_yKo for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 16:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81C6E811BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81C6E811BB
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:04:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A7B085DF2; Sun, 20 Apr 2025 16:04:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Apr 2025 17:43:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f438ae3422b0b860ef96cb213c71fe7508777b25
X-Git-Newrev: a4f0d6ed0c979dec52a93dd8b895a92af7fdc709
X-Patchwork-Hint: ignore
Message-Id: <20250420160435.7A7B085DF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: bump to 1.4.79
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a4f0d6ed0c979dec52a93dd8b895a92af7fdc709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
- https://www.lighttpd.net/2025/4/4/1.4.79/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 4834e2e947..4adbd08648 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.78.sha512sum
-sha512  40559e676da38b7b4742d7140ab1afe6b69a10ececc5ab1e18c1ea0e4b1c3f13f8058e8e005cbad3df8c008b6b80511afbd0bde9c8094848f3db4d5a29961181  lighttpd-1.4.78.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.78.sha256sum
-sha256  3c0739e8bc75c9e9fc1cfa89e1c304dd4b0e4abb87adc646a1d20bc6a2db2a3e  lighttpd-1.4.78.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha512sum
+sha512  e0f1bb2cfca5e81001ea30d13f088425dfc7acbec924ecddf438eb6326ab3158a61c6c4aaee0b68a90666d1cb987ce94b1f6a48afd92485cc995db5b58265f83  lighttpd-1.4.79.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.79.sha256sum
+sha256  3b29a625b3ad88702d1fea4f5f42bb7d87488f2e4efc977d7f185329ca6084bd  lighttpd-1.4.79.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 5f38637857..5337042340 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).78
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).79
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
