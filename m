Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D91C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27B1F6169C;
	Thu, 12 Jun 2025 08:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eevymd1WhodY; Thu, 12 Jun 2025 08:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C508B615CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C508B615CF;
	Thu, 12 Jun 2025 08:39:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C79081E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C501F405A5
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJSf74DOXhCA for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05D9B420D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05D9B420D4
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03A6481643; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 21:40:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 980b8c7e54a67fba18b36e42adce3aea41e435bd
X-Git-Newrev: ae61cc15d92068ab5b56a0ee53518498cec04d6f
X-Patchwork-Hint: ignore
Message-Id: <20250612083830.03A6481643@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlitecpp: bump to version 3.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae61cc15d92068ab5b56a0ee53518498cec04d6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fixes a build issue with gcc-15
- license hash updated due to year change

Release Notes: https://github.com/SRombauts/SQLiteCpp/releases/tag/3.3.3

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Julien: add missing "Signed-off-by:"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlitecpp/sqlitecpp.hash | 4 ++--
 package/sqlitecpp/sqlitecpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlitecpp/sqlitecpp.hash b/package/sqlitecpp/sqlitecpp.hash
index 3ed6a3c40a..960d9bfb21 100644
--- a/package/sqlitecpp/sqlitecpp.hash
+++ b/package/sqlitecpp/sqlitecpp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  5aa8eda130d0689bd5ed9b2074714c2dbc610f710483c61ba6cf944cebfe03af  sqlitecpp-3.3.2.tar.gz
-sha256  ecb10f021c51e9fd1dabaebd8a8e977934d47d9e3c74094f333060be2d6e023b  LICENSE.txt
+sha256  33bd4372d83bc43117928ee842be64d05e7807f511b5195f85d30015cad9cac6  sqlitecpp-3.3.3.tar.gz
+sha256  a16149966042207bfc968dd1081403d43a37a6264fe31c7b1a7960dbb0e716b9  LICENSE.txt
diff --git a/package/sqlitecpp/sqlitecpp.mk b/package/sqlitecpp/sqlitecpp.mk
index 1cf8281997..95ddc953cb 100644
--- a/package/sqlitecpp/sqlitecpp.mk
+++ b/package/sqlitecpp/sqlitecpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITECPP_VERSION = 3.3.2
+SQLITECPP_VERSION = 3.3.3
 SQLITECPP_SITE = $(call github,SRombauts,SQLiteCpp,$(SQLITECPP_VERSION))
 SQLITECPP_LICENSE = MIT
 SQLITECPP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
