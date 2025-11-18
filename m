Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0C4CEE35A
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 21:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59D3260E7C;
	Tue, 18 Nov 2025 21:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LD_0FvKAqBxY; Tue, 18 Nov 2025 21:12:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C962A60787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C962A60787;
	Tue, 18 Nov 2025 21:12:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32386160
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 21:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 183394083F
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 21:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REzvP-f1HFuO for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 21:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2446440836
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2446440836
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 21:12:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 058FF84F7B; Tue, 18 Nov 2025 21:12:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Nov 2025 22:03:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ce329692ab60da7fe7ccd52bf64a8c4802fb317
X-Git-Newrev: 2549e2b4feb2555d8e9e4c011c296f6fa87d9a89
X-Patchwork-Hint: ignore
Message-Id: <20251118211216.058FF84F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quazip: bump version to 1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=2549e2b4feb2555d8e9e4c011c296f6fa87d9a89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://github.com/stachenov/quazip/releases/tag/v1.5

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/quazip/quazip.hash | 2 +-
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 1c5c614caf..46346d0124 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  79633fd3a18e2d11a7d5c40c4c79c1786ba0c74b59ad752e8429746fe1781dd6  quazip-1.4.tar.gz
+sha256  405b72b6e76c8987ff41a762523b8f64876ba406d8a831d268ee0b63f1369582  quazip-1.5.tar.gz
 sha256  b455b21b0d31d6e51993f1fb7e0694c75fa0eb0519a9ea62e4815fcf48b140b0  COPYING
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index ac28792f20..06b702e732 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 1.4
+QUAZIP_VERSION = 1.5
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
