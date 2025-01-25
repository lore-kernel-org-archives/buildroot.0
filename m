Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA75C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 20:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6BC881277;
	Sat, 25 Jan 2025 20:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDi-5AHFctLz; Sat, 25 Jan 2025 20:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FDA68129E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FDA68129E;
	Sat, 25 Jan 2025 20:20:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 112A71183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 20:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E65F481285
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 20:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f43BNZ-dlpX6 for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 20:20:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2518281277
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2518281277
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 20:20:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C1F686463; Sat, 25 Jan 2025 20:20:50 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 21:09:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eec9e14c64c62aac45167ba07be60cbd492f8aba
X-Git-Newrev: 821ce21fcf3dd5b4ccdfa7bacc96b396a9ca55f8
X-Patchwork-Hint: ignore
Message-Id: <20250125202050.1C1F686463@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.48.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=821ce21fcf3dd5b4ccdfa7bacc96b396a9ca55f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated SQLITE_SITE.

Release notes: https://www.sqlite.org/releaselog/3_48_0.html

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 788e89f99d..5b933fba8f 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f1b2ee412c28d7472bc95ba996368d6f0cdcf00362affdadb27ed286c179540b  sqlite-autoconf-3470200.tar.gz
+sha256  ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5  sqlite-autoconf-3480000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 30505a9dbc..c8f12a427a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.47.2
-SQLITE_TAR_VERSION = 3470200
+SQLITE_VERSION = 3.48.0
+SQLITE_TAR_VERSION = 3480000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2024
+SQLITE_SITE = https://www.sqlite.org/2025
 SQLITE_LICENSE = blessing
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
