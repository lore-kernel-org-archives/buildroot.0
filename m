Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8771DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 330A7607CA;
	Thu, 12 May 2022 18:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5yq8ZDjADN0r; Thu, 12 May 2022 18:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5593560806;
	Thu, 12 May 2022 18:55:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E2DF1C1190
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C3DE4097F
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLrMfu6kMVsn for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7601E4097D
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:53:59 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id 5F00D35CE
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:56 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwh-0Fvjft0; Thu, 12 May 2022 20:53:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwh-0004aZ-JH
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:55 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:32 +0200
Message-Id: <20220512185355.873825-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381636-0000F5B3-5EF8039E/0/0 CLEAN NORMAL
X-TOI-MSGID: fcba5589-61d0-451c-bf35-db8c0ffaeb6a
Subject: [Buildroot] [PATCH 02/25] package/x11r7/xapp_twm: bump version to
 1.0.12
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
https://lists.x.org/archives/xorg-announce/2022-April/003135.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_twm/xapp_twm.hash | 6 +++---
 package/x11r7/xapp_twm/xapp_twm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_twm/xapp_twm.hash b/package/x11r7/xapp_twm/xapp_twm.hash
index 26661f1fbd..75d89a9984 100644
--- a/package/x11r7/xapp_twm/xapp_twm.hash
+++ b/package/x11r7/xapp_twm/xapp_twm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-June/003047.html
-sha256  f4e8a842dec410e79741f25ed4dfac09df080835d0bba2e3983b5914569b68c7  twm-1.0.11.tar.xz
-sha512  948034bba23e6b6c4412fcd2e46bb11a9980297601218a54a5055165ab0229a44dde0d50f338b24e82d76f390597e2fa09d11ff7f3fe1b1d736b10083c7da20d  twm-1.0.11.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-April/003135.html
+sha256  aaf201d4de04c1bb11eed93de4bee0147217b7bdf61b7b761a56b2fdc276afe4  twm-1.0.12.tar.xz
+sha512  f3d68df7e06516f6b74f19181efcfd9db2479c8ea0c72c3a6ed0dc1b222405b40d81a2dea17b662955e0c1783e87d0d3eb067c3b6e7c6eed8c0d38d03d362260  twm-1.0.12.tar.xz
 # Locally computed
 sha256  4809ffc9656bc9a704e19ab467d1cedc97c48c9d1f9a4018e6d99d2e61f75945  COPYING
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index 46d4ca331d..b222830497 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_TWM_VERSION = 1.0.11
+XAPP_TWM_VERSION = 1.0.12
 XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.xz
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
