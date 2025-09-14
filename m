Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DC8CA0EE8
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 22:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E2DD4159A;
	Sun, 14 Sep 2025 22:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TolmfVNB4T3H; Sun, 14 Sep 2025 22:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89DEA41FE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89DEA41FE4;
	Sun, 14 Sep 2025 22:21:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EE121F7
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72657848DB
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEHYjpmyXQAj for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F31848D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6F31848D9
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4E5C846E3; Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 23:48:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8de4aadda72b3ba3487badc71e75ab394a630974
X-Git-Newrev: 66b0ad1097a5a245407eadc7daa2b24946538f8f
X-Patchwork-Hint: ignore
Message-Id: <20250914222137.C4E5C846E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/restorecond: bump to version 3.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=66b0ad1097a5a245407eadc7daa2b24946538f8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
https://github.com/SELinuxProject/selinux/releases/download/3.9/RELEASE-3.9.txt

No notable changes related to restorecond.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/restorecond/restorecond.hash | 2 +-
 package/restorecond/restorecond.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index 2a55edc313..dcfbd54617 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  164fe4825a9c65f3dd664f68fe252e67df72d4ea817a90d8f62ae0544bfb8ba2  restorecond-3.8.1.tar.gz
+sha256  d57b6ffe7eafd01af58e5efa50f8522eca73c0b3cb2955ca3f33397ba074a1a7  restorecond-3.9.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index f2618c20b3..e8f432c88d 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 3.8.1
+RESTORECOND_VERSION = 3.9
 RESTORECOND_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(RESTORECOND_VERSION)
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
