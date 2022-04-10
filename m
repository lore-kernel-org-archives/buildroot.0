Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21430C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 15:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C41F7404FE;
	Sun, 10 Apr 2022 15:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5Yx5U5m7In9; Sun, 10 Apr 2022 15:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D13CD4017A;
	Sun, 10 Apr 2022 15:09:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D713D1BF869
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA00E827F3
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 15:08:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpsaY21oeAsN for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 15:08:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9359825E8
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 15:08:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2AF2183874; Sun, 10 Apr 2022 14:58:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:53:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e8f0d95a0243cf413ec18903c1cf990b17b4beb
X-Git-Newrev: 7d258f81cd95cf34888565504e6f82717e5e3407
X-Patchwork-Hint: ignore
Message-Id: <20220410145854.2AF2183874@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpewebkit: bump to version 2.36.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d258f81cd95cf34888565504e6f82717e5e3407
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to a new major release which brings in improvements and a few new
features. Release notes:

  https://wpewebkit.org/release/wpewebkit-2.36.0.html

None of the new features need additional dependencies. The build option
USE_SYSTEMD has been renamed to ENABLE_JOURNALD_LOG, though.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wpewebkit/wpewebkit.hash | 8 ++++----
 package/wpewebkit/wpewebkit.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index 231bbc447d..1e1aa62117 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.34.6.tar.xz.sums
-md5  c9705270b342474cca28cf51632ccbbe  wpewebkit-2.34.6.tar.xz
-sha1  44ae95de1b5ebf0a2b0ea3630b3677153c597402  wpewebkit-2.34.6.tar.xz
-sha256  301e895c8ed08ce7dccef3192b972f2ccfc2020463244c64069a636f2b05265f  wpewebkit-2.34.6.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.36.0.tar.xz.sums
+md5  b7b951cd7f6eb4a8585338505ce71234  wpewebkit-2.36.0.tar.xz
+sha1  904629a9ce3a4ab67d47315b008dc3152d504205  wpewebkit-2.36.0.tar.xz
+sha256  096aa9f87d9bfbfc80f558388a86721cdcc508b42ddef10bd270aec9aee96d5a  wpewebkit-2.36.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index aa04e78623..3ce38d8c27 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.34.6
+WPEWEBKIT_VERSION = 2.36.0
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
@@ -81,10 +81,10 @@ WPEWEBKIT_CONF_OPTS += -DUSE_WOFF2=OFF
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-WPEWEBKIT_CONF_OPTS += -DUSE_SYSTEMD=ON
+WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
 WPEWEBKIT_DEPENDENCIES += systemd
 else
-WPEWEBKIT_CONF_OPTS += -DUSE_SYSTEMD=OFF
+WPEWEBKIT_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
 endif
 
 # JIT is not supported for MIPS r6, but the WebKit build system does not
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
