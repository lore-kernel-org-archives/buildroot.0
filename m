Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72304CCD18D
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 17:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 455FA40845;
	Fri, 10 Oct 2025 17:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgAgSSxxCcOl; Fri, 10 Oct 2025 17:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65ECA407C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65ECA407C2;
	Fri, 10 Oct 2025 17:43:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D01EF119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF60081008
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfKEG753GG-n for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E2D81046
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8E2D81046
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D629187036; Fri, 10 Oct 2025 17:42:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 19:22:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f9c69c97f064f2a06d7318d61a77c82b02422b4
X-Git-Newrev: 6384d4143061fad7a3664aabdbb13161ff7465ea
X-Patchwork-Hint: ignore
Message-Id: <20251010174246.D629187036@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8821au: bump to 2025-10-08
 version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6384d4143061fad7a3664aabdbb13161ff7465ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version allows to build with Linux 6.17

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index 2796c50791..29b4d46f8e 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d8d11753f88d670be7489fd1d5d30718543f4994ccc5031609f4408a5586ef3c  rtl8821au-4d39880a41201ddb14b19f2e7273054bb812b32e.tar.gz
+sha256  fe9840003e9481cf9fce3a5ed3f5b985615f862abc1b8d51fe6de7da9e4943c9  rtl8821au-dfe6801adb9b3a5572260ab308d3b69522992814.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index afd520b467..734b427019 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = 4d39880a41201ddb14b19f2e7273054bb812b32e
+RTL8821AU_VERSION = dfe6801adb9b3a5572260ab308d3b69522992814
 RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
