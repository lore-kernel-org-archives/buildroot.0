Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31812C25B10
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 21:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFEFA4096F;
	Mon, 13 May 2024 21:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FB3PFbjtjPgj; Mon, 13 May 2024 21:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B575440841
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B575440841;
	Mon, 13 May 2024 21:28:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6051BF2A4
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C2CE60A9E
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 21:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kE8T-g5l8sLr for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 21:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5844860646
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5844860646
 for <buildroot@buildroot.org>; Mon, 13 May 2024 21:28:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F29B87321; Mon, 13 May 2024 21:28:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 May 2024 23:27:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab990cf58a724a178dbdd55afdb520212f7197c0
X-Git-Newrev: 052deababf60838a19f6334bae1746c841eba877
X-Patchwork-Hint: ignore
Message-Id: <20240513212804.0F29B87321@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/slirp4netns: bump to version 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=052deababf60838a19f6334bae1746c841eba877
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/slirp4netns/slirp4netns.hash | 2 +-
 package/slirp4netns/slirp4netns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
index e3115c1be0..e310da1af2 100644
--- a/package/slirp4netns/slirp4netns.hash
+++ b/package/slirp4netns/slirp4netns.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b584edde686d3cfbac210cbdb93c4b0ba5d8cc0a6a4d92b9dfc3c5baec99c727  slirp4netns-1.2.0.tar.gz
+sha256  acce648fab8fe5f113c41a8fd6d20177708519b4ddaa60f845e1998a17b22ca5  slirp4netns-1.2.3.tar.gz
 sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
index 7ff594cc44..7fa992af6d 100644
--- a/package/slirp4netns/slirp4netns.mk
+++ b/package/slirp4netns/slirp4netns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SLIRP4NETNS_VERSION = 1.2.0
+SLIRP4NETNS_VERSION = 1.2.3
 SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
 SLIRP4NETNS_LICENSE = GPL-2.0
 SLIRP4NETNS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
