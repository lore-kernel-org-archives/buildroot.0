Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBF3C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 17:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFC986111F;
	Tue, 28 Jun 2022 17:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFC986111F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dt2nhaGr26sk; Tue, 28 Jun 2022 17:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A71F561119;
	Tue, 28 Jun 2022 17:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A71F561119
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BDCE1BF263
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 17:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E487D61119
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 17:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E487D61119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jmegp60vHLbN for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 17:30:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41E056110D
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41E056110D
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 17:30:46 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout11.t-online.de (Postfix) with SMTP id D8DB3122C8
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 19:30:43 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.186.7]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o6F2x-2EmTMP0; Tue, 28 Jun 2022 19:30:43 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:57104)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o6F2x-0008Ei-Ak
 for buildroot@buildroot.org; Tue, 28 Jun 2022 19:30:43 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 19:30:43 +0200
Message-Id: <20220628173043.196917-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1656437443-0143B811-D20E24C8/0/0 CLEAN NORMAL
X-TOI-MSGID: fc65448f-70e6-475b-9c78-075aa5a4a1cd
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: bump version to 1.0.51
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/jedisct1/pure-ftpd/blob/master/ChangeLog

Updated copyright hash due to copyright year bump:
https://github.com/jedisct1/pure-ftpd/commit/cf1a9705c63ebc62735f99d4acf6dba117288abe

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pure-ftpd/pure-ftpd.hash | 4 ++--
 package/pure-ftpd/pure-ftpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index e8b779c313..4cbbfa15ad 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  6722c7fd09fe3c9ebbd572f3d097087ec7b32aacb3df8fa3400d4c07e4f377d7  pure-ftpd-1.0.50.tar.bz2
-sha256  c1be5d56c28927b05131d7384bd522af4b11c3afea45725f5ca7983c11db61ac  COPYING
+sha256  622360b86c60b563abe0e994f0a86cfe5ccfde597b29a14b0a79b6e5aa05a304  pure-ftpd-1.0.51.tar.bz2
+sha256  88c813191c1a59213c641e322cf4562618ab0116ddd7c8341c419f8863b8b0a9  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index f3cbef84b9..138b05ebb4 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.50
+PURE_FTPD_VERSION = 1.0.51
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
