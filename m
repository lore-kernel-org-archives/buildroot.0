Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2826BC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE4A64ECCE;
	Mon, 20 Feb 2023 21:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE4A64ECCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ho5PR3qsRqdH; Mon, 20 Feb 2023 21:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89B4C4ED15;
	Mon, 20 Feb 2023 21:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89B4C4ED15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C27F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D77FF6112F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D77FF6112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGL-Mg5SzmUz for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF6F561121
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF6F561121
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCC1F8648F; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 59d64c57c755338306e9eddc9ff98a948ef79694
X-Git-Newrev: 671c130b0cc0eee99665554e52af7fad5f99500e
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.CCC1F8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libX11:
 bump version to 1.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=671c130b0cc0eee99665554e52af7fad5f99500e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update license hash due to upstream commits
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/a04b84f0f7bb3a78088756759f4b9b8bb363251e
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/a35d706cd8dc7b498bca2a3fc4a3732047439ed7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 8 ++++----
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index 5a8f639165..4f5027d62d 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-June/003168.html
-sha256  1bc41aa1bbe01401f330d76dfa19f386b79c51881c7bbfee9eb4e27f22f2d9f7  libX11-1.8.1.tar.xz
-sha512  2e36d2c47519e0cb2697f588c0ccdf73fbe75c2163f0855c78f7052dc9e920bca081f9d5e39c707a14067f101faef74fc758c8862eeba675b1535b43119d533a  libX11-1.8.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-November/003253.html
+sha256  ed91d573d570db83b8ae546f4890dccfcd0b9dfe1e50a1b401b63a74c152ed04  libX11-1.8.2.tar.xz
+sha512  662ee8043d9ba27df82f647515b701d6f302a52715f21afdaba391f3b70691753e3649e7ff8322e07858be4297df9cbb19227958d676ed6dea198cce64330d1d  libX11-1.8.2.tar.xz
 # Locally computed
-sha256  2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
+sha256  2e7012a140f000735a7172674a2d314398d79622444fba65d108b029b29ab283  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 9ed9f1ddb3..26d4b4d306 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.8.1
+XLIB_LIBX11_VERSION = 1.8.2
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.xz
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
