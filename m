Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01445C54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4BA582438;
	Thu, 21 Mar 2024 21:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mWF7IyCLOscO; Thu, 21 Mar 2024 21:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B889382446
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B889382446;
	Thu, 21 Mar 2024 21:04:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC6A1BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3B3F4160A
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0H2-NxCAYf8 for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 663FF415D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 663FF415D0
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EBA383751; Thu, 21 Mar 2024 21:02:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:20:29 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 57b4f2212d4be9fef0ee91b06338dcc119265542
X-Git-Newrev: f646e4728dd38c6c0f8cd550216ba8249ff20973
X-Patchwork-Hint: ignore
Message-Id: <20240321210226.5EBA383751@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libvpl: bump
 version to 2.10.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f646e4728dd38c6c0f8cd550216ba8249ff20973
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 45f964d8dde03161fdfbe69013d19e9a13fb005f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index df1914e4a4..19407e01ba 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  524299a7b920ac0de1f6913ca90515858ea3a8ea2daaea60f8e0be62f22c8041  libvpl-2.10.1.tar.gz
+sha256  ad956ea7ecf14614325f59dfb44cc5ba08e2fcac373342d61c7db152ac651253  libvpl-2.10.2.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 0c5d354874..645fda14de 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2.10.1
+LIBVPL_VERSION = 2.10.2
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
