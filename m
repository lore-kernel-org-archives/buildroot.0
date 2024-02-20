Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C213C48BC4
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 21:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2F266062E;
	Tue, 20 Feb 2024 21:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8cW3e2g1ohF; Tue, 20 Feb 2024 21:10:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D24D060645
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D24D060645;
	Tue, 20 Feb 2024 21:10:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8BD51BF475
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C62BC81E21
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 21:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KnVGN-sMe6-V for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 21:10:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B4C881E1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B4C881E1A
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 21:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6DCF879B0; Tue, 20 Feb 2024 21:10:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 22:03:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ca60941b748d8d16796de22400fbe6d7e678b04
X-Git-Newrev: fb4f154dad9ddc054763abcacfde120d16ca201a
X-Patchwork-Hint: ignore
Message-Id: <20240220211035.E6DCF879B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tslib: bump version to 1.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb4f154dad9ddc054763abcacfde120d16ca201a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes from https://github.com/libts/tslib/releases :

This release includes libts version 0.10.5 and the following changes:

 *  new filter module: module crop
 *  some build and security fixes
 *  improved release procedure

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 762fbebb26..6fe35633aa 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,5 +1,5 @@
-# https://github.com/libts/tslib/releases/download/1.22/tslib-1.22.tar.xz.sha256
-sha256  aaf0aed410a268d7b51385d07fe4d9d64312038e87c447ec8a24c8db0a15617a  tslib-1.22.tar.xz
+# https://github.com/libts/tslib/releases/download/1.23/tslib-1.23.tar.xz.sha256
+sha256  9b489a54d48006201f2fe955a88c3f857535ac93b6cf8e5a16c7b166c8991dac  tslib-1.23.tar.xz
 
 # Locally computed
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 45e29808bd..e8eb3beeaf 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.22
+TSLIB_VERSION = 1.23
 TSLIB_SITE = https://github.com/libts/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
@@ -29,7 +29,8 @@ TSLIB_CONF_OPTS += \
 	--enable-skip=static \
 	--enable-lowpass=static \
 	--enable-invert=static \
-	--enable-evthres=static
+	--enable-evthres=static \
+	--enable-crop=static
 endif
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
