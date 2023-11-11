Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E21FC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 18:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB53341F00;
	Sat, 11 Nov 2023 18:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB53341F00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GIGBfkNjtWt; Sat, 11 Nov 2023 18:57:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A631E41F40;
	Sat, 11 Nov 2023 18:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A631E41F40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BC7E1BF36A
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 18:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D273610CA
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 18:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D273610CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PmX_d1PSGyZ for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 18:57:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C66CD610C8
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 18:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C66CD610C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABDCB87029; Sat, 11 Nov 2023 18:57:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 19:56:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72c3f87efacbf593abebe798321f9ecda7adc2d3
X-Git-Newrev: 8ed9e2b0550d3e16e15462508c0b5d3de304fcac
X-Patchwork-Hint: ignore
Message-Id: <20231111185720.ABDCB87029@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: bump to 1.4.73
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ed9e2b0550d3e16e15462508c0b5d3de304fcac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
 - https://www.lighttpd.net/2023/10/30/1.4.73/

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 3c114c05a1..5907558ada 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.72.sha512sum
-sha512  5becb57915e3548a1b9b980014be22b3c08dcf0e9be524f9cd0093886aaf6d00b20986e8b1fb10ecdbdffd8e42dd18e4a227b03d562c91bef9490ea6d5c480e3  lighttpd-1.4.72.tar.xz
-# From https://www.lighttpd.net/2023/10/6/1.4.72/
-sha256  f7cade4d69b754a0748c01463c33cd8b456ca9cc03bb09e85a71bcbcd54e55ec  lighttpd-1.4.72.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.73.sha512sum
+sha512  ee41a72b09614d630174ef832b08c050708f62c0b6299e82b0a5f91a63d62702d31237ae5bb1850f0160b94e36a66af38a2d7abdaa920235265d416d2b0b4015  lighttpd-1.4.73.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.73.sha256sum
+sha256  818816d0b314b0aa8728a7076513435f6d5eb227f3b61323468e1f10dbe84ca8  lighttpd-1.4.73.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index af104de078..91877f8aae 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).72
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).73
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
