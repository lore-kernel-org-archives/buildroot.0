Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB75CAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54C8D61566;
	Fri,  3 Oct 2025 20:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAiuOgOl3-WT; Fri,  3 Oct 2025 20:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 921F061561
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 921F061561;
	Fri,  3 Oct 2025 20:20:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F458226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1565F4067C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFzInoikSQDH for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 454EF406B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 454EF406B0
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:20:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33F308683A; Fri,  3 Oct 2025 20:20:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Oct 2025 22:18:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 018cf24c80090f1ef091ce1ac0d4a0a1dab3bec3
X-Git-Newrev: 114938f128584b622cc0103a28317e1b4c04dab5
X-Patchwork-Hint: ignore
Message-Id: <20251003202036.33F308683A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvidia-persistenced: bump to
 version 580.95.05
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

commit: https://git.buildroot.net/buildroot/commit/?id=114938f128584b622cc0103a28317e1b4c04dab5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nvidia-persistenced/nvidia-persistenced.hash | 2 +-
 package/nvidia-persistenced/nvidia-persistenced.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nvidia-persistenced/nvidia-persistenced.hash b/package/nvidia-persistenced/nvidia-persistenced.hash
index dc918f1a95..f564451015 100644
--- a/package/nvidia-persistenced/nvidia-persistenced.hash
+++ b/package/nvidia-persistenced/nvidia-persistenced.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e4b85c7ada85010212c45b84582f0af4aaed795335dcc7c0ceea9f274a8b7eb0  nvidia-persistenced-560.35.03.tar.gz
+sha256  ad4e54757c743256a8129c9b543eb6f2fb27cd6b7b20a5ac201330aed90aa1ab  nvidia-persistenced-580.95.05.tar.gz
 sha256  279d814320adc07ca5a4ee101a0b428ddf22a6f3513b8c051f9eb7be47b2e797  COPYING
diff --git a/package/nvidia-persistenced/nvidia-persistenced.mk b/package/nvidia-persistenced/nvidia-persistenced.mk
index 225c26fd3b..5dbc0c3b73 100644
--- a/package/nvidia-persistenced/nvidia-persistenced.mk
+++ b/package/nvidia-persistenced/nvidia-persistenced.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_PERSISTENCED_VERSION = 560.35.03
+NVIDIA_PERSISTENCED_VERSION = 580.95.05
 NVIDIA_PERSISTENCED_SITE = $(call github,NVIDIA,nvidia-persistenced,$(NVIDIA_PERSISTENCED_VERSION))
 NVIDIA_PERSISTENCED_LICENSE = MIT
 NVIDIA_PERSISTENCED_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
