Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61383C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 11:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFA6460B9E;
	Sun, 13 Nov 2022 11:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA6460B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHC0Ievge_0x; Sun, 13 Nov 2022 11:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E342960ADE;
	Sun, 13 Nov 2022 11:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E342960ADE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB6C61BF42E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 11:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFEFF4091F
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 11:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFEFF4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NvOAWHPmK9bi for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 11:42:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1330D408D9
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1330D408D9
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 11:42:28 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout06.t-online.de (Postfix) with SMTP id CB7A27DA9;
 Sun, 13 Nov 2022 12:42:25 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.168]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ouBNX-0j0FGL0; Sun, 13 Nov 2022 12:42:24 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:58874)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ouBNX-0007Fg-1t;
 Sun, 13 Nov 2022 12:42:23 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 12:42:21 +0100
Message-Id: <20221113114223.4016247-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1668339744-88EA281F-321DC014/0/0 CLEAN NORMAL
X-TOI-MSGID: c8e03dd9-162b-48ed-9edb-a993fb0fbcf8
Subject: [Buildroot] [PATCH/next 1/3] package/libdrm: bump version to 2.4.114
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2022-November/003250.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 6 +++---
 package/libdrm/libdrm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index a47e169bed..387beadc3f 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2022-August/369983.html
-sha256  7fd7eb2967f63beb4606f22d50e277d993480d05ef75dd88a9bd8e677323e5e1  libdrm-2.4.113.tar.xz
-sha512  fca9834ce090f63ce6dc6d04491a2c5e86162fdddfc8ea70d55a6cdeb401be656388aae1577e58f463a78d8dc502be0a641908784819874e20bbec9a39a057e0  libdrm-2.4.113.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-November/003250.html
+sha256  3049cf843a47d12e5eeefbc3be3496d782fa09f42346bf0b7defe3d1e598d026  libdrm-2.4.114.tar.xz
+sha512  8dcd4be5674e3ea2ab4394fa8f461914e5aa7f4f57a2f448c5216d84ee6682e16b45eafabf97b7d9f5c062183d9a6bf3f0c97499d4cb01c19807a51209a0f644  libdrm-2.4.114.tar.xz
 
 # Hash for license file
 sha256  d0a616a9020dc0271e36e6dd4bad174b4e2c2a42636f13785f8e18dd5f85fd83  data/meson.build
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 34bd678c5a..56366b6c48 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.113
+LIBDRM_VERSION = 2.4.114
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
