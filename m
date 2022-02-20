Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07601C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 19:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD4E44059D;
	Sun, 20 Feb 2022 19:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkWtrg4wa1AP; Sun, 20 Feb 2022 19:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94E140598;
	Sun, 20 Feb 2022 19:36:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C68071BF476
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2828404B2
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUAkJ619dYDK for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 19:36:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B369E40187
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 19:36:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 15E6F82A9D; Sun, 20 Feb 2022 19:29:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 20:36:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca6c2ee3da7be5e4af478e779b49248b89e6514d
X-Git-Newrev: ffeeb7f3d36df58121ec9876432950bb0ac3a5fb
X-Patchwork-Hint: ignore
Message-Id: <20220220192905.15E6F82A9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: security bump to
 version 2.34.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=ffeeb7f3d36df58121ec9876432950bb0ac3a5fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This brings the package two minor releases forward, which provides fixes
for CVE-2022-22589, CVE-2022-22590, CVE-2022-22592, and CVE-2022-22620.
Release notes can be found at:

  https://wpewebkit.org/release/wpewebkit-2.34.5.html
  https://wpewebkit.org/release/wpewebkit-2.34.6.html

The security advisories covering this update are available at:

  https://wpewebkit.org/security/WSA-2022-0002.html
  https://wpewebkit.org/security/WSA-2022-0003.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index b863a0d705..231bbc447d 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.34.4.tar.xz.sums
-md5  b0f7dcb18acfa94cfb42fea0fe10fb0d  wpewebkit-2.34.4.tar.xz
-sha1  de58481b43a6dba054097f619ee486f7889d7a56  wpewebkit-2.34.4.tar.xz
-sha256  3653ba42dbe22a4e6751b3f7cab8d2ebb2db5b7654c5d135a2f9bedf94778cee  wpewebkit-2.34.4.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.34.6.tar.xz.sums
+md5  c9705270b342474cca28cf51632ccbbe  wpewebkit-2.34.6.tar.xz
+sha1  44ae95de1b5ebf0a2b0ea3630b3677153c597402  wpewebkit-2.34.6.tar.xz
+sha256  301e895c8ed08ce7dccef3192b972f2ccfc2020463244c64069a636f2b05265f  wpewebkit-2.34.6.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 8d564d8223..aa04e78623 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.34.4
+WPEWEBKIT_VERSION = 2.34.6
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
