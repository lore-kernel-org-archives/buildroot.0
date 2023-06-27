Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE6CEB64D9
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 05:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8EC34168E;
	Tue, 27 Jun 2023 05:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8EC34168E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KcPuntG4eaZl; Tue, 27 Jun 2023 05:44:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 042DF416E7;
	Tue, 27 Jun 2023 05:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 042DF416E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20BFD1BF313
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 05:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDC8E409A4
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 05:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDC8E409A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q5wADGBX1XEg for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 05:43:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1761409AD
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 05:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1761409AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEB43856A9; Tue, 27 Jun 2023 05:43:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 07:40:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 199301a6d59af20f6a7bb6da0d22bffb64baaea4
X-Git-Newrev: de6c233a4e79b6e6e7d889740a0ded57c1fb7e39
X-Patchwork-Hint: ignore
Message-Id: <20230627054356.BEB43856A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.42.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=de6c233a4e79b6e6e7d889740a0ded57c1fb7e39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://sqlite.org/releaselog/3_42_0.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index a7b56cf25d..39758f2b43 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e98c100dd1da4e30fa460761dab7c0b91a50b785e167f8c57acc46514fae9499  sqlite-autoconf-3410200.tar.gz
+sha256  7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49da4e1eca5d088ca6  sqlite-autoconf-3420000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 6c01426658..1576d6a3e1 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.41.2
-SQLITE_TAR_VERSION = 3410200
+SQLITE_VERSION = 3.42.0
+SQLITE_TAR_VERSION = 3420000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2023
 SQLITE_LICENSE = Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
