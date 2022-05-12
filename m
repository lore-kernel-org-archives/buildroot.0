Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E9DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E019282F51;
	Thu, 12 May 2022 18:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lo1MGdUXhus7; Thu, 12 May 2022 18:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7AAF82628;
	Thu, 12 May 2022 18:54:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4731BF9CB
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D35481B04
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TmJVgmzq2Qfq for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FC6381902
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:53:58 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id 6002835CF
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:56 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwi-0Fmf3q0; Thu, 12 May 2022 20:53:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwh-0004aZ-Tv
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:55 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:37 +0200
Message-Id: <20220512185355.873825-7-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381636-0000F5B3-DFDA894D/0/0 CLEAN NORMAL
X-TOI-MSGID: 8384ba2e-d67e-44d4-8c30-d1b65d4f07df
Subject: [Buildroot] [PATCH 07/25] package/x11r7/xapp_appres: bump version
 to 1.0.6
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
https://lists.x.org/archives/xorg-announce/2022-April/003141.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_appres/xapp_appres.hash | 10 ++++------
 package/x11r7/xapp_appres/xapp_appres.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_appres/xapp_appres.hash b/package/x11r7/xapp_appres/xapp_appres.hash
index 8750e2d14c..17190e60e7 100644
--- a/package/x11r7/xapp_appres/xapp_appres.hash
+++ b/package/x11r7/xapp_appres/xapp_appres.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002847.html
-md5 f544e701043249d2bb3deed48314bc55  appres-1.0.5.tar.bz2
-sha1 5e5dbffd0a125732bb8bb8a202e04555a9604089  appres-1.0.5.tar.bz2
-sha256 ffad893712c81943b919e3cbfe46fc65259cc0d9eb96d5e658670e3fbb265928  appres-1.0.5.tar.bz2
-sha512 70825563cd80f0f433c48ab2fdae888072939c1b22fb22340b70b9444c97916275ed92c9e5bf9a06bb76c32a5371b89ff7c0211a9a47a227c88311078c2c4137  appres-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003141.html
+sha256  8b2257e2a0a1ad8330323aec23f07c333075d7fe4e6efd88e0c18fba8223590b  appres-1.0.6.tar.xz
+sha512  6d14f6a2ad5c83a4d42d4c51ec9a9f32652dfe7624881f1f41c0b1f4946904e7e5ca81a2fd9f4f4824488ce1bd2a4047f92320626bf33b0f1afc5e6b89d3e2b9  appres-1.0.6.tar.xz
 # Locally computed
-sha256 5969302729a9621fd526a7f9942a51a29b858e0b682ffd28eeda5fc4dfaddf55  COPYING
+sha256  5969302729a9621fd526a7f9942a51a29b858e0b682ffd28eeda5fc4dfaddf55  COPYING
diff --git a/package/x11r7/xapp_appres/xapp_appres.mk b/package/x11r7/xapp_appres/xapp_appres.mk
index 4159332bd3..9beada295c 100644
--- a/package/x11r7/xapp_appres/xapp_appres.mk
+++ b/package/x11r7/xapp_appres/xapp_appres.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_APPRES_VERSION = 1.0.5
-XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.bz2
+XAPP_APPRES_VERSION = 1.0.6
+XAPP_APPRES_SOURCE = appres-$(XAPP_APPRES_VERSION).tar.xz
 XAPP_APPRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_APPRES_LICENSE = MIT
 XAPP_APPRES_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
