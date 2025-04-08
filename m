Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7310DC369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 17:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 206A682C8E;
	Tue,  8 Apr 2025 17:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TntLI0StgBZf; Tue,  8 Apr 2025 17:33:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55E2282B08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55E2282B08;
	Tue,  8 Apr 2025 17:33:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65FE51F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A34440877
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNnI0FX1i9Qv for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 17:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB2554073E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB2554073E
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:33:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9E0683EA4; Tue,  8 Apr 2025 17:33:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 8 Apr 2025 19:21:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdffdcfdac3e8f7f99556765ef0226a8bb10c506
X-Git-Newrev: 593771fafc17d001438fa946b6885422e94bd769
X-Patchwork-Hint: ignore
Message-Id: <20250408173323.A9E0683EA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kmon: bump to version 1.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=593771fafc17d001438fa946b6885422e94bd769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change, but bump for consistency.

For details, see the release Notes:
https://github.com/orhun/kmon/releases/tag/v1.7.1

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kmon/kmon.hash | 2 +-
 package/kmon/kmon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmon/kmon.hash b/package/kmon/kmon.hash
index 96400977b8..1bf3830243 100644
--- a/package/kmon/kmon.hash
+++ b/package/kmon/kmon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e4723d733a2b6ad5f318a6bea77f973f3a9dbfdb727ba00352a13b9db0522194  kmon-1.6.5-cargo2.tar.gz
+sha256  54fc677b6ef9617802132d862f41a6d93bd473d119b888b454d223f0d307fd27  kmon-1.7.1-cargo2.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/kmon/kmon.mk b/package/kmon/kmon.mk
index afd996f376..a29282df98 100644
--- a/package/kmon/kmon.mk
+++ b/package/kmon/kmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMON_VERSION = 1.6.5
+KMON_VERSION = 1.7.1
 KMON_SITE = $(call github,orhun,kmon,v$(KMON_VERSION))
 KMON_LICENSE = GPL-3.0
 KMON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
