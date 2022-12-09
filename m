Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EF4C4332F
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9886341A5C;
	Fri,  9 Dec 2022 17:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9886341A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OWqXRxQGTTmr; Fri,  9 Dec 2022 17:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90AE241A65;
	Fri,  9 Dec 2022 17:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90AE241A65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91FDA1BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 337AC60E24
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 337AC60E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nLDrcoRzZsf for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E2E4610D2
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E2E4610D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C61985E9E; Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1564c1e6e9e9e72daae419c1a839b986485eff5a
X-Git-Newrev: e708680a43bdd4bc6cb5b84544a98bc27ccc8d55
X-Patchwork-Hint: ignore
Message-Id: <20221209170103.7C61985E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xfd: bump version to
 1.1.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e708680a43bdd4bc6cb5b84544a98bc27ccc8d55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003266.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xfd/xapp_xfd.hash | 8 +++-----
 package/x11r7/xapp_xfd/xapp_xfd.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xfd/xapp_xfd.hash b/package/x11r7/xapp_xfd/xapp_xfd.hash
index ec85170180..5965958828 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.hash
+++ b/package/x11r7/xapp_xfd/xapp_xfd.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002968.html
-md5  f9c9f2b101a96d4b50c2a4ab9b5ab5b1  xfd-1.1.3.tar.bz2
-sha1  ca6dbe2027b205992a52c6bb717a43508f12a8c4  xfd-1.1.3.tar.bz2
-sha256  192f938ba5830e84cc807d8ead2ad9655b43eaed6500c830f3e083aad10ed958  xfd-1.1.3.tar.bz2
-sha512  68e2d4ce5e24215353b6f3231191d69639c4dd90a703e03ccf152bbfe4012da071c387ba289f918fb0336a3be9ee49dc05cbec7273fa85f5e476ead7e10795f0  xfd-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003266.html
+sha256  d5470ffb66fd45a1e1b03d6df01f12d4caf0cf675cde0345cda237243e9076fd  xfd-1.1.4.tar.xz
+sha512  fa1f8a7b5d89be20fb2b1e3e0e8f4d7f9463e91fd385d21e1403a398c2e263112043b568417c420c5ee33bec60e06658498dd55df6d7ac19da3af0844f932209  xfd-1.1.4.tar.xz
 # Locally computed
 sha256  57ae10f24fc110dafb3b8d7735cf26b1905ff74e716745b2520e4ccd7751095c  COPYING
diff --git a/package/x11r7/xapp_xfd/xapp_xfd.mk b/package/x11r7/xapp_xfd/xapp_xfd.mk
index 149e24b79a..1ef1d69db3 100644
--- a/package/x11r7/xapp_xfd/xapp_xfd.mk
+++ b/package/x11r7/xapp_xfd/xapp_xfd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFD_VERSION = 1.1.3
-XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.bz2
-XAPP_XFD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFD_VERSION = 1.1.4
+XAPP_XFD_SOURCE = xfd-$(XAPP_XFD_VERSION).tar.xz
+XAPP_XFD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XFD_LICENSE = MIT
 XAPP_XFD_LICENSE_FILES = COPYING
 XAPP_XFD_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
