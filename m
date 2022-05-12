Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1F0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 18:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3586A82D40;
	Thu, 12 May 2022 18:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G34S0GxqrjMN; Thu, 12 May 2022 18:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51E0181902;
	Thu, 12 May 2022 18:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6451F1BF578
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CB0060AC1
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 18:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYB3OOCtoHab for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 18:53:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 803EB607F0
 for <buildroot@buildroot.org>; Thu, 12 May 2022 18:53:59 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout03.t-online.de (Postfix) with SMTP id A59E73D79
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:53:57 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.203.41]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npDwj-0Sp6qk0; Thu, 12 May 2022 20:53:57 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:48510)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npDwj-0004aZ-2O
 for buildroot@buildroot.org; Thu, 12 May 2022 20:53:57 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 20:53:54 +0200
Message-Id: <20220512185355.873825-24-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220512185355.873825-1-bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652381637-0001606D-EC37E26F/0/0 CLEAN NORMAL
X-TOI-MSGID: becb5976-c038-41db-b63c-d07802373c7b
Subject: [Buildroot] [PATCH 24/25] package/x11r7/xcb-proto: bump version to
 1.15
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
https://lists.x.org/archives/xorg-announce/2022-May/003163.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-proto/xcb-proto.hash | 6 +++---
 package/x11r7/xcb-proto/xcb-proto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.hash b/package/x11r7/xcb-proto/xcb-proto.hash
index e6bc2379bf..7007ff14de 100644
--- a/package/x11r7/xcb-proto/xcb-proto.hash
+++ b/package/x11r7/xcb-proto/xcb-proto.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-October/003061.html
-sha256  f04add9a972ac334ea11d9d7eb4fc7f8883835da3e4859c9afa971efdf57fcc3  xcb-proto-1.14.1.tar.xz
-sha512  140fbf48483bacc7f6b70fdcf76f9e4ff0e87df9cb3a071cea47d8fe4574407cdefcfbd674099014d297e5fc010748e71d8609fca4cc32e8b25c634f928b727d  xcb-proto-1.14.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-May/003163.html
+sha256  d34c3b264e8365d16fa9db49179cfa3e9952baaf9275badda0f413966b65955f  xcb-proto-1.15.tar.xz
+sha512  a333ac7c39f17ff2567419d09a9a77210c943a4e88d79eb152d416ae26bf6fb14e2446f9817abc806edd7aa3733bd4de5852b5ae90a25cbcc9d40e59c211aa36  xcb-proto-1.15.tar.xz
 # Locally computed
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 64190c817f..1e25d43593 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.14.1
+XCB_PROTO_VERSION = 1.15
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.xz
 XCB_PROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XCB_PROTO_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
