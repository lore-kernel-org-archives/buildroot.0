Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAD5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 12:57:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F4EA61152
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 12:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F4EA61152
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB3836068C;
	Sat, 13 Nov 2021 12:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIHMuqFt5m-6; Sat, 13 Nov 2021 12:57:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF6460673;
	Sat, 13 Nov 2021 12:57:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1C9D1BF31F
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 12:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF41740413
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 12:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5y2jHTC2l0lD for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 12:56:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 923B8403EF
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 12:56:33 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout10.t-online.de (Postfix) with SMTP id 6412E150DB;
 Sat, 13 Nov 2021 13:56:23 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.5.80]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mlsZw-1Ugr7B0; Sat, 13 Nov 2021 13:56:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:57762)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mlsZw-00028Q-CU;
 Sat, 13 Nov 2021 13:56:20 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 13:56:16 +0100
Message-Id: <20211113125620.1981211-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1636808181-00001454-393479BC/0/0 CLEAN NORMAL
X-TOI-MSGID: 7a940f91-9682-471f-a1f6-f02b6c2d4e8c
Subject: [Buildroot] [PATCH/next 1/5] package/x11r7/xorgproto: bump version
 to 2021.5
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2021-September/003108.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xorgproto/xorgproto.hash | 6 +++---
 package/x11r7/xorgproto/xorgproto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index a88c129dd0..802217ce77 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-April/003085.html
-sha256  0f5157030162844b398e7ce69b8bb967c2edb8064b0a9c9bb5517eb621459fbf  xorgproto-2021.4.tar.bz2
-sha512  0d905e5f135daf7005e23371cbdc41a62d99567e0a20784e71ead0092ffd1e7582733819f7198add1d97edcc9aa80012ae01d2be8367280d69b41d0c25349367  xorgproto-2021.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-September/date.html
+sha256  aa2f663b8dbd632960b24f7477aa07d901210057f6ab1a1db5158732569ca015  xorgproto-2021.5.tar.bz2
+sha512  0f5c4ee4fd56cd46f4d5850bcf3e04c92d2e98de54d0113987cb49fc83cf1f4d0e50e976333179c72fe2178cfa15ec6c1bfc4e76fc3bc2a4be80616ce079da87  xorgproto-2021.5.tar.bz2
 
 # Locally computed
 sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 59f0640241..1d5cd4caa8 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2021.4
+XORGPROTO_VERSION = 2021.5
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.bz2
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
