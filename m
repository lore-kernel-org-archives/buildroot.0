Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C474CCF9FC
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9704483FA6;
	Thu, 30 Oct 2025 08:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ju0mDMpotD5n; Thu, 30 Oct 2025 08:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA7EC83ECF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA7EC83ECF;
	Thu, 30 Oct 2025 08:23:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBFCF160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0639061382
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVXI7FxYrDvO for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 705656138F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 705656138F
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EFB587A0C; Thu, 30 Oct 2025 08:22:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:17:52 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 496ea30a6f11cbc27b14b47ad0c1c8082580762b
X-Git-Newrev: 24659ac27e3bb4a8d482bf12451707149222cd10
X-Patchwork-Hint: ignore
Message-Id: <20251030082228.6EFB587A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/python3: bump
 version to 3.13.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=24659ac27e3bb4a8d482bf12451707149222cd10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Release notes:
https://www.python.org/downloads/release/python-3139/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cccc8976a80222f48b2ba97e8ce0867b9d8f6d16)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index a7ab3856cd..d1a8f3780f 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3138/
-md5  ba3da8187b03db6f42052f8707c22564  Python-3.13.8.tar.xz
+# From https://www.python.org/downloads/release/python-3139/
+md5  516aabdf3de01eeefb6de1aacf9df810  Python-3.13.9.tar.xz
 # Locally computed
-sha256  b9910730526b298299b46b35595ced9055722df60c06ad6301f6a4e2c728a252  Python-3.13.8.tar.xz
+sha256  ed5ef34cda36cfa2f3a340f07cac7e7814f91c7f3c411f6d3562323a866c5c66  Python-3.13.9.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b501aa7859..7aad14a8ca 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
