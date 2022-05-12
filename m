Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4E9C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EF8140133;
	Thu, 12 May 2022 18:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1uIQHvDEinb; Thu, 12 May 2022 18:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D6FF4014C;
	Thu, 12 May 2022 18:55:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72A3B1C1189
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A950607F0
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ptm2EgraDC2M for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9458460806
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:53:59 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout03.t-online.de (Postfix) with SMTP id A500E3D83
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:56 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwi-0Sp6qi0; Thu, 12 May 2022 20:53:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwi-0004aZ-De
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:56 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:44 +0200
Message-Id: <20220512185355.873825-14-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381636-0001606D-244089CC/0/0 CLEAN NORMAL
X-TOI-MSGID: 73612118-05ae-4fd3-bfb1-7c1576bb3104
Subject: [Buildroot] [PATCH 14/25] package/x11r7/xapp_xedit: bump version to
 1.2.3
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
https://lists.x.org/archives/xorg-announce/2022-April/003149.html

Removed sha1 hash, not provided by upstream anymore.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xedit/xapp_xedit.hash | 6 +++---
 package/x11r7/xapp_xedit/xapp_xedit.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xedit/xapp_xedit.hash b/package/x11r7/xapp_xedit/xapp_xedit.hash
index e521e00821..d550dbc8c6 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.hash
+++ b/package/x11r7/xapp_xedit/xapp_xedit.hash
@@ -1,5 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-February/002535.html
-sha1	f37b5d0f8ec461955f0419dbb1890d8cf63d179d				xedit-1.2.2.tar.bz2
-sha256	69aa42885dfc06332ca22eb01cc7187e49206e6d65b74113a8ee4cc345fc2927	xedit-1.2.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003149.html
+sha256  bdd33afeeca881622e55d2cf28f07b4a98f083d0a2573c0b9048f25bdd62db2f  xedit-1.2.3.tar.xz
+sha512  1089c35ef961e53f74cc7d892960e1ee7f0da17529e3173e7f7764b0eb4ee94d1e068cb177d8502ca55c1dd6808962d4b1427e303adc7e6db80be8828557f45a  xedit-1.2.3.tar.xz
 # Locally computed
 sha256  6d3e4092277ea08fc6b3180dba061120ea53ee965afb84fce16f8ab3d35bb47a  COPYING
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 1cb99dc6f4..5aae798f05 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XEDIT_VERSION = 1.2.2
-XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
+XAPP_XEDIT_VERSION = 1.2.3
+XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.xz
 XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEDIT_LICENSE = MIT
 XAPP_XEDIT_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
