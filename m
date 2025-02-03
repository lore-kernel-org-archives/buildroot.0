Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412BEC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E6670A66;
	Fri, 28 Feb 2025 17:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwd3vX4H9o5c; Fri, 28 Feb 2025 17:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F65370A65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F65370A65;
	Fri, 28 Feb 2025 17:09:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 152FB1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D253402B2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqGzRpwfSX5L for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BDEE42F38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BDEE42F38
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 938D185E25; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 23:11:27 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 33fbe2bbdc94a03d4ce3ee0e1a7df75d1e083439
X-Git-Newrev: 920f45bd244166c8401dd05e054fc894eba143bf
X-Patchwork-Hint: ignore
Message-Id: <20250228163027.938D185E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcdio: bump version
 to 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=920f45bd244166c8401dd05e054fc894eba143bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/libcdio/libcdio/releases/tag/2.1.1
https://github.com/libcdio/libcdio/releases/tag/2.2.0

Switched _SITE to github:
https://lists.gnu.org/archive/html/libcdio-devel/2025-01/msg00005.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcdio/libcdio.hash | 2 +-
 package/libcdio/libcdio.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index 1b157992b2..52d923a3d0 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-sha256  8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b  libcdio-2.1.0.tar.bz2
+sha256  6f8fbdf4d189cf63f2a7a1549c516cd720c7b222c7aaadbc924a26e745a48539  libcdio-2.2.0.tar.bz2
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index df26d9a7ac..b84ae27759 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 2.1.0
+LIBCDIO_VERSION = 2.2.0
 LIBCDIO_SOURCE = libcdio-$(LIBCDIO_VERSION).tar.bz2
-LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
+LIBCDIO_SITE = https://github.com/libcdio/libcdio/releases/download/$(LIBCDIO_VERSION)
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPL-3.0+
 LIBCDIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
