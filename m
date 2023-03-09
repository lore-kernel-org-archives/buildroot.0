Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661E9C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 19:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD987612D0;
	Thu,  9 Mar 2023 19:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD987612D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOaTymNJEa5F; Thu,  9 Mar 2023 19:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0946A611BE;
	Thu,  9 Mar 2023 19:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0946A611BE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0090E1BF2B4
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 19:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC8D341014
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 19:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC8D341014
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BsQZhwS4jJ1e for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 19:25:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B88C400BF
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B88C400BF
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 19:25:21 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout07.t-online.de (Postfix) with SMTP id 0819719387
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:25:18 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.179.197]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1paLt3-0yD9xx0; Thu, 9 Mar 2023 20:25:13 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59310)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1paLt3-00086o-1k
 for buildroot@buildroot.org; Thu, 09 Mar 2023 20:25:13 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  9 Mar 2023 20:25:13 +0100
Message-Id: <20230309192513.54802-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678389913-519B8A0B-3E8836B9/0/0 CLEAN NORMAL
X-TOI-MSGID: cd7b8fd1-f3ed-4772-95db-9477e5194a40
Subject: [Buildroot] [PATCH 1/1] package/apache: security bump version to
 2.4.56
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
https://lists.apache.org/thread/89vkczkfkdyz65d5q59pcyzrn5ts60s6

Changelog: https://dlcdn.apache.org/httpd/CHANGES_2.4.56

Fixes CVE-2023-25690 & CVE-2023-27522:
https://httpd.apache.org/security/vulnerabilities_24.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.hash | 6 +++---
 package/apache/apache.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index a1185c5618..36144917fb 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/httpd/httpd-2.4.54.tar.bz2.{sha256,sha512}
-sha256  11d6ba19e36c0b93ca62e47e6ffc2d2f2884942694bce0f23f39c71bdc5f69ac  httpd-2.4.55.tar.bz2
-sha512  94982f7a1fedac8961fc17b5a22cf763ac28cb27ee6facab2e6a15b249b927773667493fd3f7354fb13fcb34a6f1afc1bdd5cf4b7be030cba1dfb523e40d43fb  httpd-2.4.55.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.56.tar.bz2.{sha256,sha512}
+sha256  d8d45f1398ba84edd05bb33ca7593ac2989b17cb9c7a0cafe5442d41afdb2d7c  httpd-2.4.56.tar.bz2
+sha512  5f12cd9878d822384b1bb163fea4d8edee5e7a0dd8b2389264387971268145cccc6a5a27ddf0436c5f1f631acc5fdc4874da2a47911483e421ca40bf783e0e12  httpd-2.4.56.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 13018a9b1f..80205a6362 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.55
+APACHE_VERSION = 2.4.56
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
 APACHE_SITE = https://downloads.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
