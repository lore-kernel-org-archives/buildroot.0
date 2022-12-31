Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905E4C4332F
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 16:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 331F8607FE;
	Sat, 31 Dec 2022 16:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 331F8607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqWy95OSP8fE; Sat, 31 Dec 2022 16:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 868A3607CE;
	Sat, 31 Dec 2022 16:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 868A3607CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7C91BF47D
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C908402A6
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 16:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C908402A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNXO9kZcSd6N for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 16:35:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1153840325
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 16:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1153840325
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB0B286FB4; Sat, 31 Dec 2022 16:35:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 17:22:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f496b36995c02f81b2404ef1f450ecbfba26aace
X-Git-Newrev: a03e57ccbf432f73275869cf9a3e6a7a234cb5de
X-Patchwork-Hint: ignore
Message-Id: <20221231163500.EB0B286FB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mfgtools: update URLs to NXPmicro
 github organization
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
