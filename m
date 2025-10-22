Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999BBCCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 19:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5536240CDC;
	Wed, 22 Oct 2025 19:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVbhEZL9ir_H; Wed, 22 Oct 2025 19:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8239440CCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8239440CCF;
	Wed, 22 Oct 2025 19:39:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E065970A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBED581569
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdR0RxKg3x4d for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 19:39:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C44CD814B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C44CD814B1
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 19:39:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B33608774D; Wed, 22 Oct 2025 19:39:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 21:38:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1ef4be70b601863949cccd4ec0d98ff19513cc3
X-Git-Newrev: 00a38ca066f26bd9fb0a595523d6d42011dac316
X-Patchwork-Hint: ignore
Message-Id: <20251022193924.B33608774D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/at-spi2-core: bump to version
 2.58.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=00a38ca066f26bd9fb0a595523d6d42011dac316
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since version 2.50.0, see:
https://gitlab.gnome.org/GNOME/at-spi2-core/-/blob/2.58.1/NEWS

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/at-spi2-core/at-spi2-core.hash | 4 ++--
 package/at-spi2-core/at-spi2-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/at-spi2-core/at-spi2-core.hash b/package/at-spi2-core/at-spi2-core.hash
index 4257ba03a7..780456dcaf 100644
--- a/package/at-spi2-core/at-spi2-core.hash
+++ b/package/at-spi2-core/at-spi2-core.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/at-spi2-core/2.50/at-spi2-core-2.50.0.sha256sum
-sha256  e9f5a8c8235c9dd963b2171de9120301129c677dde933955e1df618b949c4adc  at-spi2-core-2.50.0.tar.xz
+# From https://download.gnome.org/sources/at-spi2-core/2.58/at-spi2-core-2.58.1.sha256sum
+sha256  7f374a6a38cd70ff4b32c9d3a0310bfa804d946fed4c9e69a7d49facdcb95e9c  at-spi2-core-2.58.1.tar.xz
 
 # locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/at-spi2-core/at-spi2-core.mk b/package/at-spi2-core/at-spi2-core.mk
index 828280de1a..f6d2b5264f 100644
--- a/package/at-spi2-core/at-spi2-core.mk
+++ b/package/at-spi2-core/at-spi2-core.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AT_SPI2_CORE_VERSION_MAJOR = 2.50
-AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).0
+AT_SPI2_CORE_VERSION_MAJOR = 2.58
+AT_SPI2_CORE_VERSION = $(AT_SPI2_CORE_VERSION_MAJOR).1
 AT_SPI2_CORE_SOURCE = at-spi2-core-$(AT_SPI2_CORE_VERSION).tar.xz
 AT_SPI2_CORE_SITE = https://download.gnome.org/sources/at-spi2-core/$(AT_SPI2_CORE_VERSION_MAJOR)
 AT_SPI2_CORE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
