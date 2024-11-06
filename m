Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C94D59F6C
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 20:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68CF84075E;
	Wed,  6 Nov 2024 20:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2oI7m2Dsuaf; Wed,  6 Nov 2024 20:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38AAF40771
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38AAF40771;
	Wed,  6 Nov 2024 20:12:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 678183B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5433340282
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-4wJao9A-rH for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 20:12:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF6640260
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FF6640260
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 20:12:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39D1A85E00; Wed,  6 Nov 2024 20:12:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 20:59:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64884430074aa420be48d2e63665c36673aa5e4c
X-Git-Newrev: 5fa1952b72fb4fdb92cb8a7221562341237f6987
X-Patchwork-Hint: ignore
Message-Id: <20241106201216.39D1A85E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsolv: bump version to 0.7.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=5fa1952b72fb4fdb92cb8a7221562341237f6987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a change log since 0.7.25, see:
https://github.com/openSUSE/libsolv/blob/0.7.30/NEWS#L4

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsolv/libsolv.hash | 2 +-
 package/libsolv/libsolv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsolv/libsolv.hash b/package/libsolv/libsolv.hash
index b18a682ccf..97259ae93f 100644
--- a/package/libsolv/libsolv.hash
+++ b/package/libsolv/libsolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b382bba4196b19c36eb34e0ef02546c0b922be601c6f73390c9ab643895b656a  libsolv-0.7.25.tar.gz
+sha256  ce4aa2f0e3c5c9ab99dced6a1810af3f670f1b98892394edc68ccabe7b272133  libsolv-0.7.30.tar.gz
 sha256  57f15acfb29fbef7749779e096a5885c60b716633e34484a21bb717554c0198f  LICENSE.BSD
diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 2a9f1bf208..2317d3e663 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOLV_VERSION = 0.7.25
+LIBSOLV_VERSION = 0.7.30
 LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
 LIBSOLV_LICENSE = BSD-3-Clause
 LIBSOLV_LICENSE_FILES = LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
