Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9BDC47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDC8D61AEC;
	Thu,  4 Jan 2024 21:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDC8D61AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qHbre2SCmHV; Thu,  4 Jan 2024 21:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C11615F8;
	Thu,  4 Jan 2024 21:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C11615F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1525C1BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECA5A424FF
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECA5A424FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4VtnpVKCsV9 for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:27:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7235C4284B
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7235C4284B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E5B583D35; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:21:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8e19f8de8dc7f0e1389515044d584aa4733682a
X-Git-Newrev: 620cd04da4ae7027923b7be2e071c59ed900897e
X-Patchwork-Hint: ignore
Message-Id: <20240104212747.5E5B583D35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress: bump to version 1.0.7
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=620cd04da4ae7027923b7be2e071c59ed900897e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use official tarball and so drop autoreconf

https://github.com/resurrecting-open-source-projects/stress/blob/1.0.7/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stress/stress.hash | 2 +-
 package/stress/stress.mk   | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/stress/stress.hash b/package/stress/stress.hash
index dc1785b6c7..ac36122594 100644
--- a/package/stress/stress.hash
+++ b/package/stress/stress.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1798e49ca365d928fb194ba1b8e8d1e09963b49e9edb0a78bcbba15750bb5027  stress-1.0.5.tar.gz
+sha256  e63adb57597e617c14ecb0d841b5d990460796d9e9ec69bd56fe645ef02eb239  stress-1.0.7.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/stress/stress.mk b/package/stress/stress.mk
index 99a50f349e..53f01b3b0a 100644
--- a/package/stress/stress.mk
+++ b/package/stress/stress.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-STRESS_VERSION = 1.0.5
-STRESS_SITE = $(call github,resurrecting-open-source-projects,stress,$(STRESS_VERSION))
+STRESS_VERSION = 1.0.7
+STRESS_SOURCE = stress-$(STRESS_VERSION).tar.bz2
+STRESS_SITE = https://github.com/resurrecting-open-source-projects/stress/releases/download/$(STRESS_VERSION)
 STRESS_LICENSE = GPL-2.0+
 STRESS_LICENSE_FILES = COPYING
-# From git
-STRESS_AUTORECONF = YES
 
 # Stress is linked statically if the --enable-static is specified.
 # However, this option is always specified in the global
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
