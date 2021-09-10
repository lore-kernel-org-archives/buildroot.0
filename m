Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DF8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E81D611F0
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E81D611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B32284AAD;
	Fri, 10 Sep 2021 21:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TugZhbHXwFAo; Fri, 10 Sep 2021 21:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B98384AA4;
	Fri, 10 Sep 2021 21:34:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD901C1127
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C2B64067B
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1N_0oEGHAWQN for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 21:34:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D0FE40678
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 21:34:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 122C988EAA; Fri, 10 Sep 2021 21:32:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 23:00:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0512910e4901edcb78bb1daa4eb3be9bdc4dc8a9
X-Git-Newrev: bcfc5df394cfdfb20bfc3f14e887e5462b8909f4
X-Patchwork-Hint: ignore
Message-Id: <20210910213231.122C988EAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-plugins-bayer2rgb-neon: bump
 to 0.6.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2285062859412047592=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============2285062859412047592==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bcfc5df394cfdfb20bfc3f14e887e5462b8909f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update SITE to be synced with bayer2rgb-neon.
Use git as METHOD because no tarball is available for this version.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in            | 2 +-
 .../gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash    | 4 ++--
 .../gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk      | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
index b7cac08d7d..d3eec30c7a 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/Config.in
@@ -12,7 +12,7 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_BAYER2RGB_NEON
 	  decode raw camera bayer to RGB using
 	  NEON hardware acceleration.
 
-	  https://git.phytec.de/gst-bayer2rgb-neon
+	  https://gitlab-ext.sigma-chemnitz.de/ensc/gst-bayer2rgb-neon
 
 comment "gst1-plugins-bayer2rgb-neon needs a toolchain w/ C++, dynamic library, gcc >= 4.9"
 	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
index cfb62b062a..e626d0ba8d 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 307725640203083df7dfb7f9c2b8bb9583accf7b8c06238dd92d6150a9fd8b04 gst-bayer2rgb-neon-0.4.tar.bz2
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
+sha256  76b2135a23f465f789ccb86bd3a8190a1e30f86cdb28abfac4d9a2cdece63fa2  gst1-plugins-bayer2rgb-neon-b630798efcd611879e7cb1c246052e5ba1acc41d-br1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
index 5139463ca1..815099e315 100644
--- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
+++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAYER2RGB_NEON_VERSION = 0.4
-GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
-GST1_PLUGINS_BAYER2RGB_NEON_SITE = https://git.phytec.de/gst-bayer2rgb-neon/snapshot
+GST1_PLUGINS_BAYER2RGB_NEON_VERSION = b630798efcd611879e7cb1c246052e5ba1acc41d
+GST1_PLUGINS_BAYER2RGB_NEON_SITE = https://gitlab-ext.sigma-chemnitz.de/ensc/gst-bayer2rgb-neon.git
+GST1_PLUGINS_BAYER2RGB_NEON_SITE_METHOD = git
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0
 GST1_PLUGINS_BAYER2RGB_NEON_LICENSE_FILES = COPYING
 

--===============2285062859412047592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2285062859412047592==--
