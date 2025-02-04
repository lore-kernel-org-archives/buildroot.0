Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503B5C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2247A6FBF0;
	Fri, 28 Feb 2025 17:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYGPU9rzTYp4; Fri, 28 Feb 2025 17:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B73B70AD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B73B70AD9;
	Fri, 28 Feb 2025 17:11:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B3E71DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8310E416C5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0mxMkAMh728 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52B8E42CFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52B8E42CFD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48D7887A92; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:07:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 914bd041a5cec16bef1a69c9e7509f744940c13c
X-Git-Newrev: ffac0cf5108a832dd8bc005bab4ee770288a34bb
X-Patchwork-Hint: ignore
Message-Id: <20250228163030.48D7887A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zoxide: bump to
 version 0.9.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ffac0cf5108a832dd8bc005bab4ee770288a34bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/ajeetdsouza/zoxide/releases/tag/v0.9.6

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zoxide/zoxide.hash | 2 +-
 package/zoxide/zoxide.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zoxide/zoxide.hash b/package/zoxide/zoxide.hash
index 1a3a066af9..53d4130f22 100644
--- a/package/zoxide/zoxide.hash
+++ b/package/zoxide/zoxide.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f2d9b9448516919f6d5cf32a5f154c2dc3a90d9fdf0addab9cd6a7824020befc  zoxide-0.9.4-cargo2.tar.gz
+sha256  6a9d7bbde2acbd63bdd0f73715314500322d58cfb845559259c4edb111ab161a  zoxide-0.9.6-cargo2.tar.gz
 sha256  23aa3b08366e4ed6050f3d9950070201802aadbe5675fa1c19f24f4de91cf294  LICENSE
diff --git a/package/zoxide/zoxide.mk b/package/zoxide/zoxide.mk
index 92b4395a87..bd9a7e2acd 100644
--- a/package/zoxide/zoxide.mk
+++ b/package/zoxide/zoxide.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZOXIDE_VERSION = 0.9.4
+ZOXIDE_VERSION = 0.9.6
 ZOXIDE_SITE = $(call github,ajeetdsouza,zoxide,v$(ZOXIDE_VERSION))
 ZOXIDE_LICENSE = MIT
 ZOXIDE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
