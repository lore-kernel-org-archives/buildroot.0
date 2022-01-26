Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E872C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D7B060FF3;
	Wed, 26 Jan 2022 21:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fssq2CUufRte; Wed, 26 Jan 2022 21:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CACC760FF1;
	Wed, 26 Jan 2022 21:55:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 479451BF4D6
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3248160FF1
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i82c59u4CAVf for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:55:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CED960FEF
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EE9368276B; Wed, 26 Jan 2022 21:48:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:44:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 436983e0a3c075c2d8ea417c61e58b295323d15b
X-Git-Newrev: b2c5bf66aceb795fbeb8e275f2df08788af1a864
X-Patchwork-Hint: ignore
Message-Id: <20220126214843.EE9368276B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: security bump to
 version 2.34.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2c5bf66aceb795fbeb8e275f2df08788af1a864
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which provides fixes for CVE-2021-30934,
CVE-2021-30936, CVE-2021-30951, CVE-2021-30952, CVE-2021-30953,
CVE-2021-30954, CVE-2021-30984, and the safarileaks.com vulnerability
(which has not yet been assigned a CVE number). Release notes can be
found at:

  https://wpewebkit.org/release/wpewebkit-2.34.4.html

An accompanying security advisory has been published at:

  https://wpewebkit.org/security/WSA-2022-0001.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 52652b72ae..b863a0d705 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.34.3.tar.xz.sums
-md5  f8eb92825bf6477fb04ca017926c2458  wpewebkit-2.34.3.tar.xz
-sha1  a72f507dfd6d4d579b2e6c939d7c171c2cfb1d92  wpewebkit-2.34.3.tar.xz
-sha256  c35de4bfce35c81cbd6c1da27879b4ea33e20bd51d750ce296a4d100d45f40fc  wpewebkit-2.34.3.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.34.4.tar.xz.sums
+md5  b0f7dcb18acfa94cfb42fea0fe10fb0d  wpewebkit-2.34.4.tar.xz
+sha1  de58481b43a6dba054097f619ee486f7889d7a56  wpewebkit-2.34.4.tar.xz
+sha256  3653ba42dbe22a4e6751b3f7cab8d2ebb2db5b7654c5d135a2f9bedf94778cee  wpewebkit-2.34.4.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 64c179534f..8d564d8223 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.34.3
+WPEWEBKIT_VERSION = 2.34.4
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
