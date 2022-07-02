Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB48AC43334
	for <buildroot@archiver.kernel.org>; Sat,  2 Jul 2022 13:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93AA6405AB;
	Sat,  2 Jul 2022 13:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93AA6405AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ea3K01r1tpFb; Sat,  2 Jul 2022 13:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C815409E7;
	Sat,  2 Jul 2022 13:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C815409E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0235B1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 737A081B3E
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 737A081B3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GtjeK6jK_LPv for <buildroot@lists.busybox.net>;
 Sat,  2 Jul 2022 13:52:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7948481BC6
 for <buildroot@buildroot.org>; Sat,  2 Jul 2022 13:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7948481BC6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 700488788B; Sat,  2 Jul 2022 13:39:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Jul 2022 15:50:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7186fdb51f8219fc9ec0965c05cbfdbddf6ed033
X-Git-Newrev: bf46a455bf56084fb06cd41ea6558296481cba9d
X-Patchwork-Hint: ignore
Message-Id: <20220702133939.700488788B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: bump to version 10.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf46a455bf56084fb06cd41ea6558296481cba9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.hash | 10 +++++-----
 package/weston/weston.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index b78a7c7550..951d62a100 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-February/042103.html
-md5  bc4abe2ee6904a4890a0c641c6257f91  weston-10.0.0.tar.xz
-sha1  b1a51e3bb7ee1d75bbf728c8071771e07fc97fdd  weston-10.0.0.tar.xz
-sha256  5c23964112b90238bed39e5dd1e41cd71a79398813cdc3bbb15a9fdc94e547ae  weston-10.0.0.tar.xz
-sha512  77e05530751e4f743eebf015ab5b78a1fcc66b774713b5e296cfffc488be84e459f811c85ac4280b7b63eebf4ff5c958dd7306376ab343e6b80feae16c8c35a4  weston-10.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2022-June/042260.html
+md5  dac91aecc97a85bf9664dec0d5c90ae3  weston-10.0.1.tar.xz
+sha1  87cc339503f01317a0ca8d986b1b211c8aae99bb  weston-10.0.1.tar.xz
+sha256  8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115  weston-10.0.1.tar.xz
+sha512  688d843096a95b463161b98e85ca3443b31ba2ee49fc8d456a2780cc96f576e9d097054e9f361997a66e9cc8373cf29e406a742dae3884b3b50b26acf1710c8c  weston-10.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 90cf160688..76df9bf2dd 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WESTON_VERSION = 10.0.0
-WESTON_SITE = https://wayland.freedesktop.org/releases
+WESTON_VERSION = 10.0.1
+WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
