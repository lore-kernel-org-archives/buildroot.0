Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48C9EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 11:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EE6081E1E;
	Mon, 17 Jul 2023 11:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE6081E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dim4gmvGEA5z; Mon, 17 Jul 2023 11:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D97CC81E4F;
	Mon, 17 Jul 2023 11:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D97CC81E4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07CC51BF352
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2D6640142
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D6640142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plkHD57-iK9t for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 11:09:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AA3440108
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 11:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AA3440108
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 487048714B; Mon, 17 Jul 2023 11:09:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 12:56:22 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: eaada7c96bb26bf60aea96a4e45bfdd318bb7bf6
X-Git-Newrev: 62aac0da49efa958aa4f8bed102de7f8b0e5a28a
X-Patchwork-Hint: ignore
Message-Id: <20230717110913.487048714B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/taglib: bump to
 version 1.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=62aac0da49efa958aa4f8bed102de7f8b0e5a28a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Release notes:
https://mail.kde.org/pipermail/taglib-devel/2023-July/003066.html

Changelog:
https://taglib.org/#taglib-1131-release---jul-1-2023

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 261c5894b0a83f738322daa0de96cd668e1f2f9a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/taglib/taglib.hash | 2 +-
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index 7d1b2e8422..e83aa451f3 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  58f08b4db3dc31ed152c04896ee9172d22052bc7ef12888028c01d8b1d60ade0  taglib-1.13.tar.gz
+sha256  c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b  taglib-1.13.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index c687891002..9bdf05b85d 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.13
+TAGLIB_VERSION = 1.13.1
 TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
