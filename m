Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1EFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B6EE611CE;
	Sun, 24 Jul 2022 16:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B6EE611CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLxuhHH6nehp; Sun, 24 Jul 2022 16:28:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45EFA61B54;
	Sun, 24 Jul 2022 16:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45EFA61B54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7603A1BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5722400B9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:25:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5722400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rlwVhQX8OK_N for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A909040147
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A909040147
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:25:08 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 787F812DF9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 18:25:04 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.202.112]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1oFePd-3I375C0; Sun, 24 Jul 2022 18:25:01 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40906)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1oFePc-0007mb-1T;
 Sun, 24 Jul 2022 18:25:00 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 18:24:44 +0200
Message-Id: <20220724162500.2683871-5-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
References: <20220724162500.2683871-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1658679901-0144CFA9-76F97F4E/0/0 CLEAN NORMAL
X-TOI-MSGID: bb991cfc-3479-438b-83aa-4ae65294acb2
Subject: [Buildroot] [PATCH 04/20] package/x11r7/xapp_xfontsel: bump version
 to 1.1.0
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
 package/x11r7/xapp_xfontsel/xapp_xfontsel.hash | 10 ++++------
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash b/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
index a09df5585b..8d7e546bba 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002861.html
-md5 13150ff98846bf6d9a14bee00697fa47  xfontsel-1.0.6.tar.bz2
-sha1 3fd8d78cc270030b41298170c3e5222065dd1cfd  xfontsel-1.0.6.tar.bz2
-sha256 25aa0b7c4262f5e99c07c2b96e00e4eb25b7e53f94fa803942af9d0e8da3001c  xfontsel-1.0.6.tar.bz2
-sha512 2f6bc51549a302404cdaf9a5a825add383953fcbb2a0c7076691cefd4dd7e4a3c772c047be74101c8486f75d03ce0bd3e65ede14e91732cf2a932810441c9099  xfontsel-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003174.html
+sha256  17052c3357bbfe44b8468675ae3d099c2427ba9fcac10540aef524ae4d77d1b4  xfontsel-1.1.0.tar.xz
+sha512  be67d223668431c9b5dd2ef74032d2f087be5f8f0ccc427bc7ee43e7ce42214edddb07d8c3d6d6de93ea35314392d384f1ab1ae5c48b2cfbce418610e3945a52  xfontsel-1.1.0.tar.xz
 # Locally computed
-sha256 a27097bcc5cdf4fa5d761dd4e5cea1f41911c51b0a7d9da6e3a48f69d9fd0c09 COPYING
+sha256  a27097bcc5cdf4fa5d761dd4e5cea1f41911c51b0a7d9da6e3a48f69d9fd0c09  COPYING
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 9dea4299b3..ac12f9c509 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFONTSEL_VERSION = 1.0.6
-XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
-XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFONTSEL_VERSION = 1.1.0
+XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.xz
+XAPP_XFONTSEL_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XFONTSEL_LICENSE = MIT
 XAPP_XFONTSEL_LICENSE_FILES = COPYING
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
