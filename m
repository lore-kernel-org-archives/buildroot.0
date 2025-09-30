Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E3BCCA471
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A5561469;
	Wed,  1 Oct 2025 20:01:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqGyms0pnbmx; Wed,  1 Oct 2025 20:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80BA96146D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80BA96146D;
	Wed,  1 Oct 2025 20:01:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CF8CE04
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F28741203
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29fEdBk81MeR for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 438A5411F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 438A5411F1
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FC9B866FC; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 10:20:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7427ac713802e4181ab6ef16743a47b479a2951b
X-Git-Newrev: 2081d05a9543ee71c7b179001d961873b3d38b28
X-Patchwork-Hint: ignore
Message-Id: <20251001200129.2FC9B866FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cups: bump to
 version 2.4.12
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2081d05a9543ee71c7b179001d961873b3d38b28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Changelog:
https://github.com/OpenPrinting/cups/releases/tag/v2.4.12
https://github.com/OpenPrinting/cups/blob/v2.4.12/CHANGES.md

This commit also updates the NOTICE license file hash, after a year
update in upstream commit:
https://github.com/OpenPrinting/cups/commit/9bf6404b52301ccb3bce48e927195c352ad59ffd

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
[Julien:
 - add link to CHANGES.md
 - add comment about license hash change in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f6be007591f504516fef6434e29c2ca9246ac5a7)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/cups/cups.hash | 4 ++--
 package/cups/cups.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index f826f96fe7..e363a761eb 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  9a88fe1da3a29a917c3fc67ce6eb3178399d68e1a548c6d86c70d9b13651fd71  cups-2.4.11-source.tar.gz
+sha256  b1dde191a4ae2760c47220c82ca6155a28c382701e6c1a0159d1054990231d59  cups-2.4.12-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
-sha256  5320b6e3c252423e4153eb2dd63e57e3b630afb21139f44e43b02d85fe33e279  NOTICE
+sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 31899114ef..21fe6a7c5e 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.11
+CUPS_VERSION = 2.4.12
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
