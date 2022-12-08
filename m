Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA77BC001B2
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65A3E401AF;
	Thu,  8 Dec 2022 22:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65A3E401AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oa8rztIspjdS; Thu,  8 Dec 2022 22:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 655CF40108;
	Thu,  8 Dec 2022 22:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 655CF40108
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCC741BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C7FD820EC
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C7FD820EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aswLCBszVFLO for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41198820DE
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41198820DE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 23AD55A63
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-3PxxNs0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-0Q
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:04 +0100
Message-Id: <20221208223817.1088619-58-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-3C882535-936D2E87/0/0 CLEAN NORMAL
X-TOI-MSGID: 908989bd-7626-4fa8-8c78-9edbd26467ee
Subject: [Buildroot] [PATCH 57/70] package/x11r7/xapp_fstobdf: bump version
 to 1.0.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.x.org/archives/xorg-announce/2022-October/003215.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_fstobdf/xapp_fstobdf.hash | 5 +++--
 package/x11r7/xapp_fstobdf/xapp_fstobdf.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash b/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash
index a2f1425afb..956c3ef0e3 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2014-December/002511.html
-sha256  66cf550326c993e7043f260a8ec4a533a3bf9d8f0e7397a6fe9cca803732e92e  fstobdf-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003215.html
+sha256  2624cbf071ccca89c2a6dadd65004784f478b2ba1c62b8209e03909954f36b50  fstobdf-1.0.7.tar.xz
+sha512  b303cc2060e8ccaa139e855a7d377d28877158efa1087eeeebf9f30f7c9962764eceab5c4044b4b508890413cf38546da9b26756dd27a142b806dcd6fdb6ba59  fstobdf-1.0.7.tar.xz
 # Locally computed
 sha256  b76125d919ac2bfbff96955dec98b90729633b2df5fbfa2ad3f2e4376164febb  COPYING
diff --git a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
index e897514c80..989883d42e 100644
--- a/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
+++ b/package/x11r7/xapp_fstobdf/xapp_fstobdf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_FSTOBDF_VERSION = 1.0.6
-XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.bz2
-XAPP_FSTOBDF_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_FSTOBDF_VERSION = 1.0.7
+XAPP_FSTOBDF_SOURCE = fstobdf-$(XAPP_FSTOBDF_VERSION).tar.xz
+XAPP_FSTOBDF_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_FSTOBDF_LICENSE = MIT
 XAPP_FSTOBDF_LICENSE_FILES = COPYING
 XAPP_FSTOBDF_DEPENDENCIES = xlib_libFS xlib_libX11
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
