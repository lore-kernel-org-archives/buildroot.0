Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47282C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 10:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EA61600C4;
	Tue,  4 Feb 2025 10:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjYdbCDzNV4s; Tue,  4 Feb 2025 10:53:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BE8660876
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE8660876;
	Tue,  4 Feb 2025 10:53:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F55012A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1350E40621
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q4AfuEmihhVK for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 10:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F08E8402E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F08E8402E7
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 10:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7EB386B5D; Tue,  4 Feb 2025 10:53:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 11:52:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3811f53024fcb5b8ba997cd87981a35817d795e
X-Git-Newrev: 4def253882ff2b16ddaff9bcaf75c15c82a7dd9f
X-Patchwork-Hint: ignore
Message-Id: <20250204105307.E7EB386B5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils-bare-metal: bump to
 version 2.44
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

commit: https://git.buildroot.net/buildroot/commit/?id=4def253882ff2b16ddaff9bcaf75c15c82a7dd9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump binutils-bare-metal to version 2.44.

Release notes:
https://sourceware.org/pipermail/binutils/2025-February/139195.html

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/binutils-bare-metal/2.43.1                 | 1 -
 package/binutils-bare-metal/2.44                   | 1 +
 package/binutils-bare-metal/binutils-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils-bare-metal/2.43.1 b/package/binutils-bare-metal/2.43.1
deleted file mode 120000
index f605915e35..0000000000
--- a/package/binutils-bare-metal/2.43.1
+++ /dev/null
@@ -1 +0,0 @@
-../binutils/2.43.1/
\ No newline at end of file
diff --git a/package/binutils-bare-metal/2.44 b/package/binutils-bare-metal/2.44
new file mode 120000
index 0000000000..b8164295cf
--- /dev/null
+++ b/package/binutils-bare-metal/2.44
@@ -0,0 +1 @@
+../binutils/2.44
\ No newline at end of file
diff --git a/package/binutils-bare-metal/binutils-bare-metal.mk b/package/binutils-bare-metal/binutils-bare-metal.mk
index 97a242a6f2..3525e9fdf2 100644
--- a/package/binutils-bare-metal/binutils-bare-metal.mk
+++ b/package/binutils-bare-metal/binutils-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BINUTILS_BARE_METAL_VERSION = 2.43.1
+BINUTILS_BARE_METAL_VERSION = 2.44
 BINUTILS_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/binutils
 BINUTILS_BARE_METAL_SOURCE = binutils-$(BINUTILS_BARE_METAL_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
