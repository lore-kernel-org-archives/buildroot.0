Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41A7C43334
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 07:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52A2F83F7C;
	Sun, 10 Jul 2022 07:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52A2F83F7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Inyusv2UGqdo; Sun, 10 Jul 2022 07:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE8583F69;
	Sun, 10 Jul 2022 07:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BE8583F69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0099A1BF372
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 07:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC8B860B6E
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 07:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC8B860B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TNYP8uvSA5dc for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 07:14:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B207760B43
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B207760B43
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 07:14:49 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout04.t-online.de (Postfix) with SMTP id 80BC62203
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 09:14:26 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.11.100]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oAR8y-3MsIID0; Sun, 10 Jul 2022 09:14:16 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60498)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oAR8y-00072u-AE
 for buildroot@buildroot.org; Sun, 10 Jul 2022 09:14:16 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 09:14:16 +0200
Message-Id: <20220710071416.255882-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1657437256-01421A9A-A61105A6/0/0 CLEAN NORMAL
X-TOI-MSGID: ca11b26e-950d-4d55-a396-2b1339cd2560
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.112
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
https://lists.freedesktop.org/archives/dri-devel/2022-July/362994.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 48b60f66cd..082a158074 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2022-June/357686.html
-sha256  1ad7164f77424de6f4ecba7c262bde196a214c6e19a6fbf497f0815f4d7ab2a9  libdrm-2.4.111.tar.xz
-sha512  17e92e9e4ded8031ac222764bed7e9ff430a1a377f5e435f6b62b4a7f45cb4c4b769b3b79fbcba11512c1ac973abf8cdcca8e0b9659ae095e915d3d5efcf5516  libdrm-2.4.111.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2022-July/362994.html
+sha256  00b07710bd09b35cd8d80eaf4f4497fe27f4becf467a9830f1f5e8324f8420ff  libdrm-2.4.112.tar.xz
+sha512  df8a207d9cce220ee2cf67877eda65394733fbfd0ff85fdbadb2b20ba9bacc41421b32452506c8caecddaf8361564ca68cd6c74d4faf3b1569ab30a3243e4340  libdrm-2.4.112.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 5cfd2d56eb..79d9416ef0 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.111
+LIBDRM_VERSION = 2.4.112
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
