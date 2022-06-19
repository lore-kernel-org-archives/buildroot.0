Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3657C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 12:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51774410DB;
	Sun, 19 Jun 2022 12:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51774410DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmZUbpT8VJCU; Sun, 19 Jun 2022 12:48:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67D12410D1;
	Sun, 19 Jun 2022 12:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D12410D1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B99BF1BF9A4
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EE65408AE
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 12:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EE65408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2Xd3yal74DS for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 12:47:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7AA840895
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 12:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7AA840895
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B9D9187168; Sun, 19 Jun 2022 12:34:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 14:42:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccea032c75a5a7ddbdc5b7b14957b2b4683b94fc
X-Git-Newrev: 2579cc2cb32032c24b5f62946b05837a60340b3b
X-Patchwork-Hint: ignore
Message-Id: <20220619123451.B9D9187168@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: bump version to 14.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=2579cc2cb32032c24b5f62946b05837a60340b3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.postgresql.org/about/news/postgresql-144-released-2470/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 8ebe7b58fa..b2e94195e1 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v14.3/postgresql-14.3.tar.bz2.sha256
-sha256  279057368bf59a919c05ada8f95c5e04abb43e74b9a2a69c3d46a20e07a9af38  postgresql-14.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v14.4/postgresql-14.4.tar.bz2.sha256
+sha256  c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a  postgresql-14.4.tar.bz2
 
 # License file, Locally calculated
 sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 45049f669d..c893f8026c 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 14.3
+POSTGRESQL_VERSION = 14.4
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
