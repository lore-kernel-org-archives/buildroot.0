Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6215AC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 11:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33035403E3;
	Sun, 28 Jul 2024 11:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzgmsU5-o3ds; Sun, 28 Jul 2024 11:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE33C404E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE33C404E4;
	Sun, 28 Jul 2024 11:08:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B17D21BF471
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB6A6403CD
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 11:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FAwhmsLDZ2v for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 11:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDE9C403C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDE9C403C7
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 11:08:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D79CF8045A; Sun, 28 Jul 2024 11:08:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 13:05:28 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 175cac0f5fd8497e36a0163d4b4d6e747f41c0da
X-Git-Newrev: 157647502d3f6b6463ecf93e40bcd9ef8bcdb6f8
X-Patchwork-Hint: ignore
Message-Id: <20240728110845.D79CF8045A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/rtl8188eu: bump
 to 2024-02-06 version on v5.2.2.4 branch
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

commit: https://git.buildroot.net/buildroot/commit/?id=157647502d3f6b6463ecf93e40bcd9ef8bcdb6f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

This version allows to build with Linux 6.8

Fixes:

  http://autobuild.buildroot.net/results/c2524c7580d97f7387ec22da62be71d77f2ed8ec

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 20a6d583bd2c4cbeba409a3f892422e98181e2b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index eb28e6cf0a..4f8f83e78c 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8cb10a047d39f13c776b0097ef1290f6b3c63590fd57bc0827e8638c878819f0  rtl8188eu-306f3e62cf7cddf8cee74f70f88a7a7b3af46f56.tar.gz
+sha256  507d32eb91d3d407c7758319c81a36a9dc69e2b89378cabcd382411153927b7b  rtl8188eu-f42fc9c45d2086c415dce70d3018031b54a7beef.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 36a84d34de..eca0fb8007 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 306f3e62cf7cddf8cee74f70f88a7a7b3af46f56
+RTL8188EU_VERSION = f42fc9c45d2086c415dce70d3018031b54a7beef
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
