Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8353C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A24783F65;
	Mon, 19 May 2025 10:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYCw2Hk2Ljbb; Mon, 19 May 2025 10:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E5E84709
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E5E84709;
	Mon, 19 May 2025 10:59:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42093E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE92842460
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-RNzEb78mMk for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F9CA41556
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F9CA41556
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68F21873D4; Mon, 19 May 2025 10:40:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 21:29:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c1d422edde19d07d6406705b1a4b059125dba689
X-Git-Newrev: 467aa8cd56a4b6e8cef0ec39ac8dff9928a40973
X-Patchwork-Hint: ignore
Message-Id: <20250519104002.68F21873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/netcat-openbsd: bump
 version to 1.229
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

commit: https://git.buildroot.net/buildroot/commit/?id=467aa8cd56a4b6e8cef0ec39ac8dff9928a40973
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/netcat-openbsd/netcat-openbsd.hash | 8 ++++----
 package/netcat-openbsd/netcat-openbsd.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index e55dea53e7..267e02f844 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,6 +1,6 @@
-# From http://snapshot.debian.org/archive/debian/20211206T030211Z/pool/main/n/netcat-openbsd/netcat-openbsd_1.218-3.dsc
-sha256  a28a5d39abaf481747b1e78b4b50e96d0cdab0ffef289cba156dc11941c64857  netcat-openbsd_1.218.orig.tar.gz
-sha256  19229ebc825d12cd805843228c498cc881dcef127a9d680fcfbd8cb2da966161  netcat-openbsd_1.218-3.debian.tar.xz
+# From https://snapshot.debian.org/archive/debian/20250429T083749Z/pool/main/n/netcat-openbsd/netcat-openbsd_1.229-1.dsc
+sha256  493e3973ffca7fedf0435e498bf18ebc934b1c3aa76db2b29cf80f98d9175a86  netcat-openbsd_1.229.orig.tar.gz
+sha256  c3bff4330a2fe1fbe384861eacbf4f6ad2c59912aa772efad07462644ed9d936  netcat-openbsd_1.229-1.debian.tar.xz
 
 # Hash for license file
-sha256  acfd1d822ee2e8e0b196c7a369383d0cb9bc131b56c3c95976a32498728fe1e3  netcat.c
+sha256  fe62c02c86f4cad7c5c031a1a5601fd2e37e7f2773def39bede8652fe51716bb  netcat.c
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index 311f8aa819..a5ea4727af 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = 1.218
+NETCAT_OPENBSD_VERSION = 1.229
 NETCAT_OPENBSD_SOURCE = netcat-openbsd_$(NETCAT_OPENBSD_VERSION).orig.tar.gz
-NETCAT_OPENBSD_PATCH = netcat-openbsd_$(NETCAT_OPENBSD_VERSION)-3.debian.tar.xz
-NETCAT_OPENBSD_SITE = http://snapshot.debian.org/archive/debian/20211206T030211Z/pool/main/n/netcat-openbsd
+NETCAT_OPENBSD_PATCH = netcat-openbsd_$(NETCAT_OPENBSD_VERSION)-1.debian.tar.xz
+NETCAT_OPENBSD_SITE = https://snapshot.debian.org/archive/debian/20250429T083749Z/pool/main/n/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = netcat.c
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
