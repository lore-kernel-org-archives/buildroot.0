Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C0ECEBF86
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 21:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ADFD83E1A;
	Sat, 15 Nov 2025 21:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZSUQ7funWWZ; Sat, 15 Nov 2025 21:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6522E83E7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6522E83E7B;
	Sat, 15 Nov 2025 21:13:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4AFBD5
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A079860627
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgMr7o7gjlxh for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 21:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E78856060B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E78856060B
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 21:13:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D603C8464B; Sat, 15 Nov 2025 21:13:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 22:07:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 279cbbdb646e7136c4d8b3b5b44d9b4e31ed31dd
X-Git-Newrev: 9e790ad1a120481a0db456ed49efcd9039c2d2dc
X-Patchwork-Hint: ignore
Message-Id: <20251115211310.D603C8464B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netcat-openbsd: bump to version
 1.234
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e790ad1a120481a0db456ed49efcd9039c2d2dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash file for license (netcat.c) has changed due to copyright year
updates and changes not related to the license topic.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: fix license hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/netcat-openbsd/netcat-openbsd.hash | 8 ++++----
 package/netcat-openbsd/netcat-openbsd.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index 267e02f844..24ea97b11c 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,6 +1,6 @@
-# From https://snapshot.debian.org/archive/debian/20250429T083749Z/pool/main/n/netcat-openbsd/netcat-openbsd_1.229-1.dsc
-sha256  493e3973ffca7fedf0435e498bf18ebc934b1c3aa76db2b29cf80f98d9175a86  netcat-openbsd_1.229.orig.tar.gz
-sha256  c3bff4330a2fe1fbe384861eacbf4f6ad2c59912aa772efad07462644ed9d936  netcat-openbsd_1.229-1.debian.tar.xz
+# From https://snapshot.debian.org/archive/debian/20251023T202923Z/pool/main/n/netcat-openbsd/netcat-openbsd_1.234-1.dsc
+sha256  121c18d9441ec42b92a9b566468a596bbcf673894db8b12d892947552a8e3bbe  netcat-openbsd_1.234.orig.tar.gz
+sha256  008892553774e23a62f4088cdcbd4428f7b764a6cdadfcb35d1793224a697996  netcat-openbsd_1.234-1.debian.tar.xz
 
 # Hash for license file
-sha256  fe62c02c86f4cad7c5c031a1a5601fd2e37e7f2773def39bede8652fe51716bb  netcat.c
+sha256  01754270c331f18613f3d0ee960d4f900ee20a82fad1b0b39f0ed34a3863a78d  netcat.c
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index a5ea4727af..a8fff935ce 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = 1.229
+NETCAT_OPENBSD_VERSION = 1.234
 NETCAT_OPENBSD_SOURCE = netcat-openbsd_$(NETCAT_OPENBSD_VERSION).orig.tar.gz
 NETCAT_OPENBSD_PATCH = netcat-openbsd_$(NETCAT_OPENBSD_VERSION)-1.debian.tar.xz
-NETCAT_OPENBSD_SITE = https://snapshot.debian.org/archive/debian/20250429T083749Z/pool/main/n/netcat-openbsd
+NETCAT_OPENBSD_SITE = https://snapshot.debian.org/archive/debian/20251023T202923Z/pool/main/n/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = netcat.c
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
