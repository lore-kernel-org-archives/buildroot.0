Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847D3C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1729442EBD;
	Fri, 28 Feb 2025 16:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-IVQZkKcLIM; Fri, 28 Feb 2025 16:41:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C81114F706
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C81114F706;
	Fri, 28 Feb 2025 16:41:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0613D68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ADC64263F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kknSlVJBPd4B for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2419E42473
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2419E42473
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20E0A820F8; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 21:24:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b4bffa0c9bd9521d648d8d8ccad22d1ca3c83bf0
X-Git-Newrev: fbb4844409fb37b4298815f9e72112e3108758e8
X-Patchwork-Hint: ignore
Message-Id: <20250228162943.20E0A820F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nvidia-persistenced:
 bump to version 560.35.03
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbb4844409fb37b4298815f9e72112e3108758e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nvidia-persistenced/nvidia-persistenced.hash | 2 +-
 package/nvidia-persistenced/nvidia-persistenced.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nvidia-persistenced/nvidia-persistenced.hash b/package/nvidia-persistenced/nvidia-persistenced.hash
index 06c71b35f5..dc918f1a95 100644
--- a/package/nvidia-persistenced/nvidia-persistenced.hash
+++ b/package/nvidia-persistenced/nvidia-persistenced.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b84fb8eb86127a725d0134a2c64a64e7844e125dece137e7fe8adf8a33cbe817  nvidia-persistenced-515.48.07.tar.gz
+sha256  e4b85c7ada85010212c45b84582f0af4aaed795335dcc7c0ceea9f274a8b7eb0  nvidia-persistenced-560.35.03.tar.gz
 sha256  279d814320adc07ca5a4ee101a0b428ddf22a6f3513b8c051f9eb7be47b2e797  COPYING
diff --git a/package/nvidia-persistenced/nvidia-persistenced.mk b/package/nvidia-persistenced/nvidia-persistenced.mk
index 662d4d4349..225c26fd3b 100644
--- a/package/nvidia-persistenced/nvidia-persistenced.mk
+++ b/package/nvidia-persistenced/nvidia-persistenced.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVIDIA_PERSISTENCED_VERSION = 515.48.07
+NVIDIA_PERSISTENCED_VERSION = 560.35.03
 NVIDIA_PERSISTENCED_SITE = $(call github,NVIDIA,nvidia-persistenced,$(NVIDIA_PERSISTENCED_VERSION))
 NVIDIA_PERSISTENCED_LICENSE = MIT
 NVIDIA_PERSISTENCED_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
