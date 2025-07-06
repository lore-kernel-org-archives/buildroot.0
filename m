Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89717C83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 14:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C59580E25;
	Sun,  6 Jul 2025 14:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e80wRLr0Zd0C; Sun,  6 Jul 2025 14:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62B9D80DDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62B9D80DDD;
	Sun,  6 Jul 2025 14:23:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E93C512E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFF14608F1
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pi_3D1FpEVtW for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 14:23:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27F1C608DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27F1C608DB
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CEDC85E50; Sun,  6 Jul 2025 14:23:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Jul 2025 16:18:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca86f0a206445551c30cd5e900fdf90e448546b1
X-Git-Newrev: 14272869ebdeb07f7203e4d603384581bc16a215
X-Patchwork-Hint: ignore
Message-Id: <20250706142311.0CEDC85E50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clpeak: bump version to 1.1.5
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=14272869ebdeb07f7203e4d603384581bc16a215
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since 1.1.2, see:
https://github.com/krrishnarraj/clpeak/releases/tag/1.1.3
https://github.com/krrishnarraj/clpeak/releases/tag/1.1.4
https://github.com/krrishnarraj/clpeak/releases/tag/1.1.5

The package license changed from Unlicensed to Apache-2.0 in upstream
commit [1]. This commit updates _LICENSE and the license file hash
accordingly.

[1] https://github.com/krrishnarraj/clpeak/commit/65e572451330b4673712dfec352842f3123a9258

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/clpeak/clpeak.hash | 4 ++--
 package/clpeak/clpeak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/clpeak/clpeak.hash b/package/clpeak/clpeak.hash
index 3db2a2ca6b..0ef30c5a68 100644
--- a/package/clpeak/clpeak.hash
+++ b/package/clpeak/clpeak.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bc7beba6b3307290650abc4f13fe9389b271c1a64601fa333461516950d745b  clpeak-1.1.2.tar.gz
-sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
+sha256  31620ef28848108f6868e57e100412aa009399ba2cd021afd3b64563711fa49f  clpeak-1.1.5.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/clpeak/clpeak.mk b/package/clpeak/clpeak.mk
index 616a02c0b4..7756345be6 100644
--- a/package/clpeak/clpeak.mk
+++ b/package/clpeak/clpeak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CLPEAK_VERSION = 1.1.2
+CLPEAK_VERSION = 1.1.5
 CLPEAK_SITE = $(call github,krrishnarraj,clpeak,$(CLPEAK_VERSION))
-CLPEAK_LICENSE = Unlicense
+CLPEAK_LICENSE = Apache-2.0
 CLPEAK_LICENSE_FILES = LICENSE
 CLPEAK_DEPENDENCIES = libopencl opencl-clhpp
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
