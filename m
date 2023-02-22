Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686E4C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 108C241190;
	Wed, 22 Feb 2023 14:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 108C241190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQRe4e1OZ5d6; Wed, 22 Feb 2023 14:58:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D229415AD;
	Wed, 22 Feb 2023 14:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D229415AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51EA71BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C16460888
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C16460888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDzS_WJ4xK90 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:58:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60131607C7
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60131607C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CE8386715; Wed, 22 Feb 2023 14:58:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 15:56:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7692d5beb2d9e4d0b463f0f26a177829e5bcc1ec
X-Git-Newrev: 9793454bd2f0ada2b3928896aaf90b4d753d0399
X-Patchwork-Hint: ignore
Message-Id: <20230222145854.4CE8386715@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/hackrf: bump to
 version 2023.01.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9793454bd2f0ada2b3928896aaf90b4d753d0399
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/greatscottgadgets/hackrf/releases/tag/v2023.01.1

Signed-off-by: Diego Hurtado de Mendoza <diego.hdmp@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hackrf/hackrf.hash | 2 +-
 package/hackrf/hackrf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hackrf/hackrf.hash b/package/hackrf/hackrf.hash
index 16ccb9dcfb..0426009dd3 100644
--- a/package/hackrf/hackrf.hash
+++ b/package/hackrf/hackrf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bacd4e7937467ffa14654624444c8b5c716ab470d8c1ee8d220d2094ae2adb3e  hackrf-2022.09.1.tar.xz
+sha256  32a03f943a30be4ba478e94bf69f14a5b7d55be6761007f4a4f5453418206a11  hackrf-2023.01.1.tar.xz
 sha256  49b60a6288f90f49074228cc1fae0fb16871ba36b756013abdf7c2fc92f01fad  COPYING
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index 4317da60bc..0d7533815d 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HACKRF_VERSION = 2022.09.1
+HACKRF_VERSION = 2023.01.1
 HACKRF_SITE = https://github.com/greatscottgadgets/hackrf/releases/download/v$(HACKRF_VERSION)
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
 HACKRF_LICENSE = GPL-2.0+, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
