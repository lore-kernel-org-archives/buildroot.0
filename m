Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6791C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86C8E61190;
	Sun, 24 Jul 2022 19:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86C8E61190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xs7rTJg017nC; Sun, 24 Jul 2022 19:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87DDB60C0F;
	Sun, 24 Jul 2022 19:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87DDB60C0F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F047A1BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7342405D0
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7342405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lEEksvX4g4OS for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D287A40441
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D287A40441
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0C79285CC9; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce1e020f60e4e930e245df30260409941526847f
X-Git-Newrev: b460f31f3e54f06d7edf1fdb8fdf758e5eca3c40
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.0C79285CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xfontsel: bump version
 to 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b460f31f3e54f06d7edf1fdb8fdf758e5eca3c40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xfontsel/xapp_xfontsel.hash | 10 ++++------
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash b/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
index a09df5585b..8d7e546bba 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002861.html
-md5 13150ff98846bf6d9a14bee00697fa47  xfontsel-1.0.6.tar.bz2
-sha1 3fd8d78cc270030b41298170c3e5222065dd1cfd  xfontsel-1.0.6.tar.bz2
-sha256 25aa0b7c4262f5e99c07c2b96e00e4eb25b7e53f94fa803942af9d0e8da3001c  xfontsel-1.0.6.tar.bz2
-sha512 2f6bc51549a302404cdaf9a5a825add383953fcbb2a0c7076691cefd4dd7e4a3c772c047be74101c8486f75d03ce0bd3e65ede14e91732cf2a932810441c9099  xfontsel-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003174.html
+sha256  17052c3357bbfe44b8468675ae3d099c2427ba9fcac10540aef524ae4d77d1b4  xfontsel-1.1.0.tar.xz
+sha512  be67d223668431c9b5dd2ef74032d2f087be5f8f0ccc427bc7ee43e7ce42214edddb07d8c3d6d6de93ea35314392d384f1ab1ae5c48b2cfbce418610e3945a52  xfontsel-1.1.0.tar.xz
 # Locally computed
-sha256 a27097bcc5cdf4fa5d761dd4e5cea1f41911c51b0a7d9da6e3a48f69d9fd0c09 COPYING
+sha256  a27097bcc5cdf4fa5d761dd4e5cea1f41911c51b0a7d9da6e3a48f69d9fd0c09  COPYING
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index 9dea4299b3..ac12f9c509 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFONTSEL_VERSION = 1.0.6
-XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.bz2
-XAPP_XFONTSEL_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XFONTSEL_VERSION = 1.1.0
+XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.xz
+XAPP_XFONTSEL_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XFONTSEL_LICENSE = MIT
 XAPP_XFONTSEL_LICENSE_FILES = COPYING
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
