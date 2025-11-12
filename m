Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBE9CD3446
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 19:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83ABF82FA5;
	Wed, 12 Nov 2025 19:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYd8a-yZsu4U; Wed, 12 Nov 2025 19:28:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B049F82FAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B049F82FAE;
	Wed, 12 Nov 2025 19:28:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC1A230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A24E74006D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7C_NAtPSkLC for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 19:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7B2C40055
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7B2C40055
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:28:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5FF68460A; Wed, 12 Nov 2025 19:28:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 12 Nov 2025 20:25:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 930660890bf8b40d9bd55cd9e202e574b53d5d49
X-Git-Newrev: 631259099845212c6f0d1f4699fc4782f55a102f
X-Patchwork-Hint: ignore
Message-Id: <20251112192847.C5FF68460A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tslib: bump version to 1.24
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
Content-Type: multipart/mixed; boundary="===============3379700464904691516=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3379700464904691516==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=631259099845212c6f0d1f4699fc4782f55a102f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes from https://github.com/libts/tslib/releases :

This release includes libts version 0.10.5 and the following changes:

  * improved release procedure
  * debug fixes for 32bit systems
  * CMake and autoconf updates for newer versions
  * fixes for minor cppcheck errors
  * ts_conf test program fixes

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 6fe35633aa..79c6962d7c 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,5 +1,5 @@
-# https://github.com/libts/tslib/releases/download/1.23/tslib-1.23.tar.xz.sha256
-sha256  9b489a54d48006201f2fe955a88c3f857535ac93b6cf8e5a16c7b166c8991dac  tslib-1.23.tar.xz
+# https://github.com/libts/tslib/releases/download/1.24/tslib-1.24.tar.xz.sha256
+sha256  58d9941ffaa269c399f00d0d308184c96087f7acf69aa8e3c6645e852f993ba2  tslib-1.24.tar.xz
 
 # Locally computed
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index e8eb3beeaf..6138503f40 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.23
+TSLIB_VERSION = 1.24
 TSLIB_SITE = https://github.com/libts/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)

--===============3379700464904691516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3379700464904691516==--
