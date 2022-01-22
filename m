Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E185EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F97F60BCE;
	Sat, 22 Jan 2022 19:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHsRd42228eu; Sat, 22 Jan 2022 19:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A1B60BBF;
	Sat, 22 Jan 2022 19:54:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAE9E1BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B450140017
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OR1Xh6Ye2fYc for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:54:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA8DC40590
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 60AA78212B; Sat, 22 Jan 2022 19:47:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 20:53:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1945979c8e418063240bc3d3f9c512b878f9acf
X-Git-Newrev: 7e59579767cacc05c149cc7dbc089652ae5375b8
X-Patchwork-Hint: ignore
Message-Id: <20220122194724.60AA78212B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 21.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e59579767cacc05c149cc7dbc089652ae5375b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2022-January/000659.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1cdfff50c9..09640a903c 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.3.3
+MESA3D_HEADERS_VERSION = 21.3.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 235a1b55bb..559f21e06a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-December/000658.html
-sha256  ad7f4613ea7c5d08d9fcb5025270199e6ceb9aa99fd72ee572b70342240a8121  mesa-21.3.3.tar.xz
-sha512  0263d75435f8c16d40eba3eae29bf372e8994816718deec153c582a17c4dd6ef1c67b3236ed31e63f98bf4e1089fac5cfafae9fb84d3e1fa919b274f43e7e673  mesa-21.3.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2022-January/000659.html
+sha256  77104fd4a93bce69da3b0982f8ee88ba7c4fb98cfc491a669894339cdcd4a67d  mesa-21.3.4.tar.xz
+sha512  7aeea3dba0d39f4ac9f23c54aa0e6853d48000f50c4dd484618c28debe705cdd765ae8fafb5ddea0773976f7189849d9128be3f2282fea74394b59019cb786b9  mesa-21.3.4.tar.xz
 
 # License
 sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index aa365838ab..f49d96025a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.3.3
+MESA3D_VERSION = 21.3.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
