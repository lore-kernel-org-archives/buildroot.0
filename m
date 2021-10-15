Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39428C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 15:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61B4661037
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 15:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61B4661037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D72581518;
	Fri, 15 Oct 2021 15:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id geEBddr_FI2L; Fri, 15 Oct 2021 15:35:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FEC180C97;
	Fri, 15 Oct 2021 15:35:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DEE7F1BF378
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 15:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE40B6075E
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 15:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jb1czPepp248 for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 15:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEEF460726
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 15:35:02 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout03.t-online.de (Postfix) with SMTP id 4110D46B5;
 Fri, 15 Oct 2021 17:32:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.253]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mbPC6-39i98T0; Fri, 15 Oct 2021 17:32:26 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:35130)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mbPC5-00048S-HL;
 Fri, 15 Oct 2021 17:32:25 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 17:32:25 +0200
Message-Id: <20211015153225.1023067-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1634311946-00001460-31443532/0/0 CLEAN NORMAL
X-TOI-MSGID: 92171cbe-3226-4fa7-b87c-ebf31bbe0a59
Subject: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.11.0
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
Cc: Spenser Gilliland <spenser@gillilanding.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/webmproject/libvpx/blob/master/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libvpx/libvpx.hash | 2 +-
 package/libvpx/libvpx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index 5b9568837c..4e9bd91dee 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  85803ccbdbdd7a3b03d930187cb055f1353596969c1f92ebec2db839fa4f834a  libvpx-1.10.0.tar.gz
+sha256  965e51c91ad9851e2337aebcc0f517440c637c506f3a03948062e3d5ea129a83  libvpx-1.11.0.tar.gz
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 6ad558bc99..ece1ad2cb8 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.10.0
+LIBVPX_VERSION = 1.11.0
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
