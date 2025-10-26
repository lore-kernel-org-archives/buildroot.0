Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A288FCCD1A5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 15:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2612C60AB6;
	Sun, 26 Oct 2025 15:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBwL2wcerBLH; Sun, 26 Oct 2025 15:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80CB360AA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80CB360AA8;
	Sun, 26 Oct 2025 15:51:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 267CCD7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10E7840DD0
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JiyKz8sDkD7Q for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 15:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D30D40DC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D30D40DC8
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 15:51:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DDF387934; Sun, 26 Oct 2025 15:51:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 16:47:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 172846b226b8cb068a49a2b57a05883f92428c17
X-Git-Newrev: 724bed5d4d032cd3e9371669d41dc3435652ed68
X-Patchwork-Hint: ignore
Message-Id: <20251026155112.0DDF387934@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsolv: bump version to 0.7.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=724bed5d4d032cd3e9371669d41dc3435652ed68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/openSUSE/libsolv/blob/0.7.35/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsolv/libsolv.hash | 2 +-
 package/libsolv/libsolv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsolv/libsolv.hash b/package/libsolv/libsolv.hash
index 97259ae93f..14726168a3 100644
--- a/package/libsolv/libsolv.hash
+++ b/package/libsolv/libsolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ce4aa2f0e3c5c9ab99dced6a1810af3f670f1b98892394edc68ccabe7b272133  libsolv-0.7.30.tar.gz
+sha256  e6ef552846f908beb3bbf6ca718b6dd431bd8a281086d82af9a6d2a3ba919be5  libsolv-0.7.35.tar.gz
 sha256  57f15acfb29fbef7749779e096a5885c60b716633e34484a21bb717554c0198f  LICENSE.BSD
diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 2317d3e663..2217ef499b 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOLV_VERSION = 0.7.30
+LIBSOLV_VERSION = 0.7.35
 LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
 LIBSOLV_LICENSE = BSD-3-Clause
 LIBSOLV_LICENSE_FILES = LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
