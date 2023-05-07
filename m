Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DDFC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B11A982201;
	Sun,  7 May 2023 12:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B11A982201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bF1i7rcAQhg6; Sun,  7 May 2023 12:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9068C821C5;
	Sun,  7 May 2023 12:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9068C821C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5611BF863
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BA8A60E07
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BA8A60E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gC9tI1E-coE3 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8154560BCA
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8154560BCA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F86585EEE; Sun,  7 May 2023 12:04:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:10:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33916e184b1e6efa9221c66707132d9b997eb98b
X-Git-Newrev: 770c9baa3ebc56ef0633948ecc0ccceb12b7825c
X-Patchwork-Hint: ignore
Message-Id: <20230507120438.6F86585EEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xdpyinfo: bump version
 to 1.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=770c9baa3ebc56ef0633948ecc0ccceb12b7825c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-April/003388.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash | 6 +++---
 package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
index 07a3eb936c..b0afdc15ac 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003157.html
-sha256  356d5fd62f3e98ee36d6becf1b32d4ab6112d618339fb4b592ccffbd9e0fc206  xdpyinfo-1.3.3.tar.xz
-sha512  47fe0821bc64145876853712ebd7c0af80111c243813615b892429021cc9a53abd38c4684551ae300cb5a4eacdd3d26e2c93e789ed91a948b20e2c37cd2d2442  xdpyinfo-1.3.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-April/003388.html
+sha256  a8ada581dbd7266440d7c3794fa89edf6b99b8857fc2e8c31042684f3af4822b  xdpyinfo-1.3.4.tar.xz
+sha512  9ef9f5c10e15a40895e8f008896b960fdd438277657c7159d16f05db79cd2374cfaca4af2f4e59335824bfd2f74a045ef89dd99ea4130ed436ea59fbbb1cbe12  xdpyinfo-1.3.4.tar.xz
 # Locally computed
 sha256  49733ead65fdfa1da0d176f9b965cc08dae74d73d66c9606488d52f6fc036abf  COPYING
diff --git a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
index c5e2a857e3..a198fc44c3 100644
--- a/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
+++ b/package/x11r7/xapp_xdpyinfo/xapp_xdpyinfo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XDPYINFO_VERSION = 1.3.3
+XAPP_XDPYINFO_VERSION = 1.3.4
 XAPP_XDPYINFO_SOURCE = xdpyinfo-$(XAPP_XDPYINFO_VERSION).tar.xz
-XAPP_XDPYINFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDPYINFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDPYINFO_LICENSE = MIT
 XAPP_XDPYINFO_LICENSE_FILES = COPYING
 XAPP_XDPYINFO_CONF_OPTS = --without-xf86misc # not in BR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
