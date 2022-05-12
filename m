Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93877C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5359182628;
	Thu, 12 May 2022 18:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4o2-OXrOoslJ; Thu, 12 May 2022 18:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB2981C18;
	Thu, 12 May 2022 18:56:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0A741BF578
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFB144097F
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9X3sVLYFEdoF for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:54:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5FD04097D
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:54:01 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id B46DC19771
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:56 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwi-0Fvjfw0; Thu, 12 May 2022 20:53:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwi-0004aZ-BT
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:56 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:43 +0200
Message-Id: <20220512185355.873825-13-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381636-0000F5B3-8BA949AD/0/0 CLEAN NORMAL
X-TOI-MSGID: d2409b7e-e963-4333-95c1-0a2e18824c0a
Subject: [Buildroot] [PATCH 13/25] package/x11r7/xapp_xdm: bump version to
 1.1.13
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
https://lists.x.org/archives/xorg-announce/2022-April/003148.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xdm/xapp_xdm.hash | 10 ++++------
 package/x11r7/xapp_xdm/xapp_xdm.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xdm/xapp_xdm.hash b/package/x11r7/xapp_xdm/xapp_xdm.hash
index 605be9debc..5ba3a3f062 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.hash
+++ b/package/x11r7/xapp_xdm/xapp_xdm.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002959.html
-md5 47c4c3bf8d59b64b64d134df8b5e5ec5  xdm-1.1.12.tar.bz2
-sha1 5cc5590e40837949b1a63cb030878f8ceebd4d85  xdm-1.1.12.tar.bz2
-sha256 0dd283f72dda098d09e2925b9278c95e21551e693a5802ab442d1b577d8327f4  xdm-1.1.12.tar.bz2
-sha512 1a4be0a070ced5db8fda6fc74794c9f9ed0cb37fa440fda6a3a7652aff62dfc3d7ba68b9facf054671ebf0f4db2a0eec29d0aa3716e3407ccd5529bac3553bdb  xdm-1.1.12.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003148.html
+sha256  e58267e8f1478f2f5cd57cbcf2367a36973860c3131a450a3e0816585af03264  xdm-1.1.13.tar.xz
+sha512  1c7ba51dc8c6989ff6ede3a3abd06e002903609d4ebd31f06ec39fbfee3a80a690c6180f85c3ab135a0de4623261d92a191d1ca5f733cdb3bd2e7e78977b98e5  xdm-1.1.13.tar.xz
 # Locally computed
-sha256 b33b4bebbd6511b3e15315e8e29d67f25334ee45da8b7da6e6e97c53a70c6923  COPYING
+sha256  b33b4bebbd6511b3e15315e8e29d67f25334ee45da8b7da6e6e97c53a70c6923  COPYING
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 3c91e21579..98306f66f5 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XDM_VERSION = 1.1.12
-XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.bz2
+XAPP_XDM_VERSION = 1.1.13
+XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.xz
 XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDM_LICENSE = MIT
 XAPP_XDM_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
