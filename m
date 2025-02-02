Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF5BC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E083E85913;
	Fri, 28 Feb 2025 17:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aw8OJC9_aB6w; Fri, 28 Feb 2025 17:07:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE3F98590D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE3F98590D;
	Fri, 28 Feb 2025 17:07:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C0F168
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3665142EF0
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbF4VzfKgt-C for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0DD942EF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0DD942EF8
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB915816CA; Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 2 Feb 2025 12:34:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d70df3ab44159f297d562af47e164d00c724ba28
X-Git-Newrev: d012c7ed4110b9b2394d4cdf11d39c27eb957176
X-Patchwork-Hint: ignore
Message-Id: <20250228163023.CB915816CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsilk: switch to
 github
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=d012c7ed4110b9b2394d4cdf11d39c27eb957176
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://developer.signalwire.com/freeswitch/FreeSWITCH-Explained/Installation/Linux/Deprecated-Installation-Instructions/25460805/
"FreeSWITCH project has been moved to GitHub"

Updated hash due to switch to github.

Fixes:
https://autobuild.buildroot.org/results/4a18ee5fce77d0429a00a151cbd5ad1e48d35405/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsilk/libsilk.hash | 2 +-
 package/libsilk/libsilk.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/libsilk/libsilk.hash b/package/libsilk/libsilk.hash
index 3ed7eac46c..2118036ffd 100644
--- a/package/libsilk/libsilk.hash
+++ b/package/libsilk/libsilk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1b2d44790e841f0707b06fa10af798fa97a326ad4a6a3395b12be1231ed6f9a3  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45-git4.tar.gz
+sha256  816e9d4482a3a6df9c6e16b87e88155d5f38b46def20ec0e9e35ae0f6aa704f3  libsilk-4268a02240c35c6055b0f237c46b09b2dcf79e45.tar.gz
 sha256  62a5963f034024665641f4a9888b208f1e39aa7e29e87c9634fdcf07d3073baf  COPYING
diff --git a/package/libsilk/libsilk.mk b/package/libsilk/libsilk.mk
index eba7085261..af9a7005a0 100644
--- a/package/libsilk/libsilk.mk
+++ b/package/libsilk/libsilk.mk
@@ -6,8 +6,7 @@
 
 LIBSILK_VERSION = 4268a02240c35c6055b0f237c46b09b2dcf79e45
 # we use the FreeSwitch fork because it contains pkgconf support
-LIBSILK_SITE = https://freeswitch.org/stash/scm/sd/libsilk.git
-LIBSILK_SITE_METHOD = git
+LIBSILK_SITE = $(call github,freeswitch,libsilk,$(LIBSILK_VERSION))
 LIBSILK_LICENSE = BSD-3-Clause
 LIBSILK_LICENSE_FILES = COPYING
 LIBSILK_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
