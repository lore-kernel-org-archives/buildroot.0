Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AC6CAC592
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 22:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF677848C6;
	Sun, 14 Sep 2025 22:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAj8IzqOQSMG; Sun, 14 Sep 2025 22:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D880848DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D880848DA;
	Sun, 14 Sep 2025 22:21:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A0F293A
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64B1F848DF
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WoDSJGuYCre for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A94DF848DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A94DF848DB
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83038846E3; Sun, 14 Sep 2025 22:21:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Sep 2025 23:46:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5417543007da2fd524c42f8a50a9553d457d45b5
X-Git-Newrev: ca143cd857f2901393fffa013cc6bb1853144275
X-Patchwork-Hint: ignore
Message-Id: <20250914222137.83038846E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/checkpolicy: bump to version 3.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca143cd857f2901393fffa013cc6bb1853144275
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes: https://github.com/SELinuxProject/selinux/releases/download/3.9/RELEASE-3.9.txt

Related to checkpolicy:

* checkpolicy: Add support for wildcard netifcon names

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/checkpolicy/checkpolicy.hash | 2 +-
 package/checkpolicy/checkpolicy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index ba33165685..442ac883ee 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  7b477c516e2693d8b6c511386323177f1d7db51c2e04eb6d0de8ca2b36120e5d  checkpolicy-3.8.1.tar.gz
+sha256  dd85b0173ca6e96b22ebf472bcbccf04eb10e1aa07add8f1b7e0e9e8e995e027  checkpolicy-3.9.tar.gz
 
 # Hash for license file
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index 8c094f23a5..df3da2efdd 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.8.1
+CHECKPOLICY_VERSION = 3.9
 CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
