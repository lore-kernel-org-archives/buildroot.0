Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D23FC54E5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 18:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63C7E40849;
	Thu, 14 Mar 2024 18:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9asQ6bEJPzp; Thu, 14 Mar 2024 18:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27B3A4099B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27B3A4099B;
	Thu, 14 Mar 2024 18:49:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1A6A1BF990
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C77C4029B
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qA3pIWN6-9QV for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 18:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2680401F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2680401F6
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 18:49:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC3A88833A; Thu, 14 Mar 2024 18:49:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 19:36:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 387bf13c6292837c6847d9c0f79a7872f0f2176e
X-Git-Newrev: 50c7bf3b22fd609000150938df6e9b35fa8cc549
X-Patchwork-Hint: ignore
Message-Id: <20240314184919.AC3A88833A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.45.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=50c7bf3b22fd609000150938df6e9b35fa8cc549
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://sqlite.org/releaselog/3_45_1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 38cff902d7..e7b5d2b224 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c6719a148bc41cf0f2bbbe3926d7ce3f5ca09d878f1246fcc20767b175bb407  sqlite-autoconf-3440200.tar.gz
+sha256  cd9c27841b7a5932c9897651e20b86c701dd740556989b01ca596fcfa3d49a0a  sqlite-autoconf-3450100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b54bd9580c..040d405b8a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.44.2
-SQLITE_TAR_VERSION = 3440200
+SQLITE_VERSION = 3.45.1
+SQLITE_TAR_VERSION = 3450100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2023
+SQLITE_SITE = https://www.sqlite.org/2024
 SQLITE_LICENSE = blessing
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
