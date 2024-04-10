Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647D1CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3704A60EDA;
	Wed, 10 Apr 2024 21:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6EE8RljeTvl; Wed, 10 Apr 2024 21:45:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC86B60EEC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC86B60EEC;
	Wed, 10 Apr 2024 21:45:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A1E281BF980
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F92E40491
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXys7qnik2Il for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D7884059D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D7884059D
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:45:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28E2085F7D; Wed, 10 Apr 2024 21:45:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 23:35:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b6e6b563305a0469d6e3216cafa82c1b81ce82d
X-Git-Newrev: 949232218a73dac849e5589caf803ea3f8b2ea4b
X-Patchwork-Hint: ignore
Message-Id: <20240410214521.28E2085F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8192eu: bump to 2024-03-25
 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=949232218a73dac849e5589caf803ea3f8b2ea4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version allows to build with Linux 6.9.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index a08ed04010..a8b7cb9358 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b5d3b8de0b4f05aa2b452dd01f4386e9b671e03c2bbf8e032f1c593befc5a153  rtl8192eu-e90a6043be141bde8847e84223e106eff38ecdfd.tar.gz
+sha256  8da0f54bd9ae094b5f61fe3c4dd207b2df62b4286970e2828f7c5ce1146447fb  rtl8192eu-56f672a8b9572c743148f2e60068fd341d52d5a3.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 3d24b0caf8..0f00d301a8 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = e90a6043be141bde8847e84223e106eff38ecdfd
+RTL8192EU_VERSION = 56f672a8b9572c743148f2e60068fd341d52d5a3
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
