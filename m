Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70416C04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 130B441A6F;
	Fri,  9 Dec 2022 17:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 130B441A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MB8PSVscRYgF; Fri,  9 Dec 2022 17:02:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B97A41B36;
	Fri,  9 Dec 2022 17:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B97A41B36
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3488D1BF976
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B782041B4F
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B782041B4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6EU9j5yoBz2 for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E17AE41A55
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E17AE41A55
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C899485EA1; Fri,  9 Dec 2022 17:01:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8ae5b86edcf172d824982c0740c5099ea087697
X-Git-Newrev: 79a72dd0a5c8563533f75914d276022c401b3ffa
X-Patchwork-Hint: ignore
Message-Id: <20221209170102.C899485EA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libxshmfence: bump
 version to 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=79a72dd0a5c8563533f75914d276022c401b3ffa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003287.html
https://lists.x.org/archives/xorg-announce/2022-October/003229.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash | 8 +++-----
 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
index 3ec055a792..e8f83d427f 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-February/002840.html
-md5  42dda8016943dc12aff2c03a036e0937  libxshmfence-1.3.tar.bz2
-sha1  3472218fc0e8ee8183533d22dbcd4bbe90bf3ab8  libxshmfence-1.3.tar.bz2
-sha256  b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7  libxshmfence-1.3.tar.bz2
-sha512  c446e055f8fac62b9aa266132289a4cfc030282147974c45ce96d1768a98d1afb997470e58e4a68513174c404cbf373bdde2f0cd4b34abdbce1d89dd0b6fe2b7  libxshmfence-1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003287.html
+sha256  870df257bc40b126d91b5a8f1da6ca8a524555268c50b59c0acd1a27f361606f  libxshmfence-1.3.2.tar.xz
+sha512  e20a6827e370726cf50489a69f4a52b897f1c44e3eba8c72a4e626b08724e877d090770b8016765736d887d5d5eaba1fda9c29066e62d259b4d1e2064bc1626c  libxshmfence-1.3.2.tar.xz
 # Locally computed
 sha256  64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index 605408fff7..4241102855 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBXSHMFENCE_VERSION = 1.3
-XLIB_LIBXSHMFENCE_SOURCE = libxshmfence-$(XLIB_LIBXSHMFENCE_VERSION).tar.bz2
+XLIB_LIBXSHMFENCE_VERSION = 1.3.2
+XLIB_LIBXSHMFENCE_SOURCE = libxshmfence-$(XLIB_LIBXSHMFENCE_VERSION).tar.xz
 XLIB_LIBXSHMFENCE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSHMFENCE_LICENSE = MIT
 XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
