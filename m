Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F18C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87A2640C95;
	Sun, 24 Jul 2022 19:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87A2640C95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngTDGB4MOCN4; Sun, 24 Jul 2022 19:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C22540C84;
	Sun, 24 Jul 2022 19:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C22540C84
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 150281BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8C7383F1B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8C7383F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLJilbWCBuVs for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3E1383EB6
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3E1383EB6
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 311BC85CC8; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 736fe39c022ecb2da07045beb84e31ced608e607
X-Git-Newrev: 5b766e6abec4c1368836225fa4cf4ea8663fde96
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.311BC85CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xwud: bump version to
 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b766e6abec4c1368836225fa4cf4ea8663fde96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xwud/xapp_xwud.hash | 10 ++++------
 package/x11r7/xapp_xwud/xapp_xwud.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xwud/xapp_xwud.hash b/package/x11r7/xapp_xwud/xapp_xwud.hash
index e42057819d..c895b98b23 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.hash
+++ b/package/x11r7/xapp_xwud/xapp_xwud.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002878.html
-md5 79972093bb0766fcd0223b2bd6d11932  xwud-1.0.5.tar.bz2
-sha1 a85d84a1b81f8e667ea6ac126d447590c93eb079  xwud-1.0.5.tar.bz2
-sha256 99997051f8a892313f22edf41dab45864e86e7062ee9012d5dbb6a40fc6b10a9  xwud-1.0.5.tar.bz2
-sha512 27a0ce7481978ae6cd94b0d94374af72185e270d68f2496620e148bb00945427c4827138d9efc48745e6382e3da3390ed0cdff7dbd02dcf9706e8ecccae97184  xwud-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003179.html
+sha256  64048cd15eba3cd9a3d2e3280650391259ebf6b529f2101d1a20f441038c1afe  xwud-1.0.6.tar.xz
+sha512  a7b964d9ef13e4726b2ef84dcc1040cdf510c8031c3e6e1dc1c711e65d9e56f1fc5921a7af3dbbd898b861c79e9da6242da23c2e73816e39152ae719052293e9  xwud-1.0.6.tar.xz
 # Locally computed
-sha256 be3db9aa060c462490a8c1ed44a4d059b32bba359f4688b1ecf3f794d363539e COPYING
+sha256  be3db9aa060c462490a8c1ed44a4d059b32bba359f4688b1ecf3f794d363539e COPYING
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 2c2e1ad497..0ad001d970 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XWUD_VERSION = 1.0.5
-XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.bz2
-XAPP_XWUD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XWUD_VERSION = 1.0.6
+XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.xz
+XAPP_XWUD_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XWUD_LICENSE = MIT
 XAPP_XWUD_LICENSE_FILES = COPYING
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
