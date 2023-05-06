Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55727C77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 13:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9828A61110;
	Sat,  6 May 2023 13:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9828A61110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mj7bMEyM5Ldq; Sat,  6 May 2023 13:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE781607FF;
	Sat,  6 May 2023 13:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE781607FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0A1C1BF370
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 13:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C88AD607FF
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 13:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C88AD607FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hGV8-CapxNWX for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 13:47:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 032CC60758
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 032CC60758
 for <buildroot@buildroot.org>; Sat,  6 May 2023 13:47:49 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout04.t-online.de (Postfix) with SMTP id 3385A1D3CE;
 Sat,  6 May 2023 15:47:46 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvIGG-28UGxd0; Sat, 6 May 2023 15:47:44 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60428)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvIGG-0006pH-1M;
 Sat, 06 May 2023 15:47:44 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 15:47:44 +0200
Message-Id: <20230506134744.32382-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683380864-AE7FBC11-6B8F54CC/0/0 CLEAN NORMAL
X-TOI-MSGID: 3e77ff4f-b17a-4a2f-94f4-3ad2813ed200
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to 23.3.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/google/flatbuffers/blob/master/CHANGELOG.md

Follow upstream rename of license file:
https://github.com/google/flatbuffers/commit/7fb785fd898a5379944457a399176235fc80d337

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/flatbuffers/flatbuffers.hash | 4 ++--
 package/flatbuffers/flatbuffers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index 6382b86f1b..2ff56a8b76 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f97965a727d26386afaefff950badef2db3ab6af9afe23ed6d94bfb65f95f37e  flatbuffers-2.0.8.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
+sha256  8aff985da30aaab37edf8e5b02fda33ed4cbdd962699a8e2af98fdef306f4e4d  flatbuffers-23.3.3.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 487d85ee1f..58c0414533 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = 2.0.8
+FLATBUFFERS_VERSION = 23.3.3
 FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
-FLATBUFFERS_LICENSE_FILES = LICENSE.txt
+FLATBUFFERS_LICENSE_FILES = LICENSE
 FLATBUFFERS_CPE_ID_VENDOR = google
 FLATBUFFERS_INSTALL_STAGING = YES
 FLATBUFFERS_DEPENDENCIES = host-flatbuffers
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
