Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14ECC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 767A040673;
	Sun, 24 Mar 2024 14:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFpOUEKoJlXQ; Sun, 24 Mar 2024 14:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 541144063D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 541144063D;
	Sun, 24 Mar 2024 14:59:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC2451BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 862A640165
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NstI0ob8hQuY for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B95F940166
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B95F940166
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A764583AEE; Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:49:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f85a1eb173954cfcdda1c0e947913bba598290d8
X-Git-Newrev: 5e545cd269e0a3bbd6f859f885c887f14d3bd2d9
X-Patchwork-Hint: ignore
Message-Id: <20240324145836.A764583AEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vdr: bump to version 2.6.5
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e545cd269e0a3bbd6f859f885c887f14d3bd2d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/vdr-projects/vdr/blob/2.6.5/HISTORY

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/vdr/vdr.hash | 2 +-
 package/vdr/vdr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index 1b7ced0b77..47179a9907 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  70352c7558d627202c02e80d88c83d25d9df4c5e49a010f7d1d9ae631bd54ad0  vdr-2.6.3.tar.gz
+sha256  293e355b2cc22e6152dae9c315d5b8903f3e647a2e60b6217d306ff4bceb83e1  vdr-2.6.5.tar.gz
 sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index a44e1ff512..c717d40e02 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.6.3
+VDR_VERSION = 2.6.5
 VDR_SITE = $(call github,vdr-projects,vdr,$(VDR_VERSION))
 VDR_LICENSE = GPL-2.0+
 VDR_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
