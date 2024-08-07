Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ABFC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE19B608D6;
	Wed,  7 Aug 2024 20:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lGzvXR9RjJCO; Wed,  7 Aug 2024 20:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB030608E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB030608E7;
	Wed,  7 Aug 2024 20:53:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A61F31BF308
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E46440BDE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vujld61UnkOL for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C429402DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C429402DC
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:53:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6159A8468E; Wed,  7 Aug 2024 20:53:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 22:48:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 359b3228e24642ee9d7603af8f664b1832c5f98b
X-Git-Newrev: 7c4f3014ef9128a1d743e96452d388a3343c1150
X-Patchwork-Hint: ignore
Message-Id: <20240807205312.6159A8468E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grantlee: bump to 5.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c4f3014ef9128a1d743e96452d388a3343c1150
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the license file has changed due to the addition of this
line:

+Grantlee is copyright Stephen Kelly <steveire@gmail.com> and others.

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grantlee/grantlee.hash | 4 ++--
 package/grantlee/grantlee.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/grantlee/grantlee.hash b/package/grantlee/grantlee.hash
index 6508aa70cc..6ff509f0dd 100644
--- a/package/grantlee/grantlee.hash
+++ b/package/grantlee/grantlee.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  139acee5746b957bdf1327ec0d97c604d4c0b9be42aec5d584297cb5ed6a990a  grantlee-5.2.0.tar.gz
+sha256  ba288ae9ed37ec0c3622ceb40ae1f7e1e6b2ea89216ad8587f0863d64be24f06  grantlee-5.3.1.tar.gz
 
 # Hash for license file
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  4c3b163159fe524dc992489c5bc52aaf0231b5ff41fb6234adb7f10373da24c4  COPYING.LIB
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 7079679ca4..7e36334902 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRANTLEE_VERSION = 5.2.0
+GRANTLEE_VERSION = 5.3.1
 GRANTLEE_SITE = $(call github,steveire,grantlee,v$(GRANTLEE_VERSION))
 GRANTLEE_INSTALL_STAGING = YES
 GRANTLEE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
