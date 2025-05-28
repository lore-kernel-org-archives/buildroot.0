Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B782C71143
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3609610E1;
	Thu, 12 Jun 2025 08:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LxOzZWQl4pV4; Thu, 12 Jun 2025 08:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C9FD61735
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C9FD61735;
	Thu, 12 Jun 2025 08:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 131DA1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0807D405BC
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRImRESXXOoM for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6942C405FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6942C405FE
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6713C811D1; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 22:26:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b89c274f51c6813a11a2aef499b66dcca8a1c550
X-Git-Newrev: 760b9b73e0f89a6387589d8ec78f29e5485bd99c
X-Patchwork-Hint: ignore
Message-Id: <20250612083830.6713C811D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/whois: bump to version 5.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=760b9b73e0f89a6387589d8ec78f29e5485bd99c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/rfc1036/whois/blob/v5.6.1/debian/changelog

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
[Julien: remove _SITE trailing slash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/whois/whois.hash | 6 +++---
 package/whois/whois.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 06237b65d4..6b1a3f4cc6 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,6 +1,6 @@
-# From https://snapshot.debian.org/archive/debian/20241116T203634Z/pool/main/w/whois/whois_5.5.23.dsc
-sha1  18227c0efec651c31fe764cdc3af17f5389bcc21  whois_5.5.23.tar.xz
-sha256  35c04e46bd8435f46e446a817728b5fae2f0a389033a9383e5e20bb6e8fba14a  whois_5.5.23.tar.xz
+# From https://snapshot.debian.org/archive/debian/20250527T144819Z/pool/main/w/whois/whois_5.6.1.dsc
+sha1  4c10bcc05b610bfd5a5c9c4465c97cf117826c2b  whois_5.6.1.tar.xz
+sha256  86b4d99d1ea219d2eaa20257b9c549642f101393b4b9369c391370a39341fc32  whois_5.6.1.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index ca76b22e6d..a6ed54ab89 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.23
-WHOIS_SITE = https://snapshot.debian.org/archive/debian/20241116T203634Z/pool/main/w/whois
+WHOIS_VERSION = 5.6.1
+WHOIS_SITE = https://snapshot.debian.org/archive/debian/20250527T144819Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
