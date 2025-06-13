Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF97EC71136
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 21:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 712C8404A6;
	Fri, 13 Jun 2025 21:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCVT6G8gv6nM; Fri, 13 Jun 2025 21:15:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E25404B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E25404B6;
	Fri, 13 Jun 2025 21:15:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D28B41BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4BE8404B6
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVm7IsCn-UdC for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 21:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3B65404A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3B65404A6
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:15:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E399283602; Fri, 13 Jun 2025 21:15:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Jun 2025 23:13:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9aff5cb69799b742a7d5de4cc845e519eddcd664
X-Git-Newrev: c7f3ea0e1a6f0598f04abbd30284bbab3a47cd47
X-Patchwork-Hint: ignore
Message-Id: <20250613211512.E399283602@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============0383225176285392004=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0383225176285392004==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c7f3ea0e1a6f0598f04abbd30284bbab3a47cd47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the release announces since 25.1.1, see:
25.1.2: https://lists.freedesktop.org/archives/mesa-announce/2025-June/000806.html
25.1.3: https://lists.freedesktop.org/archives/mesa-announce/2025-June/000807.html

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add links to release announces]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 45b7e9084a..2ce0465a08 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.1.1
+MESA3D_HEADERS_VERSION = 25.1.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index ee99e8b635..c01d6ae762 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-May/000804.html
-sha256  cf942a18b7b9e9b88524dcbf0b31fed3cde18e6d52b3375b0ab6587a14415bce  mesa-25.1.1.tar.xz
-sha512  8000fec61da3b7c0355b74458c52f8faeb562398a1882d68cd31a253848edd3333072521ec52f8c5c1a62d909afd6667803d43cb54027d0af3d944f1add27aae  mesa-25.1.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-June/000807.html
+sha256  ffcb6cadb5fd356d56008e6308641dfe4b2929f30139f6585436ca6e3cddba7f  mesa-25.1.3.tar.xz
+sha512  20b72ac4e39e559e36be07f003707cf5e25c5ebac22746d71438edecb9d911f5341373b1632ff08c00b57ac15fc880ce5a203ab9165e5e71057816be31344fd7  mesa-25.1.3.tar.xz2
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 000b9150f1..76789f647e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.1.1
+MESA3D_VERSION = 25.1.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos

--===============0383225176285392004==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0383225176285392004==--
