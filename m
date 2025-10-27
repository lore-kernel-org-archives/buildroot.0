Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C875CCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 22:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96AA66145B;
	Mon, 27 Oct 2025 22:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KtLDwXnGG21c; Mon, 27 Oct 2025 22:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 719C961458
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 719C961458;
	Mon, 27 Oct 2025 22:25:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7317470B
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 22:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 643B861458
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 22:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3M_pSIzC5Yb for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 22:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 899F761457
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 899F761457
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 22:25:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8308D86B6C; Mon, 27 Oct 2025 22:25:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 23:25:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b3b2d1b727596085e5993da559eb8e17e2c5727
X-Git-Newrev: 154f6694f641de1b9971ecd161644197526295d2
X-Patchwork-Hint: ignore
Message-Id: <20251027222549.8308D86B6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lynis: bump to version 3.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=154f6694f641de1b9971ecd161644197526295d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://github.com/CISOfy/lynis/releases/tag/3.1.6

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lynis/lynis.hash | 2 +-
 package/lynis/lynis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lynis/lynis.hash b/package/lynis/lynis.hash
index 3e387e2c0b..a8b1d87a0a 100644
--- a/package/lynis/lynis.hash
+++ b/package/lynis/lynis.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  02e16e452a926b6dbae5bfc28b0592d42c8af24c572180f444ac865e0e4f4bce  lynis-3.1.5.tar.gz
+sha256  2a31e3e028d6b9f0e8f502402ad6752b069f9082893514c8c023962f5786b3b6  lynis-3.1.6.tar.gz
 sha256  57151f0fa287550534af08facb1c6693ca803ffa65b512da38b55c3130810bcf  LICENSE
diff --git a/package/lynis/lynis.mk b/package/lynis/lynis.mk
index d6b3371e6d..d630182732 100644
--- a/package/lynis/lynis.mk
+++ b/package/lynis/lynis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LYNIS_VERSION = 3.1.5
+LYNIS_VERSION = 3.1.6
 LYNIS_SITE = $(call github,CISOfy,lynis,$(LYNIS_VERSION))
 LYNIS_LICENSE = GPL-3.0
 LYNIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
