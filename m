Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0F8C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF634ED99;
	Mon, 20 Feb 2023 22:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF634ED99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6GDeySIQcgU; Mon, 20 Feb 2023 22:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F9A4998D;
	Mon, 20 Feb 2023 22:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F9A4998D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8296B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3444561147
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3444561147
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8M4YifS1SCG for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6174961126
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6174961126
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59D65828C8; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4649c06bff7e30bdbd7a3ebab59c578f09d67172
X-Git-Newrev: 4b1ff446fb74b910ff9005b8725e962a626ef11a
X-Patchwork-Hint: ignore
Message-Id: <20230220205159.59D65828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xlib_libFS: bump
 version to 1.0.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b1ff446fb74b910ff9005b8725e962a626ef11a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-August/003200.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libFS/xlib_libFS.hash | 8 +++-----
 package/x11r7/xlib_libFS/xlib_libFS.mk   | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xlib_libFS/xlib_libFS.hash b/package/x11r7/xlib_libFS/xlib_libFS.hash
index 50cb94dd3a..6ca152ac4a 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.hash
+++ b/package/x11r7/xlib_libFS/xlib_libFS.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-March/002970.html
-md5  4e1196275aa743d6ebd3d3d5ec1dff9c  libFS-1.0.8.tar.bz2
-sha1  70173cc15a7a55defb7b22b00a9387901acad634  libFS-1.0.8.tar.bz2
-sha256  c8e13727149b2ddfe40912027459b2522042e3844c5cd228c3300fe5eef6bd0f  libFS-1.0.8.tar.bz2
-sha512  466198ae5c0b83e3579713d86ddfd0b039f5c5b511cf6d5dc0e9664ee2d40aec9e8929445c8e97394d85faf76a7cf2f81bddb13d23de7ce19919e3b1e36ba56f  libFS-1.0.8.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-August/003200.html
+sha256  597379438b3242ccc7d7b0fc432dc6c844eca0d4a82a7b82518bfeb203fc208a  libFS-1.0.9.tar.xz
+sha512  7d012e62736c6d567931bad982eec221199d296f0fe41e1e7fde5575b8b928e9a8c644aa8746242bdfe72393635320b58774d9a519285765bd26d633588092b8  libFS-1.0.9.tar.xz
 # Locally computed
 sha256  5386724e7475b89394dd836b954a6688f875efab99e43e8eb7e8775f5b99a341  COPYING
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 9d9aecb74f..0fbf453ca4 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBFS_VERSION = 1.0.8
-XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.bz2
-XLIB_LIBFS_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBFS_VERSION = 1.0.9
+XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.xz
+XLIB_LIBFS_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBFS_LICENSE = MIT
 XLIB_LIBFS_LICENSE_FILES = COPYING
 XLIB_LIBFS_CPE_ID_VENDOR = x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
