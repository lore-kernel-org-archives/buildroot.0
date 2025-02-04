Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EC9C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9190140874;
	Fri, 28 Feb 2025 17:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOP8zOf8F9z7; Fri, 28 Feb 2025 17:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59C8140843
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59C8140843;
	Fri, 28 Feb 2025 17:11:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 143DB94F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6383E41655
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqcPuvxE38Xn for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DB7642F74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DB7642F74
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57B1280042; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:07:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ffac0cf5108a832dd8bc005bab4ee770288a34bb
X-Git-Newrev: e2484f8bda26f72053e5deb5c09f4e157938eed1
X-Patchwork-Hint: ignore
Message-Id: <20250228163030.57B1280042@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fd: bump to version
 10.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2484f8bda26f72053e5deb5c09f4e157938eed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/sharkdp/fd/releases/tag/v10.2.0

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fd/fd.hash | 2 +-
 package/fd/fd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fd/fd.hash b/package/fd/fd.hash
index 90d2c38694..04345b8884 100644
--- a/package/fd/fd.hash
+++ b/package/fd/fd.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  91da5cc2b99d4754fa5096cda1eeac98f312f712bfca6a41f9972b2287a4c4f9  fd-9.0.0-cargo2.tar.gz
+sha256  6d177b06123419edf2abe2daa82b29fec667a4e775cf877094ca5f6ae759dc34  fd-10.2.0-cargo2.tar.gz
 sha256  73c83c60d817e7df1943cb3f0af81e4939a8352c9a96c2fd00451b1116fa635c  LICENSE-APACHE
 sha256  322cfc7aa0c774d0eca3b2610f1d414de3ddbd7d8dd4b9dea941a13a6eb07455  LICENSE-MIT
diff --git a/package/fd/fd.mk b/package/fd/fd.mk
index 316da418ea..9b6b305e77 100644
--- a/package/fd/fd.mk
+++ b/package/fd/fd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FD_VERSION = 9.0.0
+FD_VERSION = 10.2.0
 FD_SITE = $(call github,sharkdp,fd,v$(FD_VERSION))
 FD_LICENSE = Apache-2.0 or MIT
 FD_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
