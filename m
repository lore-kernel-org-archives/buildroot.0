Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC08C27C55
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 20:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8425184BD6;
	Fri,  7 Jun 2024 20:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8NsXrBkOIO3; Fri,  7 Jun 2024 20:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 597BF84CF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 597BF84CF2;
	Fri,  7 Jun 2024 20:31:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24FA01BF473
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0224B42818
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 20:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJDcvBif8yxR for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 20:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 244A942813
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 244A942813
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 20:30:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8DBE87D80; Fri,  7 Jun 2024 20:30:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jun 2024 22:25:17 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1be26aad93ba97243d0c3a8e4dae81cefd4eca8a
X-Git-Newrev: 8886594d59fc8bcba40fd90a3d659100aa7ec538
X-Patchwork-Hint: ignore
Message-Id: <20240607203033.B8DBE87D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=8886594d59fc8bcba40fd90a3d659100aa7ec538
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2024-April/000754.html
https://lists.freedesktop.org/archives/mesa-announce/2024-April/000755.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e1e4237dc7bd182709b9e28ccb2cc451da157f49)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0756296a01..e1f6211e17 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.4
+MESA3D_HEADERS_VERSION = 24.0.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e2e0be2641..fb3df96555 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-dev/2024-March/226176.html
-sha256  90febd30a098cbcd97ff62ecc3dcf5c93d76f7fa314de944cfce81951ba745f0  mesa-24.0.4.tar.xz
-sha512  1d05b07026417fbe9cf18f7b18f2db9fe5fe327555c590283d87f69bbdd51f64135928a1dbe155d750187fc268bbdbb070bc1ae9ffc3e013b8707b391969d515  mesa-24.0.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-April/000755.html
+sha256  8b7a92dbe6468c18f2383700135b5fe9de836cdf0cc8fd7dbae3c7110237d604  mesa-24.0.6.tar.xz
+sha512  60fcc77132c3cb0c98e650d97d3324bfd18abe7f8f8a3aa5209f71b2fddd94510f939bbf5272b2241749307184d5badde9da4842be57ce13f5760875885ea6fc  mesa-24.0.6.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c2343488ed..39cbb4c23b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.4
+MESA3D_VERSION = 24.0.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
