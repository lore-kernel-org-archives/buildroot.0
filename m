Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE1CC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CFA8409E6;
	Fri, 16 May 2025 11:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fknJ7PtyM-4m; Fri, 16 May 2025 11:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 568D841998
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 568D841998;
	Fri, 16 May 2025 11:22:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F90713D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34CC740AEA
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fpgJUsaXkfQn for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00F9C402A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00F9C402A7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1BB3869EB; Fri, 16 May 2025 11:21:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 17:22:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6ea7024a34d4e7f994a7d9ded573c340c8adba1e
X-Git-Newrev: f62d80c3e7f879895eee423ef15281149159384d
X-Patchwork-Hint: ignore
Message-Id: <20250516112153.E1BB3869EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dnsmasq: bump
 version to 2.91
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f62d80c3e7f879895eee423ef15281149159384d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG

Release notes:
https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2025q1/018079.html

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 3db7e675d5c13b3e64abc0f1934d307f0a8c67b3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index d11e8af590..212774cd10 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.90.tar.xz.asc
-sha256  8e50309bd837bfec9649a812e066c09b6988b73d749b7d293c06c57d46a109e4  dnsmasq-2.90.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.91.tar.xz.asc
+sha256  f622682848b33677adb2b6ad08264618a2ae0a01da486a93fd8cd91186b3d153  dnsmasq-2.91.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 5dd7ed5c21..abeee36ce4 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.90
+DNSMASQ_VERSION = 2.91
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
