Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B1BCCFA18
	for <buildroot@archiver.kernel.org>; Sat,  8 Nov 2025 10:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3F566071B;
	Sat,  8 Nov 2025 10:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ns5TWRX2zC8; Sat,  8 Nov 2025 10:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA0B06075D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA0B06075D;
	Sat,  8 Nov 2025 10:16:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BD7725D
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6CF440231
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbSBH6xOMg9w for <buildroot@buildroot.org>;
 Sat,  8 Nov 2025 10:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96A464025E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96A464025E
 for <buildroot@buildroot.org>; Sat,  8 Nov 2025 10:16:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85D6883F2A; Sat,  8 Nov 2025 10:16:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Nov 2025 23:27:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8bf78911576672443a8d11eaf99bed4d383acef
X-Git-Newrev: 62185b79350ae825849853fcb4baf0923ff89fdd
X-Patchwork-Hint: ignore
Message-Id: <20251108101651.85D6883F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fmt: bump to version 12.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=62185b79350ae825849853fcb4baf0923ff89fdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes:

https://github.com/fmtlib/fmt/releases/tag/12.1.0
https://github.com/fmtlib/fmt/releases/tag/12.0.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 29b2b13c66..76bdd3171b 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  203eb4e8aa0d746c62d8f903df58e0419e3751591bb53ff971096eaa0ebd4ec3  fmt-11.2.0.zip
+sha256  695fd197fa5aff8fc67b5f2bbc110490a875cdf7a41686ac8512fb480fa8ada7  fmt-12.1.0.zip
 sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  LICENSE
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index dfb6fd3942..7d11cfddc3 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 11.2.0
+FMT_VERSION = 12.1.0
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
