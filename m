Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DDECEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F773406E7;
	Mon, 17 Nov 2025 20:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GA2Z_dwyMWsE; Mon, 17 Nov 2025 20:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB2B8406AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB2B8406AA;
	Mon, 17 Nov 2025 20:06:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3BDD1BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB3B2408BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZG7MIsFJ-Qk3 for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2675940027
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2675940027
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:06:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F8E684489; Mon, 17 Nov 2025 20:06:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 20:39:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ccee2be221772f6d456fd852b237adb7f5bbe51
X-Git-Newrev: cf807faf2f2dea85c2070718fed476238c7a4c24
X-Patchwork-Hint: ignore
Message-Id: <20251117200629.1F8E684489@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/whois: bump to version 5.6.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf807faf2f2dea85c2070718fed476238c7a4c24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/rfc1036/whois/blob/v5.6.5/debian/changelog

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/whois/whois.hash | 6 +++---
 package/whois/whois.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 49ded707b8..e671347eae 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,6 +1,6 @@
-# From https://snapshot.debian.org/archive/debian/20250607T082433Z/pool/main/w/whois/whois_5.6.2.dsc
-sha1  6095840107fcaf5339a7c9840c153ad3f29a7ffc  whois_5.6.2.tar.xz
-sha256  7fbcbc00b7aa321ac1af28a85d86d3ce7b11db1d4a2317b25407be04e506ead0  whois_5.6.2.tar.xz
+# From https://snapshot.debian.org/archive/debian/20251116T144052Z/pool/main/w/whois/whois_5.6.5.dsc
+sha1  a550d7c51399fc24d9f325cb48560ef8d406fbbf  whois_5.6.5.tar.xz
+sha256  3ec4168da3ff61e5e426964428202bc0573ad6ecc1f3baf6f43daea6c748aa7d  whois_5.6.5.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 9451aa195d..78811e69fc 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.6.2
-WHOIS_SITE = https://snapshot.debian.org/archive/debian/20250607T082433Z/pool/main/w/whois
+WHOIS_VERSION = 5.6.5
+WHOIS_SITE = https://snapshot.debian.org/archive/debian/20251116T144052Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
