Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC2AECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 16:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A964360C15;
	Fri,  9 Sep 2022 16:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A964360C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9nL-TijDhhq; Fri,  9 Sep 2022 16:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2A2160BE1;
	Fri,  9 Sep 2022 16:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2A2160BE1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E38C1BF294
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 16:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14B824177D
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 16:55:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14B824177D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOdA8LmMmKPR for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 16:55:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 061EA409AD
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 16:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 061EA409AD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E277A82D96; Fri,  9 Sep 2022 16:55:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Sep 2022 18:54:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58e60a32131fec1b363113cae592a45bb1999b05
X-Git-Newrev: 8560315ab29eba19b1917e93f499716cc75a11f1
X-Patchwork-Hint: ignore
Message-Id: <20220909165553.E277A82D96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwup: bump to v1.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8560315ab29eba19b1917e93f499716cc75a11f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release fixes a compiler error when using glibc 2.36.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fwup/fwup.hash | 2 +-
 package/fwup/fwup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
index 2e5b2b1f6c..51ec444bcb 100644
--- a/package/fwup/fwup.hash
+++ b/package/fwup/fwup.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  18ae6753145cef2fd5f5fc83e29c2d883e570668d8aa064ee6c94d4c5e44d73d  fwup-1.9.0.tar.gz
+sha256  9684551647f0ddd043f9ff46f7bec8eacb2da1ac29d6d8d5d775c346173b8e88  fwup-1.9.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index 62016d94e3..a6395d583d 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWUP_VERSION = 1.9.0
+FWUP_VERSION = 1.9.1
 FWUP_SITE = $(call github,fwup-home,fwup,v$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
