Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA716C77B60
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 13:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45EE1429F2;
	Fri, 28 Apr 2023 13:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45EE1429F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pS9kF8hnMOtI; Fri, 28 Apr 2023 13:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B74C429EB;
	Fri, 28 Apr 2023 13:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B74C429EB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C72E31BF580
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 13:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE9BC429EB
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 13:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE9BC429EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1nv1KWwmSY1 for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 13:11:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A06940471
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A06940471
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 13:11:19 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout04.t-online.de (Postfix) with SMTP id 061DE15C83
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 15:11:17 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.3.195]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1psNsZ-0pruyH0; Fri, 28 Apr 2023 15:11:15 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:46696)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1psNsZ-0001I4-1X
 for buildroot@buildroot.org; Fri, 28 Apr 2023 15:11:15 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 15:11:15 +0200
Message-Id: <20230428131115.455670-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682687475-AEFFAC11-B2E746A4/0/0 CLEAN NORMAL
X-TOI-MSGID: 96d26861-2978-4c82-a16d-6c431fab7f8f
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.57
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

Release notes:
https://lists.apache.org/thread/lp9t6w2t0qsbbo14lylk2yvfj8hgfoh9

Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.57
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 36144917fb..1f0020f65a 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.56.tar.bz2.{sha256,sha512}
-sha256  d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c  httpd-2.4.56.tar.bz2
-sha512  5f12cd9878d822384b1bb163fea4d8edee5e7a0dd8b2389264387971268145cccc6a5a27ddf0436c5f1f631acc5fdc4874da2a47911483e421ca40bf783e0e12  httpd-2.4.56.tar.bz2
+# From https://archive.apache.org/dist/httpd/httpd-2.4.57.tar.bz2.{sha256,sha512}
+sha256  dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a  httpd-2.4.57.tar.bz2
+sha512  4d1e0a274ee90bdfb5f38d4a7d73a7367ed1c6388e26280e640014e49abc0df03683705b88dcfe2ec2da313dda4c7b4a3b86daffa1911f58e224eba89d82d155  httpd-2.4.57.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 80205a6362..320a6ad20e 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.56
+APACHE_VERSION = 2.4.57
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
