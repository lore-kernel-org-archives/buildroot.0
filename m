Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31850C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F327C40B7E;
	Tue,  7 Jun 2022 19:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5277yLRFqNb; Tue,  7 Jun 2022 19:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A6B640640;
	Tue,  7 Jun 2022 19:37:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 103741BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78A484064D
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ko-1Ve6tHpsD for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5453F40B59
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 53EDF86E21; Tue,  7 Jun 2022 19:05:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 22:36:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62d9c9687818ebc68437cf984aedba02014fcda7
X-Git-Newrev: 209a0d691909fd50aee9629b5b55ba83dc3edc0e
X-Patchwork-Hint: ignore
Message-Id: <20220607190500.53EDF86E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/x11r7/xdriver_xf86-video-openchrome: bump version to 0.6.225
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
From: "Arnout Vandecappelle \(Essensium/Mind\) via buildroot"
 <buildroot@buildroot.org>
Reply-To: "Arnout Vandecappelle \(Essensium/Mind\)" <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=209a0d691909fd50aee9629b5b55ba83dc3edc0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash    | 2 +-
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
index 8c1c5ac91b..d8cc080a32 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  05beeaff42ffbe41f37dbed0d6fe94d1829a9dd847cdab4068d107cfc485a62b  xdriver_xf86-video-openchrome-5e158c76eb3a0fb0db207229697139f8da2faaae-br1.tar.gz
+sha256  037bebbe31bcca2b4f3adeefccd2a64a30e2924946a6c6646c5829f7362212ec  xdriver_xf86-video-openchrome-ab03de703b91c7e0fd3e4d1ca06ad5add7f077a1-br1.tar.gz
 sha256  1fde58bce5cff8c32e9a0a80bfa3e60213a2767954e30a367127d5afa2884ca2  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 0e04f59466..e8001004bc 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 5e158c76eb3a0fb0db207229697139f8da2faaae
+XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = ab03de703b91c7e0fd3e4d1ca06ad5add7f077a1
 XDRIVER_XF86_VIDEO_OPENCHROME_SITE = https://anongit.freedesktop.org/git/openchrome/xf86-video-openchrome.git
 XDRIVER_XF86_VIDEO_OPENCHROME_SITE_METHOD = git
 XDRIVER_XF86_VIDEO_OPENCHROME_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
