Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A24C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F03360AC1;
	Thu, 12 May 2022 18:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFaCjq3zIMSw; Thu, 12 May 2022 18:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 930E6607CA;
	Thu, 12 May 2022 18:54:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 893CC1C1189
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7830081BA9
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E8_eMJTDRRLI for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94BE181B04
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:53:59 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout03.t-online.de (Postfix) with SMTP id A3F4D3D82
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:56 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwi-0Sp6qh0; Thu, 12 May 2022 20:53:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwh-0004aZ-Rj
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:55 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:36 +0200
Message-Id: <20220512185355.873825-6-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381636-0001606D-0BFFBB28/0/0 CLEAN NORMAL
X-TOI-MSGID: e9235490-722b-4da7-9556-653db1b71391
Subject: [Buildroot] [PATCH 06/25] package/x11r7/xapp_iceauth: bump version
 to 1.0.9
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
https://lists.x.org/archives/xorg-announce/2022-April/003140.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_iceauth/xapp_iceauth.hash | 10 ++++------
 package/x11r7/xapp_iceauth/xapp_iceauth.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.hash b/package/x11r7/xapp_iceauth/xapp_iceauth.hash
index f1ea73a7af..694b6beaa1 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.hash
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002850.html
-md5 3b9b79fa0f9928161f4bad94273de7ae  iceauth-1.0.8.tar.bz2
-sha1 2ce23c40a17d98badeb8ce70d26e81a5ac0e178c  iceauth-1.0.8.tar.bz2
-sha256 e6ee213a217265cc76050e4293ea70b98c32dce6505c6421227efbda62ab60c6  iceauth-1.0.8.tar.bz2
-sha512 9d4520adf951b16a3e784349dbb70d5d8176b74b956f8adc63abf55d049745c113b03ccfa60a281fc39b487db3742302dc6287c9985ce83a0157bf4674df2af1  iceauth-1.0.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003140.html
+sha256  2cb9dfcb545683af77fb1029bea3fc52dcc8a0666f7b8b2d7373b6ed4c408c05  iceauth-1.0.9.tar.xz
+sha512  16b2f58008587cf1544037ca8b1c76dbb75eb043b3048b3064e66ba6b147962233f1453c2cf18bfb136dd6dd21d3e27b5219e17e1ab7b81dbe93fb6aff801a72  iceauth-1.0.9.tar.xz
 # Locally computed
-sha256 fdd9ba8ccb92af2f31f542e7b7a18c27257e6cdce147d231bc9ba3654ad84976  COPYING
+sha256  fdd9ba8ccb92af2f31f542e7b7a18c27257e6cdce147d231bc9ba3654ad84976  COPYING
diff --git a/package/x11r7/xapp_iceauth/xapp_iceauth.mk b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
index 0e0e001705..ba1f522911 100644
--- a/package/x11r7/xapp_iceauth/xapp_iceauth.mk
+++ b/package/x11r7/xapp_iceauth/xapp_iceauth.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_ICEAUTH_VERSION = 1.0.8
-XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.bz2
+XAPP_ICEAUTH_VERSION = 1.0.9
+XAPP_ICEAUTH_SOURCE = iceauth-$(XAPP_ICEAUTH_VERSION).tar.xz
 XAPP_ICEAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_ICEAUTH_LICENSE = MIT
 XAPP_ICEAUTH_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
