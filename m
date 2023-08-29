Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7778C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 13:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6161A82061;
	Tue, 29 Aug 2023 13:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6161A82061
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1TTjXgLPfS8; Tue, 29 Aug 2023 13:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 118C382072;
	Tue, 29 Aug 2023 13:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 118C382072
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92F351BF46A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 071BE60067
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 071BE60067
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdHBAC0zgBFz for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 13:01:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6306660FCB
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6306660FCB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5108586428; Tue, 29 Aug 2023 13:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 14:41:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e79533c751188383a2d08220841aabf02286cc60
X-Git-Newrev: 4f4dd0d62fadc97b06e35aed2e947e387a6d6f6c
X-Patchwork-Hint: ignore
Message-Id: <20230829130112.5108586428@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sqlite: bump version
 to 3.43.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f4dd0d62fadc97b06e35aed2e947e387a6d6f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://sqlite.org/releaselog/3_43_0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 39758f2b43..1a7f47edcd 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49da4e1eca5d088ca6  sqlite-autoconf-3420000.tar.gz
+sha256  49008dbf3afc04d4edc8ecfc34e4ead196973034293c997adad2f63f01762ae1  sqlite-autoconf-3430000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 1576d6a3e1..5e676d5387 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.42.0
-SQLITE_TAR_VERSION = 3420000
+SQLITE_VERSION = 3.43.0
+SQLITE_TAR_VERSION = 3430000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2023
 SQLITE_LICENSE = Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
