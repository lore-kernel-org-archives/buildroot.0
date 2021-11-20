Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF4AC433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 10:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29BED82435;
	Sat, 20 Nov 2021 10:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhBDuQhbmJW0; Sat, 20 Nov 2021 10:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 747E180B79;
	Sat, 20 Nov 2021 10:40:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 900081BF420
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 10:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F430410B1
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 10:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 000wyJH547yP for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 10:40:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EA7F410B5
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 10:40:07 +0000 (UTC)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout08.t-online.de (Postfix) with SMTP id A484FD81D
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:40:02 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.220]) by fwd74.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1moNmp-0YnVj70; Sat, 20 Nov 2021 11:39:59 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45108)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1moNmo-0003Si-Lz
 for buildroot@buildroot.org; Sat, 20 Nov 2021 11:39:58 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 11:39:58 +0100
Message-Id: <20211120103958.2590722-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1637404799-00001446-23FFC530/0/0 CLEAN NORMAL
X-TOI-MSGID: 11d1b0c4-aad5-4d10-b72d-6bec587b0043
Subject: [Buildroot] [PATCH/next 1/1] package/x11r7/xkeyboard-config: bump
 version to 2.34
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 2 +-
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index fe80291557..a5ae7a7039 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1feee317ba39b91902b0cbd2987c0c73e6afbfc8f4c096367a5c86c216c036a8  xkeyboard-config-2.32.tar.bz2
+sha256  b321d27686ee7e6610ffe7b56e28d5bbf60625a1f595124cd320c0caa717b8ce  xkeyboard-config-2.34.tar.bz2
 sha256  6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 0fd681b59a..fe46dae3b7 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.32
+XKEYBOARD_CONFIG_VERSION = 2.34
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.bz2
 XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
