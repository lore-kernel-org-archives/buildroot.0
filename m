Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440B5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2CC740143;
	Thu, 12 May 2022 18:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 87ECcd6GHKFh; Thu, 12 May 2022 18:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E986140132;
	Thu, 12 May 2022 18:59:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B12A1BF578
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C3BA607CA
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSPIkextEzMM for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:54:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40E9260AC1
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:54:02 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout05.t-online.de (Postfix) with SMTP id 663B519773
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:54:00 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwi-0Fvjfx0; Thu, 12 May 2022 20:53:56 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwi-0004aZ-Fh
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:56 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:45 +0200
Message-Id: <20220512185355.873825-15-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381636-0000F5B3-D7CEF728/0/0 CLEAN NORMAL
X-TOI-MSGID: 08476f3e-e091-42d8-8232-f7cf67bb4189
Subject: [Buildroot] [PATCH 15/25] package/x11r7/xapp_xload: bump version to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003150.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Reformatted license hash.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xload/xapp_xload.hash | 10 ++++------
 package/x11r7/xapp_xload/xapp_xload.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xload/xapp_xload.hash b/package/x11r7/xapp_xload/xapp_xload.hash
index 99d9cabb0e..9716fe1500 100644
--- a/package/x11r7/xapp_xload/xapp_xload.hash
+++ b/package/x11r7/xapp_xload/xapp_xload.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002865.html
-md5 29afafdffe97f809d43a41db9dd63f25  xload-1.1.3.tar.bz2
-sha1 fd5053d38551883309863c2a43de2ceffa908a50  xload-1.1.3.tar.bz2
-sha256 f34e4803871d771325cfe52bebd98cc5b6040d3f065184ec73de436f9a375907  xload-1.1.3.tar.bz2
-sha512 8dbc4f0cee7b30d7381be819152b27653d9b0049266e59bde2e2c972a88c4f2bdea766fc407bbdfef15d0aab30fedc756189a1048170a812853133a5094fe7a5  xload-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003150.html
+sha256  8346b99120db24e0f42920f7f12e23e9b1b407d3a66ce419990387b608373031  xload-1.1.4.tar.xz
+sha512  114babe4e5a60f4713f9e4627ee0a1bbb2f1f238cb46f24c38aecff67f25e6b0f58cbd554c71095ddc2b01398adbfa379550a34c23c413db52157648028554f2  xload-1.1.4.tar.xz
 # Locally computed
-sha256 a09b31d26e4d2781eef1e71f39789f86cad6d81153e72064f45875910fa6258f COPYING
+sha256  a09b31d26e4d2781eef1e71f39789f86cad6d81153e72064f45875910fa6258f  COPYING
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index 9f491ccdc6..f219359447 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XLOAD_VERSION = 1.1.3
-XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.bz2
+XAPP_XLOAD_VERSION = 1.1.4
+XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.xz
 XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLOAD_LICENSE = MIT
 XAPP_XLOAD_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
