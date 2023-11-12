Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2201C4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 14:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 956DD41580;
	Sun, 12 Nov 2023 14:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 956DD41580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZGnY7wOcnSh; Sun, 12 Nov 2023 14:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75DD64061C;
	Sun, 12 Nov 2023 14:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75DD64061C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 429DF1BF476
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 14:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B9FA8204D
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 14:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B9FA8204D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZvSCGJgeQ4y for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 14:09:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 450BC82012
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 14:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 450BC82012
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3397087078; Sun, 12 Nov 2023 14:09:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Nov 2023 15:08:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed0be8ab1d4af5af04b204a00fc4e62d5c36aaa9
X-Git-Newrev: d4d2805c7fca53a2d079d4053c41e941d6c38c65
X-Patchwork-Hint: ignore
Message-Id: <20231112140939.3397087078@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/at-spi2-core: bump to 2.50.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4d2805c7fca53a2d079d4053c41e941d6c38c65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
 - https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.4.news
 - https://download.gnome.org/sources/at-spi2-core/2.49/at-spi2-core-2.49.1.news
 - https://download.gnome.org/sources/at-spi2-core/2.49/at-spi2-core-2.49.90.news
 - https://download.gnome.org/sources/at-spi2-core/2.49/at-spi2-core-2.49.91.news
 - https://download.gnome.org/sources/at-spi2-core/2.50/at-spi2-core-2.50.0.news

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/at-spi2-core/at-spi2-core.hash | 4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 8f856e1cac..4257ba03a7 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.48/at-spi2-core-2.48.3.sha256sum
-sha256  37316df43ca9989ce539d54cf429a768c28bb38a0b34950beadd0421827edf55  at-spi2-core-2.48.3.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.50/at-spi2-core-2.50.0.sha256sum
+sha256  e9f5a8c8235c9dd963b2171de9120301129c677dde933955e1df618b949c4adc  at-spi2-core-2.50.0.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index 0ca5bc1817..828280de1a 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.48
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).3
+AT_SPI2_CORE_VERSION_MAJOR = 2.50
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
