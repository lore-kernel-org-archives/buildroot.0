Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DACC433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:12:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD8DC60ED4
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD8DC60ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76B2A827AF;
	Fri, 12 Nov 2021 22:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSfil5bafMsw; Fri, 12 Nov 2021 22:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF67A827B1;
	Fri, 12 Nov 2021 22:12:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D7A11BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89C7560744
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEeeJaMvK_Q8 for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:12:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEFBF6072D
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6B7B58C5F4; Fri, 12 Nov 2021 22:08:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 23:09:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1f051ef2e8f7ffd9291fe7b6db2a384d6eb788c7
X-Git-Newrev: 76875989326d9122db272c1a0f49b92961c3f2af
X-Patchwork-Hint: ignore
Message-Id: <20211112220833.6B7B58C5F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rpi-userland: bump
 version to bab9bf8
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

commit: https://git.buildroot.net/buildroot/commit/?id=76875989326d9122db272c1a0f49b92961c3f2af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog (since 6e8f786):

  - 7f72bc2 userland: Reduce debug_sym error messages
  - 0093675 interface/vcos: Get rid of LLTHREAD cast warning
  - 705ff8e hello_fft: Update outdated link to V3D spec
  - bab9bf8 hello_fft: Remove unused function declaration

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 4927a8b43b..da573f3eae 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8  rpi-userland-6e8f786db223c2ab6eb9098a5cb0e5e1b25281cd.tar.gz
+sha256  e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8  rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index a670a4a02d..09a7f6af74 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 6e8f786db223c2ab6eb9098a5cb0e5e1b25281cd
+RPI_USERLAND_VERSION = bab9bf8790cd69660d443ce43b4e372999f3f7ac
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
