Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB2CC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B7242D18;
	Fri, 28 Feb 2025 16:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtvyhsBpVXbu; Fri, 28 Feb 2025 16:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA834F27E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BA834F27E;
	Fri, 28 Feb 2025 16:36:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1965768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE57E419DB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChvHGIQ9akss for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BC4241A26
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BC4241A26
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7442E87A86; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Dec 2024 22:46:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 82917f238e24d7ab71b5a5e43cbdc428ef452768
X-Git-Newrev: cf3dd3e365d5287cecf08a1b35394236be297148
X-Patchwork-Hint: ignore
Message-Id: <20250228162936.7442E87A86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/swugenerator: bump to
 version 0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf3dd3e365d5287cecf08a1b35394236be297148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note, see:
https://github.com/sbabic/swugenerator/releases/tag/0.4

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/swugenerator/swugenerator.hash | 2 +-
 package/swugenerator/swugenerator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swugenerator/swugenerator.hash b/package/swugenerator/swugenerator.hash
index 301f168681..5c4878b400 100644
--- a/package/swugenerator/swugenerator.hash
+++ b/package/swugenerator/swugenerator.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  3f4885242bce9523d26567578793c828e2f07122c6b7e44cce8ede33e5618a01  swugenerator-0.3.tar.gz
+sha256  80351fc1c57a6162bc07c44765f2cfd76f3d984dbefca79c3d59844aacd2957f  swugenerator-0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/swugenerator/swugenerator.mk b/package/swugenerator/swugenerator.mk
index 22ed799e99..b5f7796ebe 100644
--- a/package/swugenerator/swugenerator.mk
+++ b/package/swugenerator/swugenerator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUGENERATOR_VERSION = 0.3
+SWUGENERATOR_VERSION = 0.4
 SWUGENERATOR_SITE = $(call github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
 SWUGENERATOR_LICENSE = GPL-3.0
 SWUGENERATOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
