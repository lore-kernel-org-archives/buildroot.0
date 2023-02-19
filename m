Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EADC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C49270262;
	Tue, 21 Feb 2023 02:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C49270262
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nfv4r6MdCXXB; Tue, 21 Feb 2023 02:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B01E0700D9;
	Tue, 21 Feb 2023 02:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B01E0700D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C72731BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52A947004D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A947004D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vGLNiBTC9DZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D0A970024
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D0A970024
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 419C4828C8; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 17:54:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 05de8e14ce9bf9ea109aa028b34aba559aa18aad
X-Git-Newrev: 71c51f1920deda32ea63105163fe84b20a0f9109
X-Patchwork-Hint: ignore
Message-Id: <20230220205302.419C4828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xutil_util-macros:
 bump version to 1.20.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=71c51f1920deda32ea63105163fe84b20a0f9109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg-announce/2023-February/003324.html

Updated license hash due to copyright year bump:
https://gitlab.freedesktop.org/xorg/util/macros/-/commit/cb147377e9341af05232f95814022abdecf14024

Switched tarball to xz, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xutil_util-macros/xutil_util-macros.hash | 8 ++++----
 package/xutil_util-macros/xutil_util-macros.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/xutil_util-macros/xutil_util-macros.hash b/package/xutil_util-macros/xutil_util-macros.hash
index 30c9916dca..4fcddb7a85 100644
--- a/package/xutil_util-macros/xutil_util-macros.hash
+++ b/package/xutil_util-macros/xutil_util-macros.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2021-January/003069.html
-sha256  0f812e6e9d2786ba8f54b960ee563c0663ddbe2434bf24ff193f5feab1f31971  util-macros-1.19.3.tar.bz2
-sha512  b9c7398a912c688a782eab5b1e0f6da2df11a430775c5c98fc3269f73a665de6eeb60d300a849e38d345714a6e51f74e9334cb6039767304cca4b93d823a53a2  util-macros-1.19.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-February/003324.html
+sha256  0b86b262dbe971edb4ff233bc370dfad9f241d09f078a3f6d5b7f4b8ea4430db  util-macros-1.20.0.tar.xz
+sha512  76caefb118bf1675d7b2b96e1bbb04eb9a320b02e120839e55a22ef98538ecf00d0e686a67186fc8fdc8492d277ffe3125ae8b7ac61ce4739edc0de3f468d2eb  util-macros-1.20.0.tar.xz
 # Locally computed
-sha256  489b630a75e3255485732eae3d50ff4d29d3feb66760bb3acb04f897e4d9e375  COPYING
+sha256  7db0516389152a90c20ea910e8839d10204ebc25ccbc71fc7f5809dfb98e80ac  COPYING
diff --git a/package/xutil_util-macros/xutil_util-macros.mk b/package/xutil_util-macros/xutil_util-macros.mk
index b0ce14ee5a..e2e40eb84e 100644
--- a/package/xutil_util-macros/xutil_util-macros.mk
+++ b/package/xutil_util-macros/xutil_util-macros.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.19.3
-XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
-XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
+XUTIL_UTIL_MACROS_VERSION = 1.20.0
+XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.xz
+XUTIL_UTIL_MACROS_SITE = https://xorg.freedesktop.org/archive/individual/util
 XUTIL_UTIL_MACROS_LICENSE = MIT
 XUTIL_UTIL_MACROS_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
