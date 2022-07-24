Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9E8C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EB6061178;
	Sun, 24 Jul 2022 16:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB6061178
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWExWOuN3pgi; Sun, 24 Jul 2022 16:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CB4360AF2;
	Sun, 24 Jul 2022 16:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CB4360AF2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 512A91BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4265941605
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4265941605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTNIM8iesGV2 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCC65415F0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCC65415F0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:07 +0000 (UTC)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout07.t-online.de (Postfix) with SMTP id C82F59FF7
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:05 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd73.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePc-0f12IN0; Sun, 24 Jul 2022 18:25:00 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePc-0007mb-2H;
 Sun, 24 Jul 2022 18:25:00 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:48 +0200
Message-Id: <20220724162500.2683871-9-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679900-0144F70D-0732CA83/0/0 CLEAN NORMAL
X-TOI-MSGID: 2acf98cd-3e0a-4364-af62-f4e9087b27b5
Subject: [Buildroot] [PATCH 08/20] package/x11r7/xapp_xwud: bump version to
 1.0.6
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xwud/xapp_xwud.hash | 10 ++++------
 package/x11r7/xapp_xwud/xapp_xwud.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xwud/xapp_xwud.hash b/package/x11r7/xapp_xwud/xapp_xwud.hash
index e42057819d..c895b98b23 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.hash
+++ b/package/x11r7/xapp_xwud/xapp_xwud.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002878.html
-md5 79972093bb0766fcd0223b2bd6d11932  xwud-1.0.5.tar.bz2
-sha1 a85d84a1b81f8e667ea6ac126d447590c93eb079  xwud-1.0.5.tar.bz2
-sha256 99997051f8a892313f22edf41dab45864e86e7062ee9012d5dbb6a40fc6b10a9  xwud-1.0.5.tar.bz2
-sha512 27a0ce7481978ae6cd94b0d94374af72185e270d68f2496620e148bb00945427c4827138d9efc48745e6382e3da3390ed0cdff7dbd02dcf9706e8ecccae97184  xwud-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003179.html
+sha256  64048cd15eba3cd9a3d2e3280650391259ebf6b529f2101d1a20f441038c1afe  xwud-1.0.6.tar.xz
+sha512  a7b964d9ef13e4726b2ef84dcc1040cdf510c8031c3e6e1dc1c711e65d9e56f1fc5921a7af3dbbd898b861c79e9da6242da23c2e73816e39152ae719052293e9  xwud-1.0.6.tar.xz
 # Locally computed
-sha256 be3db9aa060c462490a8c1ed44a4d059b32bba359f4688b1ecf3f794d363539e COPYING
+sha256  be3db9aa060c462490a8c1ed44a4d059b32bba359f4688b1ecf3f794d363539e COPYING
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 2c2e1ad497..0ad001d970 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XWUD_VERSION = 1.0.5
-XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
-XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XWUD_VERSION = 1.0.6
+XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.xz
+XAPP_XWUD_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XWUD_LICENSE = MIT
 XAPP_XWUD_LICENSE_FILES = COPYING
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
