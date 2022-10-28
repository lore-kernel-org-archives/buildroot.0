Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA6FC38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 19:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0B3481765;
	Fri, 28 Oct 2022 19:15:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0B3481765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yQa5UpU3msla; Fri, 28 Oct 2022 19:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6DCC81760;
	Fri, 28 Oct 2022 19:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6DCC81760
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B60A1BF859
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 19:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6AB241499
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 19:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6AB241499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2216Bp33yY6P for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 19:15:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9375A41296
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9375A41296
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 19:15:43 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout05.t-online.de (Postfix) with SMTP id B21B08341;
 Fri, 28 Oct 2022 21:15:40 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.226]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ooUpC-1vu9D70; Fri, 28 Oct 2022 21:15:26 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:52200)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ooUpC-0003Fh-1f;
 Fri, 28 Oct 2022 21:15:26 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 21:15:24 +0200
Message-Id: <20221028191526.122405-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028191526.122405-1-bernd.kuhls@t-online.de>
References: <20221028191526.122405-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1666984526-4D45FB8C-F24AE57E/0/0 CLEAN NORMAL
X-TOI-MSGID: a70e26c3-4702-4b8b-b9ca-6e87f4af4b1f
Subject: [Buildroot] [PATCH 2/4] package/alsa-plugins: bump version to
 1.2.7.1
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.7_v1.2.7.1#alsa-plugins

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/alsa-plugins/alsa-plugins.hash | 2 +-
 package/alsa-plugins/alsa-plugins.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-plugins/alsa-plugins.hash b/package/alsa-plugins/alsa-plugins.hash
index 2582a0d639..5d190e4d7b 100644
--- a/package/alsa-plugins/alsa-plugins.hash
+++ b/package/alsa-plugins/alsa-plugins.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  068818a4b55d8c029daa00015d853d45113f56b224b7c64e1e117988c825b2a0  alsa-plugins-1.2.6.tar.bz2
+sha256  8c337814954bb7c167456733a6046142a2931f12eccba3ec2a4ae618a3432511  alsa-plugins-1.2.7.1.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING.GPL
diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
index b8819151ef..5728ebfe37 100644
--- a/package/alsa-plugins/alsa-plugins.mk
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_PLUGINS_VERSION = 1.2.6
+ALSA_PLUGINS_VERSION = 1.2.7.1
 ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
 ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
 ALSA_PLUGINS_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
