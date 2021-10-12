Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B3CC433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:33:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C7196103D
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 20:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C7196103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 571674053D;
	Tue, 12 Oct 2021 20:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qQKq0eBCYsnE; Tue, 12 Oct 2021 20:33:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38A14404A5;
	Tue, 12 Oct 2021 20:33:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 470361BF5A0
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 320404011D
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 20:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z7PCnzXFYIGu for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 20:33:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CACA4400CE
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 20:33:03 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout03.t-online.de (Postfix) with SMTP id C9A3E7734;
 Tue, 12 Oct 2021 22:31:43 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.193.128]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1maOQz-1bNFon0; Tue, 12 Oct 2021 22:31:37 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:38454)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1maOQy-000225-VM;
 Tue, 12 Oct 2021 22:31:37 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 22:31:35 +0200
Message-Id: <20211012203136.16834-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012203136.16834-1-bernd.kuhls@t-online.de>
References: <20211012203136.16834-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1634070697-0000146E-9E3D1B7C/0/0 CLEAN NORMAL
X-TOI-MSGID: 4f5e3228-59bd-4441-8346-f85494f409a7
Subject: [Buildroot] [PATCH 2/3] package/libva-utils: bump version to 2.13.0
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

Release notes: https://github.com/intel/libva-utils/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva-utils/libva-utils.hash | 6 +++---
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 967c350373..18a078dc1c 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva-utils/releases/download/2.12.0/libva-utils-2.12.0.tar.bz2.sha1sum
-sha1  734ad8d4e39bf90b5670224272489f1745024ae2  libva-utils-2.12.0.tar.bz2
+# From https://github.com/intel/libva-utils/releases/download/2.13.0/libva-utils-2.13.0.tar.bz2.sha1sum
+sha1  7ab945cf232387f762891f9e4f7a6cb41e0766e8  libva-utils-2.13.0.tar.bz2
 # Locally computed
-sha256  bbe49e68fbdf379acc769e4c1680a76be3e2b48020ca320edafaf7235b62cc44  libva-utils-2.12.0.tar.bz2
+sha256  db3ae0bd63c2a3f6ef498450c29ffc99c387ce611e1eb5db6a8da1f88845d612  libva-utils-2.13.0.tar.bz2
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index c75091c7c7..e6e31df8bd 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.12.0
+LIBVA_UTILS_VERSION = 2.13.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
