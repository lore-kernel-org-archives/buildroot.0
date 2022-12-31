Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4731BC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0E958315C;
	Mon, 20 Feb 2023 23:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E958315C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VwtYsd3BYOsg; Mon, 20 Feb 2023 23:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2897683E9B;
	Mon, 20 Feb 2023 23:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2897683E9B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C14741BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 620A161B18
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 620A161B18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rCY_kFCYEva for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69DA1617B1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69DA1617B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66318828C8; Mon, 20 Feb 2023 20:52:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:22:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f496b36995c02f81b2404ef1f450ecbfba26aace
X-Git-Newrev: a03e57ccbf432f73275869cf9a3e6a7a234cb5de
X-Patchwork-Hint: ignore
Message-Id: <20230220205220.66318828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mfgtools: update URLs
 to NXPmicro github organization
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

commit: https://git.buildroot.net/buildroot/commit/?id=a03e57ccbf432f73275869cf9a3e6a7a234cb5de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

mfgtools was removed from the github codeauroraforum organization.
It is now redirecting to NXPmicro. This patch updates the link to
directly point to the correct place.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mfgtools/Config.in.host | 2 +-
 package/mfgtools/mfgtools.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mfgtools/Config.in.host b/package/mfgtools/Config.in.host
index 2b506c8f67..f1e7ab58e3 100644
--- a/package/mfgtools/Config.in.host
+++ b/package/mfgtools/Config.in.host
@@ -8,7 +8,7 @@ config BR2_PACKAGE_HOST_MFGTOOLS
 	  production. The communication is done over USB using the
 	  Freescale UTP protocol.
 
-	  https://github.com/codeauroraforum/mfgtools
+	  https://github.com/NXPmicro/mfgtools
 
 comment "host mfgtools needs a toolchain w/ host gcc >= 4.9"
 	depends on BR2_arm
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index 48ce5dda28..3de93936b8 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MFGTOOLS_VERSION = 0.02
-MFGTOOLS_SITE = $(call github,codeauroraforum,mfgtools,v$(MFGTOOLS_VERSION))
+MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,v$(MFGTOOLS_VERSION))
 MFGTOOLS_SUBDIR = MfgToolLib
 MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
 MFGTOOLS_LICENSE_FILES = LICENSE README.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
