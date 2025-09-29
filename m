Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D8ECAC5B0
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 19:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B4F5812EE;
	Mon, 29 Sep 2025 19:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdE90eZOBdw4; Mon, 29 Sep 2025 19:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C4EF8130E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C4EF8130E;
	Mon, 29 Sep 2025 19:11:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EB52CF
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84CBB40AAA
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAqEI7MnQEn7 for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 19:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDC3940AA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDC3940AA9
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 19:10:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBE5F86432; Mon, 29 Sep 2025 19:10:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Sep 2025 21:07:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89af3d53b0d2bd64d8c210afd55fed07c900e562
X-Git-Newrev: f9dc76a06d29cae2a9cab3a1ed396e3b87d30282
X-Patchwork-Hint: ignore
Message-Id: <20250929191056.CBE5F86432@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/empty: bump to version 0.6.23d
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9dc76a06d29cae2a9cab3a1ed396e3b87d30282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of COPYRIGHT (update in year with
https://sourceforge.net/p/empty/code/ci/bb26b085df1285570c386d2aa9f5e3bf2fb92ec5/)

Release notes:
https://sourceforge.net/p/empty/code/ci/master/tree/CHANGELOG

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/empty/empty.hash | 4 ++--
 package/empty/empty.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/empty/empty.hash b/package/empty/empty.hash
index 5c7daa0052..d621aa373f 100644
--- a/package/empty/empty.hash
+++ b/package/empty/empty.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8a7ca8c7099dc6d6743ac7eafc0be3b1f8991d2c8f20cf66ce900c7f08e010bd  empty-0.6.23c.tgz
-sha256  6433f4490a82b80ddac37f24cebfe8f3cd7de5686ebb9737281d47997a9941d6  COPYRIGHT
+sha256  9ad495d52b942e3fd858643536d8d12e282568214300954d4518d8c22b893585  empty-0.6.23d.tgz
+sha256  17e9dd2f3e7bd2d00879dbd5dc908f911e57483439c1ff4c9266e20aa491a9ae  COPYRIGHT
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index 24135b2f8d..81196e98ab 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMPTY_VERSION = 0.6.23c
+EMPTY_VERSION = 0.6.23d
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 EMPTY_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
