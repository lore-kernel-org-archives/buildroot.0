Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2461FC04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3E5482113;
	Fri,  9 Dec 2022 17:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3E5482113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Nhpxi9yhUKW; Fri,  9 Dec 2022 17:02:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBD8D82129;
	Fri,  9 Dec 2022 17:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBD8D82129
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CBCA1BF973
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F16582112
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F16582112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 982aNDYbloS0 for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED2E882113
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED2E882113
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB8D485EA7; Fri,  9 Dec 2022 17:01:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:31:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cfae45da9c35dd5e9a9bd8c42a8fb008d425f35
X-Git-Newrev: 8ce4206c9e8871ed02ccb824d584dfff36bbc719
X-Patchwork-Hint: ignore
Message-Id: <20221209170102.DB8D485EA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libfontenc: bump
 version to 1.1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ce4206c9e8871ed02ccb824d584dfff36bbc719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-December/003285.html
https://lists.x.org/archives/xorg-announce/2022-August/003204.html
https://lists.x.org/archives/xorg-announce/2022-August/003199.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.hash | 8 +++-----
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
index cf09f61c3e..a061ca4a4b 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002956.html
-md5  6447db6a689fb530c218f0f8328c3abc  libfontenc-1.1.4.tar.bz2
-sha1  d4f232b0b07487b984e13422ce4130b61a8b9edb  libfontenc-1.1.4.tar.bz2
-sha256  2cfcce810ddd48f2e5dc658d28c1808e86dcf303eaff16728b9aa3dbc0092079  libfontenc-1.1.4.tar.bz2
-sha512  76fa851d00113241f15fdd5b5bb7e927b8d8b9a82ce3fcb0678b8c7e32cb5e8d898c4bda1d60dafb7748145049d3240627ac34a2360c64e98a7a912ea7c30582  libfontenc-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-December/003285.html
+sha256  c0d36991faee06551ddbaf5d99266e97becdc05edfae87a833c3ff7bf73cfec2  libfontenc-1.1.7.tar.xz
+sha512  fd8578a81090fa938dd75ad9081ab62c6c54fa2535d1c6291afd799ac8dc7c344a43f07cea5cd4433af16df0d926c22e7c169877bc8b13d92584e7dec173d701  libfontenc-1.1.7.tar.xz
 # Locally computed
 sha256  a4dda7a643b517794bfa23dc9605da030055df38ac8a5b9e1905e690975a59c4  COPYING
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index a55b90d680..e12086b125 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XLIB_LIBFONTENC_VERSION = 1.1.4
-XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
+XLIB_LIBFONTENC_VERSION = 1.1.7
+XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.xz
 XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_LICENSE = MIT
 XLIB_LIBFONTENC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
