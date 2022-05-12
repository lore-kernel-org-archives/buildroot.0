Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D524BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92CA360B7D;
	Thu, 12 May 2022 19:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhvIAwGALVuZ; Thu, 12 May 2022 19:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1B6E60B8E;
	Thu, 12 May 2022 19:56:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3691D1BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E10F960B30
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViI4TpEFwDnT for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D346360B2B
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 223DC85C8A; Thu, 12 May 2022 19:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:49:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 450d8835d922085aae4af56dad46f7213aaaf73a
X-Git-Newrev: 8d04d90b9f917c4376edd646871fe984744f6d04
X-Patchwork-Hint: ignore
Message-Id: <20220512194101.223DC85C8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xedit: bump version to
 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d04d90b9f917c4376edd646871fe984744f6d04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003149.html

Removed sha1 hash, not provided by upstream anymore.
Switched tarball to upstream-provided .xz format.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xedit/xapp_xedit.hash | 6 +++---
 package/x11r7/xapp_xedit/xapp_xedit.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xedit/xapp_xedit.hash b/package/x11r7/xapp_xedit/xapp_xedit.hash
index e521e00821..d550dbc8c6 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.hash
+++ b/package/x11r7/xapp_xedit/xapp_xedit.hash
@@ -1,5 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-February/002535.html
-sha1	f37b5d0f8ec461955f0419dbb1890d8cf63d179d				xedit-1.2.2.tar.bz2
-sha256	69aa42885dfc06332ca22eb01cc7187e49206e6d65b74113a8ee4cc345fc2927	xedit-1.2.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003149.html
+sha256  bdd33afeeca881622e55d2cf28f07b4a98f083d0a2573c0b9048f25bdd62db2f  xedit-1.2.3.tar.xz
+sha512  1089c35ef961e53f74cc7d892960e1ee7f0da17529e3173e7f7764b0eb4ee94d1e068cb177d8502ca55c1dd6808962d4b1427e303adc7e6db80be8828557f45a  xedit-1.2.3.tar.xz
 # Locally computed
 sha256  6d3e4092277ea08fc6b3180dba061120ea53ee965afb84fce16f8ab3d35bb47a  COPYING
diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 1cb99dc6f4..5aae798f05 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XEDIT_VERSION = 1.2.2
-XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
+XAPP_XEDIT_VERSION = 1.2.3
+XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.xz
 XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEDIT_LICENSE = MIT
 XAPP_XEDIT_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
