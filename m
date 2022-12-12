Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BC3C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 20:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62C1A60D78;
	Mon, 12 Dec 2022 20:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C1A60D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-3zUpPRs5_z; Mon, 12 Dec 2022 20:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A32F560BD1;
	Mon, 12 Dec 2022 20:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A32F560BD1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C07A1BF37B
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F7D240299
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 20:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F7D240299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q96wbk8O2_Ak for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 20:27:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87C8A40277
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87C8A40277
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 20:27:35 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout04.t-online.de (Postfix) with SMTP id 8C76A9E1A;
 Mon, 12 Dec 2022 21:27:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p4pOa-44mcTZ0; Mon, 12 Dec 2022 21:27:29 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56274)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p4pOa-00065W-1s;
 Mon, 12 Dec 2022 21:27:28 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 21:27:28 +0100
Message-Id: <20221212202728.1531746-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221212202728.1531746-1-bernd.kuhls@t-online.de>
References: <20221212202728.1531746-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670876849-3AFEA81E-6887A64D/0/0 CLEAN NORMAL
X-TOI-MSGID: 2bca2982-6cc7-4079-9549-17c045b72031
Subject: [Buildroot] [PATCH 2/2] package/libass: bump version to 0.17.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/libass/libass/releases/tag/0.17.0

Added new optional dependency to libunibreak introduced by this bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index b8952a4730..beb7639b1f 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5dbde9e22339119cf8eed59eea6c623a0746ef5a90b689e68a090109078e3c08  libass-0.16.0.tar.xz
+sha256  971e2e1db59d440f88516dcd1187108419a370e64863f70687da599fdf66cc1a  libass-0.17.0.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 4ba812e3fc..1cc8310312 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.16.0
+LIBASS_VERSION = 0.17.0
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
@@ -33,4 +33,11 @@ else
 LIBASS_CONF_OPTS += --disable-fontconfig --disable-require-system-font-provider
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNIBREAK),y)
+LIBASS_DEPENDENCIES += libunibreak
+LIBASS_CONF_OPTS += --enable-libunibreak
+else
+LIBASS_CONF_OPTS += --disable-libunibreak
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
