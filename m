Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6F9C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 17:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 454C842A63;
	Sat,  6 May 2023 17:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 454C842A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43I6kY6KcPv4; Sat,  6 May 2023 17:42:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 562DD42A5D;
	Sat,  6 May 2023 17:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 562DD42A5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2391BF369
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E596C40C17
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 17:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E596C40C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RZTz6TOWg2H for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 17:39:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 956BB40BFE
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 956BB40BFE
 for <buildroot@buildroot.org>; Sat,  6 May 2023 17:39:25 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout02.t-online.de (Postfix) with SMTP id 24A6195F9
 for <buildroot@buildroot.org>; Sat,  6 May 2023 19:39:23 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvLsM-25XgUD0; Sat, 6 May 2023 19:39:18 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:36596)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvLsL-0004jT-3A
 for buildroot@buildroot.org; Sat, 06 May 2023 19:39:18 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 19:38:58 +0200
Message-Id: <20230506173917.1112500-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683394758-AFFFCC11-6440A5E4/0/0 CLEAN NORMAL
X-TOI-MSGID: 8a166edb-19d7-4651-96f2-ebf3e4d59129
Subject: [Buildroot] [PATCH 03/22] package/x11r7/xapp_xcalc: bump version to
 1.1.2
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
https://lists.x.org/archives/xorg-announce/2023-May/003391.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xcalc/xapp_xcalc.hash | 6 +++---
 package/x11r7/xapp_xcalc/xapp_xcalc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.hash b/package/x11r7/xapp_xcalc/xapp_xcalc.hash
index 0580253dd6..12633a41a9 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.hash
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003138.html
-sha256  8cb08212c5322e8043f39b28699e13a43f000976c90b3c7fadd4fae2766326b4  xcalc-1.1.1.tar.xz
-sha512  a261e9798d62727f40b9aff07e68e63ba40aa7f4f9b1811d8efd8c3e73cd5912d6178c55ca3c059968191051bd20b889b06b5e92b3df70c7b5d09bd013b9ebdb  xcalc-1.1.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-May/003391.html
+sha256  8578dfa1457e94289f6d6ed6146714307d8a73a1b54d2f42af1321b625fc1cd4  xcalc-1.1.2.tar.xz
+sha512  51da677dc88bcd7299ed8d678cb26b048fdb82a1983e1496a06253ee2dceefca4ac87d1a74432b4a76dcc11921a61339bb3d292607be46228164140b430bbad2  xcalc-1.1.2.tar.xz
 # Locally computed
 sha256  8dd69dbec37866a41d3040c5c478aca46e0b50c30319f178064d5e2ed9d3f912  COPYING
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index 849746ece3..ffb724e39c 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCALC_VERSION = 1.1.1
+XAPP_XCALC_VERSION = 1.1.2
 XAPP_XCALC_SOURCE = xcalc-$(XAPP_XCALC_VERSION).tar.xz
 XAPP_XCALC_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XCALC_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
