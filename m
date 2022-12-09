Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BEAC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D8004ECF4;
	Mon, 20 Feb 2023 21:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D8004ECF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1h-kbG75rceM; Mon, 20 Feb 2023 21:57:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59424571A;
	Mon, 20 Feb 2023 21:57:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B59424571A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44A5A1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A1AF61121
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A1AF61121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkSJk7tH9Mgp for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ABFB6110B
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ABFB6110B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BF5E8648F; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:34:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1261e78ee2a7994f0cf764c0a61d457984daf673
X-Git-Newrev: f28be9b1fd93a3852d4db00041588d52e171638f
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.1BF5E8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libXext:
 bump version to 1.3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=f28be9b1fd93a3852d4db00041588d52e171638f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003241.html

Updated license hash due to upstream commits
https://gitlab.freedesktop.org/xorg/lib/libxext/-/commit/81a3d082b1c73393a59131aa57fe32bb0d76e149
https://gitlab.freedesktop.org/xorg/lib/libxext/-/commit/b6929c143e8372eb6838a331942d34a8d2b13b7b

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libXext/xlib_libXext.hash | 10 ++++------
 package/x11r7/xlib_libXext/xlib_libXext.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xlib_libXext/xlib_libXext.hash b/package/x11r7/xlib_libXext/xlib_libXext.hash
index e6b41a3dba..2ab509598b 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.hash
+++ b/package/x11r7/xlib_libXext/xlib_libXext.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002975.html
-md5  f5b48bb76ba327cd2a8dc7a383532a95  libXext-1.3.4.tar.bz2
-sha1  14e2451162e8766173b5b14c73e94a22b1fcab55  libXext-1.3.4.tar.bz2
-sha256  59ad6fcce98deaecc14d39a672cf218ca37aba617c9a0f691cac3bcd28edf82b  libXext-1.3.4.tar.bz2
-sha512  09146397d95f80c04701be1cc0a9c580ab5a085842ac31d17dfb6d4c2e42b4253b89cba695e54444e520be359883a76ffd02f42484c9e2ba2c33a5a40c29df4a  libXext-1.3.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003241.html
+sha256  db14c0c895c57ea33a8559de8cb2b93dc76c42ea4a39e294d175938a133d7bca  libXext-1.3.5.tar.xz
+sha512  fd9805982dabfb14b1526c0cb71f94508003fa3fcd60560d387465afd891c1dca61927ae86278436d53f4b840cacd1f412071fdc3dce1d6f730610a9c163d59b  libXext-1.3.5.tar.xz
 # Locally computed
-sha256  80767ac915f2f0f94de9efb15f0197a59b6f1e609cae85059f8703272dc3e146  COPYING
+sha256  fd62910be4b13829d94e76c1447cf840953f0e225c4dc6c79349c84dd0557f22  COPYING
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 6002e59e0d..0bb3efa31f 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXEXT_VERSION = 1.3.4
-XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.bz2
-XLIB_LIBXEXT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXEXT_VERSION = 1.3.5
+XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.xz
+XLIB_LIBXEXT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXEXT_LICENSE = MIT
 XLIB_LIBXEXT_LICENSE_FILES = COPYING
 XLIB_LIBXEXT_CPE_ID_VENDOR = x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
