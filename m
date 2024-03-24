Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61686C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D4F5404CC;
	Sun, 24 Mar 2024 14:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id drytdr_qxtqT; Sun, 24 Mar 2024 14:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4790B40343
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4790B40343;
	Sun, 24 Mar 2024 14:58:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22B831BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 194EA60591
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63d3t00sLLk8 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30C4A6058F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30C4A6058F
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 196AB83AEA; Sun, 24 Mar 2024 14:58:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 15:43:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6dfeb165ee9170920e9a0b1f021170a736ac4d73
X-Git-Newrev: 2fda7322f999c551ad088458e661d1edd52b5b88
X-Patchwork-Hint: ignore
Message-Id: <20240324145836.196AB83AEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-plutotv: bump version to
 20.3.2-Nexus
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2fda7322f999c551ad088458e661d1edd52b5b88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 0c56c8b6b4..162905218c 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11505556200029a48a293e97f94e0469a5f78580d0e56d5d0a1da05d61f0f5b5  kodi-pvr-plutotv-20.3.1a-Nexus.tar.gz
+sha256  7bccc0001acb796aa706f8a1bcce2661fcb67a7f346420c691ee0461ab5aace8  kodi-pvr-plutotv-20.3.2-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index fadb47efaf..8a47d8c265 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 20.3.1a-Nexus
+KODI_PVR_PLUTOTV_VERSION = 20.3.2-Nexus
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
