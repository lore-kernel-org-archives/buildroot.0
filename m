Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1948C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 12:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3EB408F8;
	Sun, 20 Mar 2022 12:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RcpFgEACIA1I; Sun, 20 Mar 2022 12:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ACDC408F7;
	Sun, 20 Mar 2022 12:04:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48C8D1BF591
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 12:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35FE44050C
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 12:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJSNXehm2R9U for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 12:04:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CD76404F6
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 12:04:33 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout11.t-online.de (Postfix) with SMTP id ABC5D17792;
 Sun, 20 Mar 2022 13:04:30 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.211]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nVuIO-4BlAPJ0; Sun, 20 Mar 2022 13:04:28 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56738)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nVuIO-0004W8-Ed;
 Sun, 20 Mar 2022 13:04:28 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 13:04:28 +0100
Message-Id: <20220320120428.3294529-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647777868-00014AB5-5C1F56B4/0/0 CLEAN NORMAL
X-TOI-MSGID: ffc0341f-0582-42bc-a2a9-de8217c62449
Subject: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 14.2
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
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://www.postgresql.org/docs/release/14.2/

Updated license hash due to copyright year bump:
https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=61c8da50cb39ab41c3a7a0122d6943f72bb0798e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
