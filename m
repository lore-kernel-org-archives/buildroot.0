Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6060C83F26
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 21:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 750D2415D9;
	Mon, 21 Jul 2025 21:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h-X9pRimjcMv; Mon, 21 Jul 2025 21:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2E4140DFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2E4140DFD;
	Mon, 21 Jul 2025 21:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84170462
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AFE4410BC
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sp7tmB7Wb2E for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 21:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D1C740DFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D1C740DFD
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 21:01:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B91A869BE; Mon, 21 Jul 2025 21:01:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 22:28:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9c5dc024a0717b68b22a352f960d9dac099f73f
X-Git-Newrev: 958736773acaad7300bb26637673fc71143d1316
X-Patchwork-Hint: ignore
Message-Id: <20250721210132.8B91A869BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189es: bump to version
 2025-06-21
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=958736773acaad7300bb26637673fc71143d1316
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this version we can build with Linux 6.15.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: remove empty line in hash file to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 28dedca8d3..7f8d18a56e 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  85aa06192594d8e5885eaec72e3792c7816f714d682897ff0cbd0ba48a134dcc  rtl8189es-fcf2a5746e6fe11d9d71337ee5dac6cf43423a97.tar.gz
+sha256  a6a7455bb1533add9ebb3afa8634d85644bcdb76279020b663e6a3f03681aaff  rtl8189es-07f03cf721f5e0317012ece4159834327680ba8b.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 49a6ddfd1a..b60b08fe34 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = fcf2a5746e6fe11d9d71337ee5dac6cf43423a97
+RTL8189ES_VERSION = 07f03cf721f5e0317012ece4159834327680ba8b
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
