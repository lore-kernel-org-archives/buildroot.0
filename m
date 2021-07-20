Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A53BC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:15:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41A160EBC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F41A160EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDBE1608AB;
	Wed,  4 Aug 2021 00:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JpB_UKMNmgsV; Wed,  4 Aug 2021 00:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 276CB60A51;
	Wed,  4 Aug 2021 00:15:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5E291BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE4E340EFF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxbI503h0-9D for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B85D740457
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1C31085583; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:40:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 92785434cb1f52bcf79c7a1029bc532f010dbb27
X-Git-Newrev: 9d7368181136a6e6e71056e47e7cecfdb7cd6e4a
X-Patchwork-Hint: ignore
Message-Id: <20210803211012.1C31085583@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-intel: bump version
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9d7368181136a6e6e71056e47e7cecfdb7cd6e4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add --disable-tools for reproducable builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash | 2 +-
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index 4e41bda154..26002a7966 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e121871de0396caff0349d761033aa4c0618d27b1ad5d79dab6c8246d9fb50d1  xdriver_xf86-video-intel-5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc-br1.tar.gz
+sha256  11f48628d2b1f495446c49df93de40569ced664c6fdbd5d3f8f7a863e4a1124c  xdriver_xf86-video-intel-31486f40f8e8f8923ca0799aea84b58799754564-br1.tar.gz
 sha256  5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index ac598cf0fb..d911234c92 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 31486f40f8e8f8923ca0799aea84b58799754564
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
@@ -21,6 +21,7 @@ XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS = \
 	--enable-sna \
 	--disable-xaa \
 	--disable-dga \
+	--disable-tools \
 	--disable-async-swap
 
 XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
