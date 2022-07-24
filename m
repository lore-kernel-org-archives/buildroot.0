Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDB1C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 19:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D37B8144A;
	Sun, 24 Jul 2022 19:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D37B8144A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCJJAN2w_dUL; Sun, 24 Jul 2022 19:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 318B881420;
	Sun, 24 Jul 2022 19:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318B881420
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5661BF20B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC76D83EE2
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC76D83EE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9Sw-O1KjkMO for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 19:55:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 542D283EFD
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 19:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 542D283EFD
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 83A8185CBF; Sun, 24 Jul 2022 19:41:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 21:44:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9f6c89e7ee9e1103f98c6c712bf5e820f77b550
X-Git-Newrev: 5782272de1f43961a321a6d969f7f93877b8595d
X-Patchwork-Hint: ignore
Message-Id: <20220724194152.83A8185CBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xmag: bump version to
 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=5782272de1f43961a321a6d969f7f93877b8595d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xapp_xmag/xapp_xmag.hash | 5 +++--
 package/x11r7/xapp_xmag/xapp_xmag.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xmag/xapp_xmag.hash b/package/x11r7/xapp_xmag/xapp_xmag.hash
index 55a9d479d0..c0cfbcfa68 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.hash
+++ b/package/x11r7/xapp_xmag/xapp_xmag.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002581.html
-sha256  87a2bc23b251e2d8f8370d3283a4d6c8dac98a30cb5749a04336cdb55c14e161  xmag-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-July/003191.html
+sha256  009936cc5a2706084079127b26cf55c713767650a34cb69e5682d60e33ce7461  xmag-1.0.7.tar.xz
+sha512  d35ac5d977b9f3bd03fb919bf178f68bdbc6ef2a57915b407d836fce0582f5cb78d0b79043bb6f8d015464ca113deb09469c3b724aed03901a4c3fc4a9982984  xmag-1.0.7.tar.xz
 # Locally computed
 sha256  ef8744e617719339c4934579f8558ee4a5aec4396bebd6af02562b63a7c16d27  COPYING
diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index 113c328e2d..0e8831d25b 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XMAG_VERSION = 1.0.6
-XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.bz2
-XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XMAG_VERSION = 1.0.7
+XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.xz
+XAPP_XMAG_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAG_LICENSE = MIT
 XAPP_XMAG_LICENSE_FILES = COPYING
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
