Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA868C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 15:29:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3749C60F6F
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 15:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3749C60F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D610940822;
	Fri, 15 Oct 2021 15:29:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UEMNj6SJNmp; Fri, 15 Oct 2021 15:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FA6D404D1;
	Fri, 15 Oct 2021 15:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0EBC1BF378
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 15:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CB2D4059F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 15:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BmFb3yQAb48b for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 15:29:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CC0F400BB
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 15:29:18 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout06.t-online.de (Postfix) with SMTP id F41AE1EA2B;
 Fri, 15 Oct 2021 17:29:15 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.253]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mbP91-0BkQYT0; Fri, 15 Oct 2021 17:29:15 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:35128)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mbP91-0003bV-C6;
 Fri, 15 Oct 2021 17:29:15 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 17:29:15 +0200
Message-Id: <20211015152915.1018670-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1634311755-000010D9-6A5ED527/0/0 CLEAN NORMAL
X-TOI-MSGID: a93fa1a4-5cf9-4e63-b949-e0c5cc30dec3
Subject: [Buildroot] [PATCH 1/1] package/intel-mediasdk: bump version to
 21.3.5
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/Intel-Media-SDK/MediaSDK/releases/tag/intel-mediasdk-21.3.5

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/intel-mediasdk/intel-mediasdk.hash | 2 +-
 package/intel-mediasdk/intel-mediasdk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index 0108f56e77..8143867995 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  593ec057ba619e55af8c0b1fcd265a567f2846748ad6aedcc0838425c0339163  intel-mediasdk-21.3.3.tar.gz
+sha256  3f13869298d3946d7d91e58846e274ef62cd5af2473f59f36b57b2c27ebfd87c  intel-mediasdk-21.3.5.tar.gz
 sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index 5475a0e8b1..a0492412e8 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 21.3.3
+INTEL_MEDIASDK_VERSION = 21.3.5
 INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
