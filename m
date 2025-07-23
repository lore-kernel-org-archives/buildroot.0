Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B763AC83F17
	for <buildroot@archiver.kernel.org>; Wed, 23 Jul 2025 21:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1FAD812A3;
	Wed, 23 Jul 2025 21:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taNHvm8nPkC7; Wed, 23 Jul 2025 21:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47C438129D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C438129D;
	Wed, 23 Jul 2025 21:19:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B022DA
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 21:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B9C741423
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 21:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLh7oG8X6aQq for <buildroot@buildroot.org>;
 Wed, 23 Jul 2025 21:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CBDA41235
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CBDA41235
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 21:19:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AC6186A02; Wed, 23 Jul 2025 21:19:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Jul 2025 23:14:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38c5b1e29eff8eb47d39b7eb13e91190c8b5ba7f
X-Git-Newrev: 7be91747f8df62fe1e06ec7477fc187990edbb1f
X-Patchwork-Hint: ignore
Message-Id: <20250723211914.4AC6186A02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cukinia: bump to version 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7be91747f8df62fe1e06ec7477fc187990edbb1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the release note, see [1].
For a full change log since v0.6.0, see [2].

Note that the package license changed from "Apache-2.0 or GPL-3.0"
to Apache-2.0 only. See upstream commit [3]. This commit updates
the hash file, _LICENSE and _LICENSE_FILES accordingly.

[1] https://github.com/savoirfairelinux/cukinia/releases/tag/v0.8.0
[2] https://github.com/savoirfairelinux/cukinia/compare/v0.6.0...v0.8.0
[3] https://github.com/savoirfairelinux/cukinia/commit/e514a2ecea251da9c3dffaabe4f70846672dc5eb

Signed-off-by: Serosh Deljam <serosh.deljam@savoirfairelinux.com>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cukinia/cukinia.hash | 3 +--
 package/cukinia/cukinia.mk   | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/cukinia/cukinia.hash b/package/cukinia/cukinia.hash
index 6e76a6ab88..cc0393aff9 100644
--- a/package/cukinia/cukinia.hash
+++ b/package/cukinia/cukinia.hash
@@ -1,4 +1,3 @@
 # locally computed
-sha256  79dc77c7b9f2784e7d22d961dd2c4ad9c78deebbc6e8f39df4fa214118682b40  cukinia-0.6.0.tar.gz
+sha256  8f608571354d87f7ec2949bd335c616881c05f66fc60d7a2fc7488369c9d307d  cukinia-0.8.0.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPLv3
diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
index 798c199b67..a4e3658ede 100644
--- a/package/cukinia/cukinia.mk
+++ b/package/cukinia/cukinia.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-CUKINIA_VERSION = 0.6.0
+CUKINIA_VERSION = 0.8.0
 CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,v$(CUKINIA_VERSION))
-CUKINIA_LICENSE = Apache-2.0 or GPL-3.0
-CUKINIA_LICENSE_FILES = LICENSE LICENSE.GPLv3
+CUKINIA_LICENSE = Apache-2.0
+CUKINIA_LICENSE_FILES = LICENSE
 
 define CUKINIA_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/cukinia $(TARGET_DIR)/usr/bin/cukinia
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
