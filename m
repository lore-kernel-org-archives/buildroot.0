Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051A7C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF337608E4;
	Thu, 17 Jul 2025 20:43:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiKo9bHOVnCk; Thu, 17 Jul 2025 20:43:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03092607E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03092607E6;
	Thu, 17 Jul 2025 20:43:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 884F2226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CA7360791
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fObkAzVxGtsI for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E3E56085B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E3E56085B
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C01886746; Thu, 17 Jul 2025 20:43:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Jul 2025 22:34:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25d9e3c3d67834b4e23eb366817cc5c47a4dc00f
X-Git-Newrev: 6e0eb020135979fb5b923dcde9a7771e9dfb33fa
X-Patchwork-Hint: ignore
Message-Id: <20250717204325.5C01886746@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatch-vcs: bump to version
 0.5.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6e0eb020135979fb5b923dcde9a7771e9dfb33fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/python-hatch-vcs/python-hatch-vcs.hash | 4 ++--
 package/python-hatch-vcs/python-hatch-vcs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatch-vcs/python-hatch-vcs.hash b/package/python-hatch-vcs/python-hatch-vcs.hash
index 55cd3b3e5a..16f08bcc4a 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.hash
+++ b/package/python-hatch-vcs/python-hatch-vcs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatch_vcs/json
-md5  d801fe7c3e5955307748f2790bbb3488  hatch_vcs-0.4.0.tar.gz
-sha256  093810748fe01db0d451fabcf2c1ac2688caefd232d4ede967090b1c1b07d9f7  hatch_vcs-0.4.0.tar.gz
+md5  9a22a9f7203783e526959d34510a9672  hatch_vcs-0.5.0.tar.gz
+sha256  0395fa126940340215090c344a2bf4e2a77bcbe7daab16f41b37b98c95809ff9  hatch_vcs-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  117aa5006d8475562f04442ab06dd2a4c501af3a77255eae0deef1f0c2499a1a  LICENSE.txt
diff --git a/package/python-hatch-vcs/python-hatch-vcs.mk b/package/python-hatch-vcs/python-hatch-vcs.mk
index f63d8b26fe..1fc2a19706 100644
--- a/package/python-hatch-vcs/python-hatch-vcs.mk
+++ b/package/python-hatch-vcs/python-hatch-vcs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCH_VCS_VERSION = 0.4.0
+PYTHON_HATCH_VCS_VERSION = 0.5.0
 PYTHON_HATCH_VCS_SOURCE = hatch_vcs-$(PYTHON_HATCH_VCS_VERSION).tar.gz
-PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/f5/c9/54bb4fa27b4e4a014ef3bb17710cdf692b3aa2cbc7953da885f1bf7e06ea
+PYTHON_HATCH_VCS_SITE = https://files.pythonhosted.org/packages/6b/b0/4cc743d38adbee9d57d786fa496ed1daadb17e48589b6da8fa55717a0746
 PYTHON_HATCH_VCS_LICENSE = MIT
 PYTHON_HATCH_VCS_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCH_VCS_SETUP_TYPE = hatch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
