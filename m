Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232A7C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 19:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA5F260672;
	Tue, 13 May 2025 19:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDx5-cInn0r3; Tue, 13 May 2025 19:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1992360B91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1992360B91;
	Tue, 13 May 2025 19:35:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE228150
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF46840F61
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iENTtwJUumuk for <buildroot@buildroot.org>;
 Tue, 13 May 2025 19:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22ED340193
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22ED340193
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:35:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1233C8682C; Tue, 13 May 2025 19:35:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 21:29:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1d422edde19d07d6406705b1a4b059125dba689
X-Git-Newrev: 467aa8cd56a4b6e8cef0ec39ac8dff9928a40973
X-Patchwork-Hint: ignore
Message-Id: <20250513193509.1233C8682C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netcat-openbsd: bump version to
 1.229
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
