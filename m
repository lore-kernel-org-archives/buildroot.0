Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A26C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:59:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D0BD6101E
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D0BD6101E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73D8380D52;
	Sun, 12 Sep 2021 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z7VfR7lZFGYj; Sun, 12 Sep 2021 19:59:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4E0480D4C;
	Sun, 12 Sep 2021 19:59:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED7FA1BF95A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD61760736
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbW5Bn7kvnvI for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:58:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F035D60030
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F0D648A425; Sun, 12 Sep 2021 19:57:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 20:40:17 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 307613451a87b3b68575febeaae04ba76d9464a8
X-Git-Newrev: 30bfbdd51dda70457de2412aec75c3e75f6490b8
X-Patchwork-Hint: ignore
Message-Id: <20210912195705.F0D648A425@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/x11r7/xapp_xrdb:
 bump version to 1.2.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=30bfbdd51dda70457de2412aec75c3e75f6490b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2021-August/003107.html

Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0476b4f2fad9077008cc5cb8a45296b0da3ebb30)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xrdb/xapp_xrdb.hash | 10 ++++------
 package/x11r7/xapp_xrdb/xapp_xrdb.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.hash b/package/x11r7/xapp_xrdb/xapp_xrdb.hash
index b8a6896ca7..606fd26060 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.hash
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002953.html
-md5 34ae801ef994d192c70fcce2bdb2a1b2  xrdb-1.2.0.tar.bz2
-sha1 79596928246288a217abdec0e4a2315ec9b07963  xrdb-1.2.0.tar.bz2
-sha256 f23a65cfa1f7126040d68b6cf1e4567523edac10f8dc06f23d840d330c7c6946  xrdb-1.2.0.tar.bz2
-sha512 14e1cdfb2152fb28f1f4641b177ab236648d7e967a95b952bf4cfce8d3e1ef085e85385354e3381aaf644462e8888a1847f755ab4016ecb4cb4a715b001dd2ef  xrdb-1.2.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-August/003107.html
+sha256  4f5d031c214ffb88a42ae7528492abde1178f5146351ceb3c05f3b8d5abee8b4  xrdb-1.2.1.tar.bz2
+sha512  d88135cdfea8536523dfb986249ee42761d5363c936352f12f55b4d0c849f21236f7d74d39869c5ec5b549019d6ed89d9096cde4b3c2b4816c2778a8e370b5c9  xrdb-1.2.1.tar.bz2
 # Locally computed
-sha256 ca1b3e2f9f37c35876b69a9c1c5a7860fae59b7ba87a1d2dc541b722e29b1ecc COPYING
+sha256  ca1b3e2f9f37c35876b69a9c1c5a7860fae59b7ba87a1d2dc541b722e29b1ecc  COPYING
diff --git a/package/x11r7/xapp_xrdb/xapp_xrdb.mk b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
index b445805d17..4f9860d25a 100644
--- a/package/x11r7/xapp_xrdb/xapp_xrdb.mk
+++ b/package/x11r7/xapp_xrdb/xapp_xrdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XRDB_VERSION = 1.2.0
+XAPP_XRDB_VERSION = 1.2.1
 XAPP_XRDB_SOURCE = xrdb-$(XAPP_XRDB_VERSION).tar.bz2
-XAPP_XRDB_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XRDB_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XRDB_LICENSE = MIT
 XAPP_XRDB_LICENSE_FILES = COPYING
 XAPP_XRDB_DEPENDENCIES = xlib_libX11 xlib_libXmu
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
