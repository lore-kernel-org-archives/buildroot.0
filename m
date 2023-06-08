Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE218C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8673683C4D;
	Thu,  8 Jun 2023 18:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8673683C4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 297EJ_rBLcZ0; Thu,  8 Jun 2023 18:59:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4BC383C79;
	Thu,  8 Jun 2023 18:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4BC383C79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F23221BF39C
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C649841FE7
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C649841FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YR_dM97_3fCh for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:59:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B06842000
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B06842000
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:59:34 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout08.t-online.de (Postfix) with SMTP id A0361BC22;
 Thu,  8 Jun 2023 20:59:32 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd83.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7Kr5-0abhgH0; Thu, 8 Jun 2023 20:59:32 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:45198)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7Kr5-0003jE-27;
 Thu, 08 Jun 2023 20:59:31 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:59:30 +0200
Message-Id: <20230608185931.3518078-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686250772-87FFE480-7947630A/0/0 CLEAN NORMAL
X-TOI-MSGID: 2e3d1f82-d840-4166-9e1c-ed20298484c6
Subject: [Buildroot] [PATCH 1/2] package/libxml2: bump version to 2.11.4
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.0.news
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.1.news
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.2.news
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.3.news
https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.4.news

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 37030bdfaa..f3650c5ec5 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.10/libxml2-2.10.4.sha256sum
-sha256  ed0c91c5845008f1936739e4eee2035531c1c94742c6541f44ee66d885948d45  libxml2-2.10.4.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.11/libxml2-2.11.4.sha256sum
+sha256  737e1d7f8ab3f139729ca13a2494fd17bf30ddb4b7a427cf336252cab57f57f7  libxml2-2.11.4.tar.xz
 # License files, locally calculated
 sha256  c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index cf26a36cc4..9f7774f719 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION_MAJOR = 2.10
+LIBXML2_VERSION_MAJOR = 2.11
 LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).4
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
