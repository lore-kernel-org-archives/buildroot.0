Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BCCC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71B10437EE;
	Wed, 10 Jan 2024 20:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71B10437EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXgud7WJuifi; Wed, 10 Jan 2024 20:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84F414379E;
	Wed, 10 Jan 2024 20:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84F414379E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C238F1BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7E2083D28
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7E2083D28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vWtJZs5s2IEf for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D562983AAD
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D562983AAD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C526485D62; Wed, 10 Jan 2024 20:22:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 20:54:47 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 639032459f702b660efd06329a5486cdcce0c81f
X-Git-Newrev: d643e10124c17b8b34b888dda024deae1828fed1
X-Patchwork-Hint: ignore
Message-Id: <20240110202203.C526485D62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/ipcalc: bump to
 version 1.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d643e10124c17b8b34b888dda024deae1828fed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

https://gitlab.com/ipcalc/ipcalc/-/blob/1.0.3/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2d61c7dba8d016d91b1fe1c33bcaae8b161de46f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipcalc/ipcalc.hash | 2 +-
 package/ipcalc/ipcalc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ipcalc/ipcalc.hash b/package/ipcalc/ipcalc.hash
index 50d08239fa..dec69d2abf 100644
--- a/package/ipcalc/ipcalc.hash
+++ b/package/ipcalc/ipcalc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  47c866941916800270fca23496acc9976ca9488ce9053aeaedc5f47c5929b772  ipcalc-1.0.2.tar.bz2
+sha256  5ed8f20819a5bdb089829fc62c9a2c685252759d5c3ec289492e6ef5762f4e3b  ipcalc-1.0.3.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index e63e174ce2..c1eba5d59f 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPCALC_VERSION = 1.0.2
+IPCALC_VERSION = 1.0.3
 IPCALC_SITE = $(call gitlab,ipcalc,ipcalc,$(IPCALC_VERSION))
 IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
