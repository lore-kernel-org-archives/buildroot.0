Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4596FCEB2DD
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 15:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D469F83E74;
	Sat, 15 Nov 2025 15:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owSlEctUZhAc; Sat, 15 Nov 2025 15:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0A8283E6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A8283E6A;
	Sat, 15 Nov 2025 15:25:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2345D5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 15:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDD146080E
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 15:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVCkTFMAxNYB for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 15:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 061FA6064B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 061FA6064B
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 15:25:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3AE684601; Sat, 15 Nov 2025 15:25:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 15:18:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 273f6f3e4b95631f1c6c38ff1a30b68a5b8117c0
X-Git-Newrev: 925dc2606af15dbf370efa59f333bff3e9e476e8
X-Patchwork-Hint: ignore
Message-Id: <20251115152535.E3AE684601@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.7
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=925dc2606af15dbf370efa59f333bff3e9e476e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2025-November/000828.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 6156a1f398..75d7405504 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.2.6
+MESA3D_HEADERS_VERSION = 25.2.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f8de60f491..e2b3d9ca79 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-October/000826.html
-sha256  361c97e8afa5fe20141c5362c5b489040751e12861c186a16c621a2fb182fc42  mesa-25.2.6.tar.xz
-sha512  c34f55132ee9097a7c4961745bf07a08fc612bf0f7c570c023fedb16c8eafbefdc1cc022f722c345780bb14ec4ce25d9a206a9196d9d51c97b389db5160de9cc  mesa-25.2.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-November/000828.html
+sha256  b40232a642011820211aab5a9cdf754e106b0bce15044bc4496b0ac9615892ad  mesa-25.2.7.tar.xz
+sha512  87dd815e0d11d6ec0eb969ee93d3f376103bb899d90599e0b7902394e41c58139384df79f89633e132ca969348d3320f55308a74651d409b454d51f1bcda27bc  mesa-25.2.7.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index db48a378fc..5305ea2de1 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.2.6
+MESA3D_VERSION = 25.2.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
