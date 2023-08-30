Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A683C83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14E854181D;
	Wed, 30 Aug 2023 21:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14E854181D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r77fJY5QnEPx; Wed, 30 Aug 2023 21:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FBF44181F;
	Wed, 30 Aug 2023 21:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FBF44181F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE2D1BF980
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58DF541C55
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58DF541C55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMJr13duwza7 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:54:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5466141C14
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5466141C14
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C5218669A; Wed, 30 Aug 2023 21:54:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 23:48:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 060b88ace6772ceb016a1ebe45d415f10c194c6c
X-Git-Newrev: 93556f95a3a8ce402eb29e8f5c73f0c02a708f54
X-Patchwork-Hint: ignore
Message-Id: <20230830215441.3C5218669A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdbus-cpp: bump to
 version 1.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=93556f95a3a8ce402eb29e8f5c73f0c02a708f54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.3.0

A trailing whitespace was removed in the COPYING-LGPL-Exception file,
so the hash differs.
https://github.com/Kistler-Group/sdbus-cpp/commit/dcd9d46b9c5e5011dc7170e9d081bcf80096fd15

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdbus-cpp/sdbus-cpp.hash | 4 ++--
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index 169fad2807..f5fc8d6868 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  7f7231904abb6a996b8c18ddc5fb50078ef5dff5191649abf9f127aff41d24e9  v1.2.0.tar.gz
+sha256  d44f59abdd64d8f1ca3af7db58bc6518cb081fc9ff16285c3d75a68f5c073d10  v1.3.0.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
-sha256  be43debbf06a38325616054a39e44ed5afde4ed21b99de197488a4a306d47e39  COPYING-LGPL-Exception
+sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 0e8d74cfcd..52e5c50cd2 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 1.2.0
+SDBUS_CPP_VERSION = 1.3.0
 SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
