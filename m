Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F90C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 21:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B1560AAA;
	Mon,  6 May 2024 21:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mHF_dPa_GCzm; Mon,  6 May 2024 21:27:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09E4360ABE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E4360ABE;
	Mon,  6 May 2024 21:27:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B97DA1BF46A
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A446D40118
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rJJdwt8mMVMr for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 21:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DABE540217
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DABE540217
 for <buildroot@buildroot.org>; Mon,  6 May 2024 21:27:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89EB986964; Mon,  6 May 2024 21:27:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:57:12 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 63d5a3b88e345a620ffebf04f18b81ef659db609
X-Git-Newrev: c28be13d01d7aa216d64817f4e9c728b73157a51
X-Patchwork-Hint: ignore
Message-Id: <20240506212727.89EB986964@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/petitboot: bump
 to version 1.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=c28be13d01d7aa216d64817f4e9c728b73157a51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5652306f7e72792655f0b2b2ea978734fc2e5938)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/petitboot/petitboot.hash | 2 +-
 package/petitboot/petitboot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/petitboot/petitboot.hash b/package/petitboot/petitboot.hash
index a9a21f2c1b..3a90bc5296 100644
--- a/package/petitboot/petitboot.hash
+++ b/package/petitboot/petitboot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fa2367370d3ce5dd9910ab08a0832071e2508c8bf75cfec6d3b9807fbefc507a  petitboot-v1.14.tar.gz
+sha256  eed29ec841c2bcd5ecc65347f5b95a0087a541bd9c04ca3c17c55d1f7357d189  petitboot-v1.15.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 4c8bc35adb..cd7631fa5c 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PETITBOOT_VERSION = 1.14
+PETITBOOT_VERSION = 1.15
 PETITBOOT_SOURCE = petitboot-v$(PETITBOOT_VERSION).tar.gz
 PETITBOOT_SITE = https://github.com/open-power/petitboot/releases/download/v$(PETITBOOT_VERSION)
 PETITBOOT_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
