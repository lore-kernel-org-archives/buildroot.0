Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DDFC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CA1D4F157;
	Mon, 20 Feb 2023 22:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CA1D4F157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9dXLC6TxWQK; Mon, 20 Feb 2023 22:35:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70AB64F153;
	Mon, 20 Feb 2023 22:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70AB64F153
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2DC21BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A20F611BE
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A20F611BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLh0Z1lYc61q for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71EC2611C1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71EC2611C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61C6D828C8; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:45:59 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 260924e239627cbe1379cfc752939245d53a06e0
X-Git-Newrev: c5a009920f0a79ecfcfa2778a61e4a49cdd4d6b3
X-Patchwork-Hint: ignore
Message-Id: <20230220205205.61C6D828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/autoconf-archive: bump
 to version 2022.09.03
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c5a009920f0a79ecfcfa2778a61e4a49cdd4d6b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/autoconf-archive/autoconf-archive.hash | 2 +-
 package/autoconf-archive/autoconf-archive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index 79ee5ff68a..ff7710dc2b 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,4 +1,4 @@
 # Computed locally
-sha256  e8a6eb9d28ddcba8ffef3fa211653239e9bf239aba6a01a6b7cfc7ceaec69cbd  autoconf-archive-2021.02.19.tar.xz
+sha256  e07454f00d8cae7907bed42d0747798927809947684d94c37207a4d63a32f423  autoconf-archive-2022.09.03.tar.xz
 sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
 sha256  23ed0b84fa023bfa33433b498192cd08a3bfb1f4864a8ed791a84f3eb48b2dd2  COPYING.EXCEPTION
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index bd4a09d96d..0ffdf61ddf 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2021.02.19
+AUTOCONF_ARCHIVE_VERSION = 2022.09.03
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPL-3.0+ with exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
