Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5637C7EE43
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 08:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F9AF400DD;
	Sat, 10 Jun 2023 08:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F9AF400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F2KZilGTo69s; Sat, 10 Jun 2023 08:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB51D40114;
	Sat, 10 Jun 2023 08:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB51D40114
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7003F1BF35E
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 08:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 412CB424E1
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 08:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 412CB424E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpZqSOVR8J20 for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 08:40:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5D1C424C2
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5D1C424C2
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 08:40:00 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout03.t-online.de (Postfix) with SMTP id 81F34486B
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 10:39:58 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd80.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q7u8c-2OYoCX0; Sat, 10 Jun 2023 10:39:58 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:35450)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q7u8b-0001y3-2X
 for buildroot@buildroot.org; Sat, 10 Jun 2023 10:39:57 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 10:39:57 +0200
Message-Id: <20230610083957.3233937-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686386398-FAFFF4D3-B547AB0C/0/0 CLEAN NORMAL
X-TOI-MSGID: 36003162-617b-454a-a7bd-38e012ade411
Subject: [Buildroot] [PATCH 1/1] package/leafpad: bump version to 0.8.19
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

Changelog: https://github.com/tarot231/leafpad/blob/main/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/leafpad/leafpad.hash | 2 +-
 package/leafpad/leafpad.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafpad/leafpad.hash b/package/leafpad/leafpad.hash
index e21c07ad2c..4f6e68f0a2 100644
--- a/package/leafpad/leafpad.hash
+++ b/package/leafpad/leafpad.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c  leafpad-0.8.18.1.tar.gz
+sha256  07d3f712f4dbd0a33251fd1dee14e21afdc9f92090fc768c11ab0ac556adbe97  leafpad-0.8.19.tar.gz
 # Locally computed
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index c6c28d12e8..608fa37be4 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEAFPAD_VERSION = 0.8.18.1
+LEAFPAD_VERSION = 0.8.19
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
 LEAFPAD_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
