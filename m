Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A904C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCA6540573;
	Thu, 30 Dec 2021 15:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YBehL4ZHlZau; Thu, 30 Dec 2021 15:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9EE440495;
	Thu, 30 Dec 2021 15:34:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 746421BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 637B9813E9
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3oV3E_pDu97p for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:34:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AA15813E2
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:34:32 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout01.t-online.de (Postfix) with SMTP id 47DFA7464;
 Thu, 30 Dec 2021 16:34:30 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.128]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n2xRm-4VkEmf0; Thu, 30 Dec 2021 16:34:30 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43652)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n2xRl-00078U-LX;
 Thu, 30 Dec 2021 16:34:29 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:34:27 +0100
Message-Id: <20211230153429.2038516-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211230153429.2038516-1-bernd.kuhls@t-online.de>
References: <20211230153429.2038516-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640878470-00001C4D-157C35C1/0/0 CLEAN NORMAL
X-TOI-MSGID: 581f352a-1632-4d66-82a3-b60473f19239
Subject: [Buildroot] [PATCH 2/4] package/intel-mediasdk: bump version to
 22.1.0
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-mediasdk/intel-mediasdk.hash | 2 +-
 package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index 83c52fa271..7cd61fe9b8 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2bcf0bfc2cc4f6a0b865d50c08a327d5bca81738b31a40c8f0e4eba12689d63d  intel-mediasdk-21.4.3.tar.gz
+sha256  5ed1d22b5c5a05d3e848e43caa2b3966dbfb7f74281a646e6d0774a0621a9b8b  intel-mediasdk-22.1.0.tar.gz
 sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index 9f082bfa90..7d57e0e928 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 21.4.3
+INTEL_MEDIASDK_VERSION = 22.1.0
 INTEL_MEDIASDK_SITE = https://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
