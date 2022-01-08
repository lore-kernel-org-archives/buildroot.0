Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E21C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6053160A9F;
	Sat,  8 Jan 2022 09:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pYv51GzBg8hB; Sat,  8 Jan 2022 09:32:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9888C60A75;
	Sat,  8 Jan 2022 09:32:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA791BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01AFF60A73
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKKx0cxH-62j for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:32:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FBBF60806
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:32:12 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 128C0B8D
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:32:09 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.177.158]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n6850-3yscNd0; Sat, 8 Jan 2022 10:32:07 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:55030)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n6850-0000GA-H1
 for buildroot@buildroot.org; Sat, 08 Jan 2022 10:32:06 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 10:32:06 +0100
Message-Id: <20220108093206.999409-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1641634327-000184BD-E469E188/0/0 CLEAN NORMAL
X-TOI-MSGID: 047deb78-a586-4e47-8202-bce587250f33
Subject: [Buildroot] [PATCH 1/1] package/freetype: bump version to 2.11.1
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

Updated license hash and location of LICENSE.TXT due to upstream commit:
https://gitlab.freedesktop.org/freetype/freetype/-/commit/0606350c2a08eec120e4557a07f252e1c72963ce

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freetype/freetype.hash | 8 ++++----
 package/freetype/freetype.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 36571b51af..7abc3d96da 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.10.4/
-sha1  0181862673f7216ad2b5074f95fc131209e30b27  freetype-2.10.4.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.11.1/
+sha1  86bdc98b37efe447cf53420bf2c18402ff905112  freetype-2.11.1.tar.xz
 
 # Locally calculated
-sha256  86a854d8905b19698bbc8f23b860bc104246ce4854dcea8e3b0fb21284f75784  freetype-2.10.4.tar.xz
-sha256  fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb  docs/LICENSE.TXT
+sha256  3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8  freetype-2.11.1.tar.xz
+sha256  c85e842b7ff04d95dab7d68e812773de0f8b67940e5449d35b42c66eb0f619fe  LICENSE.TXT
 sha256  08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1  docs/FTL.TXT
 sha256  c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18  docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 59d6dc0eb8..912e6c4daa 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.10.4
+FREETYPE_VERSION = 2.11.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPL-2.0+
-FREETYPE_LICENSE_FILES = docs/LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
+FREETYPE_LICENSE_FILES = LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_CPE_ID_VENDOR = freetype
 FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
