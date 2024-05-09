Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD54C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 16:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D5DB41E1C;
	Thu,  9 May 2024 16:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BJzRJYacZCO; Thu,  9 May 2024 16:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1352D41E58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1352D41E58;
	Thu,  9 May 2024 16:20:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 443A81BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F83E83E74
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 16:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8IW2TCHebLe for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 16:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C6D2820A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C6D2820A6
 for <buildroot@buildroot.org>; Thu,  9 May 2024 16:20:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C4F786C82; Thu,  9 May 2024 16:20:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 18:20:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 571eceed7aac268d8ce2bbf2c6993b4a4e4a2b5d
X-Git-Newrev: b903aec04f02aca6504140359be9993529a83a49
X-Patchwork-Hint: ignore
Message-Id: <20240509162051.5C4F786C82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: bump to 1.4.76
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

commit: https://git.buildroot.net/buildroot/commit/?id=b903aec04f02aca6504140359be9993529a83a49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
 - https://www.lighttpd.net/2024/2/19/1.4.74
 - https://www.lighttpd.net/2024/3/13/1.4.75
 - https://www.lighttpd.net/2024/4/12/1.4.76

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 5907558ada..c5545150b0 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.73.sha512sum
-sha512  ee41a72b09614d630174ef832b08c050708f62c0b6299e82b0a5f91a63d62702d31237ae5bb1850f0160b94e36a66af38a2d7abdaa920235265d416d2b0b4015  lighttpd-1.4.73.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.73.sha256sum
-sha256  818816d0b314b0aa8728a7076513435f6d5eb227f3b61323468e1f10dbe84ca8  lighttpd-1.4.73.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.76.sha512sum
+sha512  940f00f2d84e3424c389108d09756a0af41db3559474135b6c502deccd08ad051b5184f3f7907436384964d2b05045e27dca463af98c889cee69b0ae6e202782  lighttpd-1.4.76.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.76.sha256sum
+sha256  8cbf4296e373cfd0cedfe9d978760b5b05c58fdc4048b4e2bcaf0a61ac8f5011  lighttpd-1.4.76.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index be8eda6b8d..b54f5dd213 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).73
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).76
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
