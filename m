Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A3AC43334
	for <buildroot@archiver.kernel.org>; Thu, 16 Jun 2022 17:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29AFB404CD;
	Thu, 16 Jun 2022 17:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLYHKpKkY3Iu; Thu, 16 Jun 2022 17:55:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43E1B400E3;
	Thu, 16 Jun 2022 17:55:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDA111BF425
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 17:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC463400E3
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 17:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id deYpUNEp_WTr for <buildroot@lists.busybox.net>;
 Thu, 16 Jun 2022 17:55:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAB86400B9
 for <buildroot@buildroot.org>; Thu, 16 Jun 2022 17:55:53 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout01.t-online.de (Postfix) with SMTP id EDF774D02;
 Thu, 16 Jun 2022 19:55:49 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.197.87]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o1tif-4B5MyP0; Thu, 16 Jun 2022 19:55:49 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:43836)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o1tif-0003Z4-9s;
 Thu, 16 Jun 2022 19:55:49 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 16 Jun 2022 19:55:49 +0200
Message-Id: <20220616175549.64686-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1655402149-01434903-18A00333/0/0 CLEAN NORMAL
X-TOI-MSGID: 34604806-6ed4-4d3a-b64b-4deaa67b6167
Subject: [Buildroot] [PATCH 1/1] package/postgresql: bump version to 14.4
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

Release notes:
https://www.postgresql.org/about/news/postgresql-144-released-2470/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
