Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A41FC3ABBE
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 21:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DDA840895;
	Tue,  6 May 2025 21:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ziDRdS8vYgUU; Tue,  6 May 2025 21:03:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C13AC4076F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C13AC4076F;
	Tue,  6 May 2025 21:03:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C90DEDF
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C40B81E4A
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2bnaNUCLxHJ for <buildroot@buildroot.org>;
 Tue,  6 May 2025 21:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA0381DE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DA0381DE9
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:03:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C0CE8645A; Tue,  6 May 2025 21:03:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 May 2025 22:47:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 683681261b19a0ea541e55ae7d5497ccf05e40a9
X-Git-Newrev: 64e8683f14c4392485de15e7b34642abce6ff88a
X-Patchwork-Hint: ignore
Message-Id: <20250506210302.7C0CE8645A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189es: bump to version
 2025-02-24
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=64e8683f14c4392485de15e7b34642abce6ff88a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this version we can build with Linux 6.14.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 4b176b56a5..28dedca8d3 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  12bbf8e8c67722f6d350727aea3e9aeadfa9234e64756f3342fd3aac417a88f4  rtl8189es-6b4cfb5c37f10c099d330ece54436706161c2f2e.tar.gz
+sha256  85aa06192594d8e5885eaec72e3792c7816f714d682897ff0cbd0ba48a134dcc  rtl8189es-fcf2a5746e6fe11d9d71337ee5dac6cf43423a97.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index cbbfebe675..49a6ddfd1a 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = 6b4cfb5c37f10c099d330ece54436706161c2f2e
+RTL8189ES_VERSION = fcf2a5746e6fe11d9d71337ee5dac6cf43423a97
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
