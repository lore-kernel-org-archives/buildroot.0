Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D033C61CE7
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 13:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BA938117E;
	Sun,  8 Jun 2025 13:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hAT3j4J4vdUN; Sun,  8 Jun 2025 13:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E6BE810CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E6BE810CF;
	Sun,  8 Jun 2025 13:48:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13FBC232
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE619810B0
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdRxDyiY39YF for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 13:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F3AB810B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F3AB810B9
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:48:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27FEE87A8E; Sun,  8 Jun 2025 13:48:25 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jun 2025 15:27:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 22798b5978de5fc32a1111da6d8f321fae95282d
X-Git-Newrev: eb21ab5c712c751356dda716ae2da91293e09471
X-Patchwork-Hint: ignore
Message-Id: <20250608134825.27FEE87A8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/whois: bump to version
 5.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb21ab5c712c751356dda716ae2da91293e09471
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://github.com/rfc1036/whois/blob/v5.6.2/debian/changelog

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/whois/whois.hash | 6 +++---
 package/whois/whois.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 6b1a3f4cc6..49ded707b8 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,6 +1,6 @@
-# From https://snapshot.debian.org/archive/debian/20250527T144819Z/pool/main/w/whois/whois_5.6.1.dsc
-sha1  4c10bcc05b610bfd5a5c9c4465c97cf117826c2b  whois_5.6.1.tar.xz
-sha256  86b4d99d1ea219d2eaa20257b9c549642f101393b4b9369c391370a39341fc32  whois_5.6.1.tar.xz
+# From https://snapshot.debian.org/archive/debian/20250607T082433Z/pool/main/w/whois/whois_5.6.2.dsc
+sha1  6095840107fcaf5339a7c9840c153ad3f29a7ffc  whois_5.6.2.tar.xz
+sha256  7fbcbc00b7aa321ac1af28a85d86d3ce7b11db1d4a2317b25407be04e506ead0  whois_5.6.2.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index a6ed54ab89..9451aa195d 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.6.1
-WHOIS_SITE = https://snapshot.debian.org/archive/debian/20250527T144819Z/pool/main/w/whois
+WHOIS_VERSION = 5.6.2
+WHOIS_SITE = https://snapshot.debian.org/archive/debian/20250607T082433Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
