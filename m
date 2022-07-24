Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1E1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E615760C0F;
	Sun, 24 Jul 2022 19:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E615760C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mt5cuNYVB9V0; Sun, 24 Jul 2022 19:58:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA5D061192;
	Sun, 24 Jul 2022 19:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5D061192
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11F201BF95E
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD34A83F25
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD34A83F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kz2ramUYidWg for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C682E83E65
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C682E83E65
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0085185CC8; Sun, 24 Jul 2022 19:41:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f620f401d3df05e0a7496c6997fe147b406fd25f
X-Git-Newrev: ce1e020f60e4e930e245df30260409941526847f
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.0085185CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xconsole: bump version
 to 1.0.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce1e020f60e4e930e245df30260409941526847f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xconsole/xapp_xconsole.hash | 5 +++--
 package/x11r7/xapp_xconsole/xapp_xconsole.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.hash b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
index 5d6c2ac82f..3966cef5e2 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.hash
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002774.html
-sha256  d1144882df207378381bc83927906559defbf7b83a01d52c50ad44234c5851e0  xconsole-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003173.html
+sha256 7b4a6af068e40e2e6a4521d6f35c9253ec152c287d025fff9cc4c99f2586bba4  xconsole-1.0.8.tar.xz
+sha512 93fd8527abed4faaf0f6a3804ab08dbcb926b0aaf67fd814c003b6b1102e2f643be5362a020c7028ae928925ffd423df6eb456d4ed48cf30a4c5f00a7ce648fa  xconsole-1.0.8.tar.xz
 # Locally computed
 sha256  a29ea5dbcde7ba1695c95949be6303d1ca1de0b7786a38b60f33eccf03506f9d  COPYING
diff --git a/package/x11r7/xapp_xconsole/xapp_xconsole.mk b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
index ddec4cfaa3..57ece56190 100644
--- a/package/x11r7/xapp_xconsole/xapp_xconsole.mk
+++ b/package/x11r7/xapp_xconsole/xapp_xconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCONSOLE_VERSION = 1.0.7
-XAPP_XCONSOLE_SOURCE = xconsole-$(XAPP_XCONSOLE_VERSION).tar.bz2
-XAPP_XCONSOLE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCONSOLE_VERSION = 1.0.8
+XAPP_XCONSOLE_SOURCE = xconsole-$(XAPP_XCONSOLE_VERSION).tar.xz
+XAPP_XCONSOLE_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XCONSOLE_LICENSE = MIT
 XAPP_XCONSOLE_LICENSE_FILES = COPYING
 XAPP_XCONSOLE_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
