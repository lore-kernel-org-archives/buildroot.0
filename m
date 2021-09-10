Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96BEDC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:53:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C79460F6D
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C79460F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFCCB40210;
	Fri, 10 Sep 2021 17:53:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XQTXq-QFmweV; Fri, 10 Sep 2021 17:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3934401F3;
	Fri, 10 Sep 2021 17:53:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6E261BF9C8
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A75AD83E78
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glsZBiU4qutm for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 17:53:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF93283E74
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 17:53:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CDB6E88E42; Fri, 10 Sep 2021 17:51:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 19:53:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0f683d35cc6e50ded3ebaa7b5a717a3a5c528e4
X-Git-Newrev: c47ebe7aeb70015614ff1d477dc1a71e8c161425
X-Patchwork-Hint: ignore
Message-Id: <20210910175156.CDB6E88E42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xeyes: bump version to
 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c47ebe7aeb70015614ff1d477dc1a71e8c161425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2021-August/003101.html

Removed md5 and sha1 hashes, reformatted hashes, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xeyes/xapp_xeyes.hash | 10 ++++------
 package/x11r7/xapp_xeyes/xapp_xeyes.mk   |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.hash b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
index bbb6a9b08b..734492b6cd 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.hash
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002860.html
-md5 6f0543ec84283df5743eeafc173bea4a  xeyes-1.1.2.tar.bz2
-sha1 458987f8accdbd8abf993ee51030391cf584d2e8  xeyes-1.1.2.tar.bz2
-sha256 57bcec0d2d167af9e5d44d0dbd74c6d7c0f0591cd0608952b23c749fdd910553  xeyes-1.1.2.tar.bz2
-sha512 008d76f03ddabd3d86ad9e52a540504553b94cb7a6743b20cf08897549eb27505667365ab9af21956a1b5ec7297acca8903a326536e6195a30e643cd93297ee0  xeyes-1.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-August/003101.html
+sha256  f8a17e23146bef1ab345a1e303c6749e42aaa7bcf4f25428afad41770721b6db  xeyes-1.2.0.tar.bz2
+sha512  2d1614614b3ba3d1ebaa0e9801a2e159389b94aaacafb962d326b7e6dc712c1eb2c12a50ceb10b3135cf0eee6ae86bbf84e73098deb08e73792f14a60616b4d8  xeyes-1.2.0.tar.bz2
 # Locally computed
-sha256 d8de1de40e16227d1eb4b19e95117ce3f990f71f71df096a2259b0bc9931e042 COPYING
+sha256  d8de1de40e16227d1eb4b19e95117ce3f990f71f71df096a2259b0bc9931e042  COPYING
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 6c7f859d35..11eea802d5 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XEYES_VERSION = 1.1.2
+XAPP_XEYES_VERSION = 1.2.0
 XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
-XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XEYES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XEYES_LICENSE = MIT
 XAPP_XEYES_LICENSE_FILES = COPYING
 XAPP_XEYES_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXmu xlib_libXrender xlib_libXt
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
