Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA6CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AAD683EB6;
	Sun, 24 Jul 2022 19:57:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AAD683EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7eytvisjzzL; Sun, 24 Jul 2022 19:57:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DE1583EB5;
	Sun, 24 Jul 2022 19:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DE1583EB5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ECA01BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E056040441
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E056040441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YcXlvN3u_yJF for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB7D740477
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB7D740477
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2850D85CC6; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62a033a2ad5dbafd002eedbc22b0945140cb2cc9
X-Git-Newrev: 736fe39c022ecb2da07045beb84e31ced608e607
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.2850D85CC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xpr: bump version to
 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=736fe39c022ecb2da07045beb84e31ced608e607
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xpr/xapp_xpr.hash | 10 ++++------
 package/x11r7/xapp_xpr/xapp_xpr.mk   |  6 +++---
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/package/x11r7/xapp_xpr/xapp_xpr.hash b/package/x11r7/xapp_xpr/xapp_xpr.hash
index 0a1b4f81b9..841fddd08b 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.hash
+++ b/package/x11r7/xapp_xpr/xapp_xpr.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002869.html
-md5 eaac255076ea351fd08d76025788d9f9  xpr-1.0.5.tar.bz2
-sha1 0632c7d8632ac9d23f285811aaea805a2956e155  xpr-1.0.5.tar.bz2
-sha256 b936e0f1f8d63f5ad097a0bbdce2e67c34f5d49b7263f32a832ff62d394d1e1f  xpr-1.0.5.tar.bz2
-sha512 d5dfb936ec4ad0067d02654dec8e862fe337ff6a2c2f974b2b3a612a829c2e728a0d51e7aba00ed2a94dc96dc50cc69f2c59f522e0635013f5f4f5bb3f4ab967  xpr-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003177.html
+sha256  a0bbb11475366622632440b1c6f16d19964b4516483232fe5f46c169528557c5  xpr-1.1.0.tar.xz
+sha512  53eb896cf1844036a13b1018ffcecbc6a0a56eebe0d7cb6331dbe691207498d2c41f3791655b7fc081acfef2ed9904987f363b710bf0eeff6c8d33f819a951cb  xpr-1.1.0.tar.xz
 # Locally computed
-sha256 5e8ff9b5d3fc86b5d0bc5957c9ee0aa1a6d0fb9a6b116aae70762b628a0d5069 COPYING
+sha256  5e8ff9b5d3fc86b5d0bc5957c9ee0aa1a6d0fb9a6b116aae70762b628a0d5069 COPYING
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index b77c5b4844..4db4cd3309 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XPR_VERSION = 1.0.5
-XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
-XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XPR_VERSION = 1.1.0
+XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.xz
+XAPP_XPR_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XPR_LICENSE = MIT
 XAPP_XPR_LICENSE_FILES = COPYING
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
