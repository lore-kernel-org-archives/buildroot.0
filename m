Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA35C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 17:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F44606C6;
	Tue, 28 Jun 2022 17:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33F44606C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UeaH3vStzGW6; Tue, 28 Jun 2022 17:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E40F60AFB;
	Tue, 28 Jun 2022 17:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E40F60AFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3841BF82F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 17:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 479C8410E2
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 17:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 479C8410E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAhigQculkNh for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 17:56:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A626410DB
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A626410DB
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 17:56:25 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout12.t-online.de (Postfix) with SMTP id 37A7F1861
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 19:56:22 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.186.7]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o6FRk-1xgPp30; Tue, 28 Jun 2022 19:56:20 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:33868)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o6FRk-00046w-9U
 for buildroot@buildroot.org; Tue, 28 Jun 2022 19:56:20 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 19:56:20 +0200
Message-Id: <20220628175620.316034-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1656438980-01434903-D7B26E35/0/0 CLEAN NORMAL
X-TOI-MSGID: fc813968-617d-4d0e-9765-d62f824b8a72
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xcb-proto: bump version to
 1.15.2
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

Release notes:
https://lists.x.org/archives/xorg-announce/2022-June/003169.html
https://lists.x.org/archives/xorg-announce/2022-June/003170.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-proto/xcb-proto.hash | 6 +++---
 package/x11r7/xcb-proto/xcb-proto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.hash b/package/x11r7/xcb-proto/xcb-proto.hash
index 7007ff14de..1a49710d7a 100644
--- a/package/x11r7/xcb-proto/xcb-proto.hash
+++ b/package/x11r7/xcb-proto/xcb-proto.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-May/003163.html
-sha256  d34c3b264e8365d16fa9db49179cfa3e9952baaf9275badda0f413966b65955f  xcb-proto-1.15.tar.xz
-sha512  a333ac7c39f17ff2567419d09a9a77210c943a4e88d79eb152d416ae26bf6fb14e2446f9817abc806edd7aa3733bd4de5852b5ae90a25cbcc9d40e59c211aa36  xcb-proto-1.15.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-June/003170.html
+sha256  7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed  xcb-proto-1.15.2.tar.xz
+sha512  9d0b2f0a4dbbf2d64e32ff4658d1663e13d7e5f1bffc1e8d45be7b9dd5bab46e29fc1c2f6e66a7a569e374ba6756faf3c39b0b5e5560df6d7f8b68beec97659d  xcb-proto-1.15.2.tar.xz
 # Locally computed
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 1e25d43593..324b29427d 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.15
+XCB_PROTO_VERSION = 1.15.2
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.xz
 XCB_PROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XCB_PROTO_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
