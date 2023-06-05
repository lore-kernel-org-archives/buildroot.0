Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8EAC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 11:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92A260FA0;
	Mon,  5 Jun 2023 11:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B92A260FA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2SpyLAyHFR4; Mon,  5 Jun 2023 11:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D697660FB1;
	Mon,  5 Jun 2023 11:48:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D697660FB1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 359671BF95D
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0307401E1
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 11:45:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0307401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ptRGvY7QBiV6 for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 11:45:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8CA4400D8
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 11:45:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8CA4400D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C562986C79; Mon,  5 Jun 2023 11:45:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 13:06:17 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8f059f406b823237e32004ed1fd01e3906d030f5
X-Git-Newrev: 23db85f782e59e18e622937a4da03e61956243cb
X-Patchwork-Hint: ignore
Message-Id: <20230605114518.C562986C79@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/x11r7/xapp_xcalc:
 bump version to 1.1.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=23db85f782e59e18e622937a4da03e61956243cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2023-May/003391.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e07901f5e74c0d97a98a69dae4aad5014bb6983b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
