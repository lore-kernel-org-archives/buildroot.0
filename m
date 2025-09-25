Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2BDCAC5BA
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 19:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3E96406DF;
	Thu, 25 Sep 2025 19:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3AkytbHz_eUT; Thu, 25 Sep 2025 19:10:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A3F0403EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A3F0403EC;
	Thu, 25 Sep 2025 19:10:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43A50199
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28F4884236
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kla5my1IGE9n for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 19:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B37D84234
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B37D84234
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:10:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3AF1486421; Thu, 25 Sep 2025 19:10:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 21:08:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14885464292df19e664d95ade46a0d13cf0d25c5
X-Git-Newrev: 242cada87ec03764e41dcf30797b9117c5c9ff1d
X-Patchwork-Hint: ignore
Message-Id: <20250925191039.3AF1486421@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiec61850: bump to version 1.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=242cada87ec03764e41dcf30797b9117c5c9ff1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/mz-automation/libiec61850/blob/v1.6.1/CHANGELOG

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libiec61850/libiec61850.hash | 2 +-
 package/libiec61850/libiec61850.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
index 3c23682c49..2c1870b984 100644
--- a/package/libiec61850/libiec61850.hash
+++ b/package/libiec61850/libiec61850.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0dd0adc7f13215e961d22511bcb1dadfdbdaab969f11a0d975775a6ebdff8099  libiec61850-1.6.0.tar.gz
+sha256  64113483eea8aec4f18cef9f8bb3c872585b2c67566824c4373db257bcc7bf8e  libiec61850-1.6.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 2bf98f1f3d..b29285cbe2 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIEC61850_VERSION = 1.6.0
+LIBIEC61850_VERSION = 1.6.1
 LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
