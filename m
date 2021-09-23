Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12637C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:08:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D160E61029
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D160E61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF6E284264;
	Thu, 23 Sep 2021 21:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9I7qlt7iM_v; Thu, 23 Sep 2021 21:08:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F948413E;
	Thu, 23 Sep 2021 21:08:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52F6E1BF9C2
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B20A26064B
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIAP3Y3vNwjL for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12B0B606B8
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 77DEA8D210; Thu, 23 Sep 2021 21:04:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 22:55:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bde4373fc335c3a5d4c99e47dd410ed87b96b1f
X-Git-Newrev: 471fdcbf13ea606d157cdf8980f87ff8b523414f
X-Patchwork-Hint: ignore
Message-Id: <20210923210442.77DEA8D210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/acpid: bump to version 2.0.33
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=471fdcbf13ea606d157cdf8980f87ff8b523414f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://sourceforge.net/p/acpid2/code/ci/2.0.33/tree/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/acpid/acpid.hash | 8 ++++----
 package/acpid/acpid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/acpid/acpid.hash b/package/acpid/acpid.hash
index f325325b9c..d5e5bcc14b 100644
--- a/package/acpid/acpid.hash
+++ b/package/acpid/acpid.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/acpid2/files/
-md5	248995264b9d1cd8bdb923d5b190fd44	acpid-2.0.32.tar.xz
-sha1	a194e99c5b596186c7865e7ddfec55dea6d7fc73	acpid-2.0.32.tar.xz
+md5  b2f2ca633b30ae893c47981fa4d3b258  acpid-2.0.33.tar.xz
+sha1  b3e06c3f2213db8ee1a9024cf372fb30e2fab637  acpid-2.0.33.tar.xz
 
 # Locally computed
-sha256	f2d2d30b3edc3234bd82f6f7186699a6aa3c85c8d20bc4e30e9b3c68a1ed157e	acpid-2.0.32.tar.xz
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	COPYING
+sha256  0856f71b3eb34a1b663d0a8e6363dfcbc519e63d847330498898658e2972dbe8  acpid-2.0.33.tar.xz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 1214251dc3..5d5138baa3 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPID_VERSION = 2.0.32
+ACPID_VERSION = 2.0.33
 ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
