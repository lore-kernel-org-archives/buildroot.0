Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D7DC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 21:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE8AC60C1F;
	Mon, 12 Dec 2022 21:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE8AC60C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHOCO4vSgLmL; Mon, 12 Dec 2022 21:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9B6F605B5;
	Mon, 12 Dec 2022 21:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9B6F605B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94CC91BF30A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 21:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E181605B5
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 21:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E181605B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKYQsgatlBjI for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 21:04:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84989605A5
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84989605A5
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 21:04:54 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout04.t-online.de (Postfix) with SMTP id 06C16DDF3
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 22:04:52 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4pye-1DlFR30; Mon, 12 Dec 2022 22:04:44 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56502)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4pyd-00049m-35
 for buildroot@buildroot.org; Mon, 12 Dec 2022 22:04:44 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 22:04:43 +0100
Message-Id: <20221212210443.2017076-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670879084-79BAA9DD-70AEA793/0/0 CLEAN NORMAL
X-TOI-MSGID: c6f3ed30-9dd8-40f0-b0b2-f7abfbc5118c
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.40.0
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

Release notes: https://sqlite.org/releaselog/3_40_0.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 936f42e8e9..ea4e30a463 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f31d445b48e67e284cf206717cc170ab63cbe4fd7f79a82793b772285e78fdbb  sqlite-autoconf-3390400.tar.gz
+sha256  0333552076d2700c75352256e91c78bf5cd62491589ba0c69aed0a81868980e7  sqlite-autoconf-3400000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 4f4164c374..9d0b60ab59 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.39.4
-SQLITE_TAR_VERSION = 3390400
+SQLITE_VERSION = 3.40.0
+SQLITE_TAR_VERSION = 3400000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2022
 SQLITE_LICENSE = Public domain
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
