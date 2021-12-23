Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8BCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 17:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 591AF4169D;
	Thu, 23 Dec 2021 17:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48RuvmK-aTVe; Thu, 23 Dec 2021 17:38:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 131D741691;
	Thu, 23 Dec 2021 17:38:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8A891BF2E5
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C424940A9A
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJ09Qf-wqzTW for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 17:38:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD99F400D8
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 17:38:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5FBE681934; Thu, 23 Dec 2021 17:32:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 23 Dec 2021 18:37:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdc3f6888f669919bf8820be1eb75340b48ee7e1
X-Git-Newrev: b9d7644c53a501a6abf15c5a9c7ff7eedd4f60c7
X-Patchwork-Hint: ignore
Message-Id: <20211223173238.5FBE681934@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: security bump to
 version 2.34.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9d7644c53a501a6abf15c5a9c7ff7eedd4f60c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which provides fixes for CVE-2021-30887
and CVE-2021-30890. Full release notes can be found at:

  https://wpewebkit.org/release/wpewebkit-2.34.3.html

An accompanying security advisory has been published at:

  https://wpewebkit.org/security/WSA-2021-0007.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index a71c1afc72..52652b72ae 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.34.2.tar.xz.sums
-md5  b26f07bc809d9fd3e54e815c22312f15  wpewebkit-2.34.2.tar.xz
-sha1  4200ef87a4e1eb1921f0f40779742381598e1429  wpewebkit-2.34.2.tar.xz
-sha256  b1a3733c2d486c4da27f9636ccc39947da7d84258cd7a24a6fb0b842c9595c0b  wpewebkit-2.34.2.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.34.3.tar.xz.sums
+md5  f8eb92825bf6477fb04ca017926c2458  wpewebkit-2.34.3.tar.xz
+sha1  a72f507dfd6d4d579b2e6c939d7c171c2cfb1d92  wpewebkit-2.34.3.tar.xz
+sha256  c35de4bfce35c81cbd6c1da27879b4ea33e20bd51d750ce296a4d100d45f40fc  wpewebkit-2.34.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index d936b342bf..64c179534f 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.34.2
+WPEWEBKIT_VERSION = 2.34.3
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
