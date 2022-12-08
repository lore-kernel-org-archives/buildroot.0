Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF06C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 22:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24DCC40108;
	Thu,  8 Dec 2022 22:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24DCC40108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gsr5uyUHmfzt; Thu,  8 Dec 2022 22:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22E23401B7;
	Thu,  8 Dec 2022 22:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22E23401B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1520A1BF35F
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09543403A5
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 22:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09543403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MdtzVCAVdUF for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29FA940465
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29FA940465
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 22:38:39 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout04.t-online.de (Postfix) with SMTP id 220A05A62
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 23:38:34 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.203.244]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p3PX3-3PxxNr0; Thu, 8 Dec 2022 23:38:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35946)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p3PX3-00048i-00
 for buildroot@buildroot.org; Thu, 08 Dec 2022 23:38:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 23:38:02 +0100
Message-Id: <20221208223817.1088619-56-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
References: <20221208223817.1088619-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670539101-3C882535-FA026AA7/0/0 CLEAN NORMAL
X-TOI-MSGID: fbff95cb-7ecb-4454-9c22-8e317235b9f9
Subject: [Buildroot] [PATCH 55/70] package/x11r7/xapp_smproxy: bump version
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

https://lists.x.org/archives/xorg-announce/2022-October/003218.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_smproxy/xapp_smproxy.hash | 5 +++--
 package/x11r7/xapp_smproxy/xapp_smproxy.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.hash b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
index db9dd27af3..587864baf7 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.hash
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002564.html
-sha256  6cf19155a2752237f36dbf8bc4184465ea190d2652f887faccb4e2a6ebf77266  smproxy-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003218.html
+sha256  4aa99237cc9dab7d87ce9bc7cca4116674a853b5f08dfe3f9db1bb2b2cf9f305  smproxy-1.0.7.tar.xz
+sha512  cd6a6933b74f76ae65fb16504e57871724bc1102eae1d02e801e99c3fe73fe44e27f87cef3fbf9f75f369d18197b53bb677d637d94cc8185b55acae0cbd44f21  smproxy-1.0.7.tar.xz
 # Locally computed
 sha256  92dce6d8a1fcc0c6b5e56dc44e431e7f73bfa2ed5e83295662aa314067a671d8  COPYING
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index f51c1ec090..f76752941c 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_SMPROXY_VERSION = 1.0.6
-XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
-XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SMPROXY_VERSION = 1.0.7
+XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.xz
+XAPP_SMPROXY_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SMPROXY_LICENSE = MIT
 XAPP_SMPROXY_LICENSE_FILES = COPYING
 XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
