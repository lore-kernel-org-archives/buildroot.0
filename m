Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1173AC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 08:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE8BE41DA2;
	Tue,  6 Feb 2024 08:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE8BE41DA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20ikaj403QQp; Tue,  6 Feb 2024 08:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E60C741E0C;
	Tue,  6 Feb 2024 08:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E60C741E0C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DDE21BF2BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9E3A610AB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9E3A610AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T71R5J-ZnpXh for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 08:17:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2039660BAC
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 08:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2039660BAC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F9B086EE4; Tue,  6 Feb 2024 08:17:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 09:16:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7ee5f3b0e3ef703bafd007cc99da10312d99b9e
X-Git-Newrev: 71d971fa3bba0528011b4c6419ebbdcd420cf493
X-Patchwork-Hint: ignore
Message-Id: <20240206081733.0F9B086EE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpio: bump to version 2.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=71d971fa3bba0528011b4c6419ebbdcd420cf493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00006.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cpio/cpio.hash | 6 +++---
 package/cpio/cpio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cpio/cpio.hash b/package/cpio/cpio.hash
index c67fbc1f61..e300a5f084 100644
--- a/package/cpio/cpio.hash
+++ b/package/cpio/cpio.hash
@@ -1,6 +1,6 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00001.html
-sha1  cbac50a61079b6f3bdcf9ffe42171d9257cfe877  cpio-2.14.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00006.html
+sha1  db5e3845eb5475ddcb7e8915c3a1458a0c13d787  cpio-2.15.tar.bz2
 # Locally calculated after checking pgp signature
-sha256  fcdc15d60f7267a6fc7efcd6b9db7b6c8966c4f2fbbb964c24d41336fd3f2c12  cpio-2.14.tar.bz2
+sha256  937610b97c329a1ec9268553fb780037bcfff0dcffe9725ebc4fd9c1aa9075db  cpio-2.15.tar.bz2
 # Locally calculated
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 911d16822b..452271c8f1 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPIO_VERSION = 2.14
+CPIO_VERSION = 2.15
 CPIO_SOURCE = cpio-$(CPIO_VERSION).tar.bz2
 CPIO_SITE = $(BR2_GNU_MIRROR)/cpio
 CPIO_CONF_OPTS = --bindir=/bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
