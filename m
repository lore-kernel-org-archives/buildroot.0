Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8921FC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EEB340874;
	Mon, 24 Mar 2025 20:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0LUIwW8_KSC; Mon, 24 Mar 2025 20:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AC8140899
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC8140899;
	Mon, 24 Mar 2025 20:18:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB755E0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF9640F59
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhhA35wxINEN for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 095AB40445
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 095AB40445
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:18:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAD7582775; Mon, 24 Mar 2025 20:18:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 21:08:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4087461203c9788bc51c918d38a0ae9911499fa7
X-Git-Newrev: 3b4048c132254717a9ffc2428afe798b8d8b8dfd
X-Patchwork-Hint: ignore
Message-Id: <20250324201807.EAD7582775@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccache: bump version to 4.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b4048c132254717a9ffc2428afe798b8d8b8dfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://ccache.dev/releasenotes.html#_ccache_4_11_2

Updated license hash due to copyright year and version bumps:
https://github.com/ccache/ccache/commits/v4.11.2/LICENSE.adoc

Follow upstream rename of Config.cpp to config.cpp:
https://github.com/ccache/ccache/commit/d805b66b0f1ffdfc7035537fbca677d7463d2782

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ccache/ccache.hash |  4 ++--
 package/ccache/ccache.mk   | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 6624fdef65..259041d2e9 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  c0b85ddfc1a3e77b105ec9ada2d24aad617fa0b447c6a94d55890972810f0f5a  ccache-4.10.2.tar.xz
+sha256  319390f276123968cfa565acc3da0b1e18414374b40ff25274230e6860352125  ccache-4.11.2.tar.xz
 sha256  80b5112739a423dfac7bed1ca8a1df3cccda3d794425441997d4462b83db4dd5  GPL-3.0.txt
-sha256  de4684f5251a0a2c58f3a7ab94d6a8d3443822cbd01abcdadd9250d3d1e0bfe1  LICENSE.adoc
+sha256  115fd61246934e8581b1ef9263017cae89e61b5f11599d7f7d6b98f69a700e66  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index f3f675586d..f452bb40af 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 4.10.2
+CCACHE_VERSION = 4.11.2
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
@@ -43,12 +43,12 @@ HOST_CCACHE_CONF_OPTS += \
 HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,%,$(BR_CACHE_DIR))
 
 define HOST_CCACHE_PATCH_CONFIGURATION
-	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache/Config.cpp
-	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
-	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
-	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/Config.cpp
-	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/ccache/Config.cpp
-	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/ccache/Config.cpp
+	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache/config.cpp
+	sed -i 's,".ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
+	sed -i 's,"/.cache/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
+	sed -i 's,"/.config/ccache","/$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/ccache/config.cpp
+	sed -i 's,getenv("XDG_CACHE_HOME"),nullptr,' $(@D)/src/ccache/config.cpp
+	sed -i 's,getenv("XDG_CONFIG_HOME"),nullptr,' $(@D)/src/ccache/config.cpp
 endef
 
 HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
