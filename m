Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CB6C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B99C40B80;
	Sat,  6 May 2023 17:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B99C40B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6nScPQJiiXm; Sat,  6 May 2023 17:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86C274107A;
	Sat,  6 May 2023 17:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86C274107A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6926A1BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F55F409B1
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F55F409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edso9AC0_z31 for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05E944136B
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05E944136B
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:23 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout10.t-online.de (Postfix) with SMTP id 0AEE61EBD0
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:22 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd87.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsN-1uT3Mg0; Sat, 6 May 2023 19:39:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsN-0004jT-1J
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:39:12 +0200
Message-Id: <20230506173917.1112500-17-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394759-EEFFAC53-C49B7659/0/0 CLEAN NORMAL
X-TOI-MSGID: 17e9adc6-e151-4d30-93e4-46bc78db4230
Subject: [Buildroot] [PATCH 17/22] package/x11r7/xfont_encodings: bump
 version to 1.0.7
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
https://lists.x.org/archives/xorg-announce/2023-February/003355.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xfont_encodings/xfont_encodings.hash | 6 +++---
 package/x11r7/xfont_encodings/xfont_encodings.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.hash b/package/x11r7/xfont_encodings/xfont_encodings.hash
index 6da1080576..80d4a48c40 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.hash
+++ b/package/x11r7/xfont_encodings/xfont_encodings.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003189.html
-sha256  77e301de661f35a622b18f60b555a7e7d8c4d5f43ed41410e830d5ac9084fc26  encodings-1.0.6.tar.xz
-sha512  2d52486996939401121bc858ba23031f70eef857760db8da4c84f083e981868e4bc7a8c2ab6d59274a0cf95f592a0dbfad47bce6c9299bb45d115b48abc39134  encodings-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-February/003355.html
+sha256  3a39a9f43b16521cdbd9f810090952af4f109b44fa7a865cd555f8febcea70a4  encodings-1.0.7.tar.xz
+sha512  dc72982b14e5d89fe1eff1ab11f308796c89255a06337d8cd6bf65757f11dd0a5478b41d844793213db8fe9638389734f148abe9df9fb05027ea563dacde6ba8  encodings-1.0.7.tar.xz
 # Locally computed
 sha256  13b4a0f9431f0fdd6ee36ed386e0b7d1eb429c5cb88df73353896078cbb5a137  COPYING
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index d499b421fb..7825f4117e 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_ENCODINGS_VERSION = 1.0.6
+XFONT_ENCODINGS_VERSION = 1.0.7
 XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.xz
-XFONT_ENCODINGS_SITE = https://xorg.freedesktop.org/releases/individual/font
+XFONT_ENCODINGS_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_ENCODINGS_LICENSE = Public Domain
 XFONT_ENCODINGS_LICENSE_FILES = COPYING
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
