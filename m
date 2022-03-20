Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFCBC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 15:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 996B1607D6;
	Sun, 20 Mar 2022 15:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FC4voCRPqyje; Sun, 20 Mar 2022 15:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA04760BFF;
	Sun, 20 Mar 2022 15:39:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A43521BF973
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 15:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F6CE40158
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 15:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBUs0ZJXhlW1 for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 15:38:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AB1340569
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 15:38:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A9CA98452E; Sun, 20 Mar 2022 15:29:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 16:24:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9c448a016f07951a41e5c0938e3dbd8630a704b
X-Git-Newrev: 3e8c436902bfac25074677858853f23d40bca8c0
X-Patchwork-Hint: ignore
Message-Id: <20220320152913.A9CA98452E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: bump version to 14.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e8c436902bfac25074677858853f23d40bca8c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.postgresql.org/docs/release/14.2/

Updated license hash due to copyright year bump:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=61c8da50cb39ab41c3a7a0122d6943f72bb0798e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index c2017a1226..2ba3b07563 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v14.1/postgresql-14.1.tar.bz2.sha256
-sha256  4d3c101ea7ae38982f06bdc73758b53727fb6402ecd9382006fa5ecc7c2ca41f  postgresql-14.1.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v14.2/postgresql-14.2.tar.bz2.sha256
+sha256  2cf78b2e468912f8101d695db5340cf313c2e9f68a612fb71427524e8c9a977a  postgresql-14.2.tar.bz2
 
 # License file, Locally calculated
-sha256  31ccadc0a70e8e0e8a35c5833567b64388dfe34987d962e1911554e271294105  COPYRIGHT
+sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 32aef0c68c..c389246f80 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 14.1
+POSTGRESQL_VERSION = 14.2
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
