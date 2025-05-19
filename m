Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A777C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 17:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE9781EDD;
	Mon, 19 May 2025 17:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8MRUBJ2xMTZ; Mon, 19 May 2025 17:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D178E81EDA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D178E81EDA;
	Mon, 19 May 2025 17:21:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B50A3E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4B3840781
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIQQWKPq-Ks2 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 17:21:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB42D40766
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB42D40766
 for <buildroot@buildroot.org>; Mon, 19 May 2025 17:21:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5BF587460; Mon, 19 May 2025 17:21:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 19:13:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7f3329b7fd2bf1983c5c48dc514a16d67b2155a3
X-Git-Newrev: 510481455470dce634594e0bb3b768c02b7506dd
X-Patchwork-Hint: ignore
Message-Id: <20250519172114.C5BF587460@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nmap: bump to version
 7.97
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

commit: https://git.buildroot.net/buildroot/commit/?id=510481455470dce634594e0bb3b768c02b7506dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://nmap.org/changelog.html#7.97
https://nmap.org/changelog.html#7.96

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nmap/nmap.hash | 6 +++---
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 4f6ea20731..e9bce1a01f 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.95.tar.bz2.digest.txt (lowercase)
-sha256  e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778  nmap-7.95.tar.bz2
-sha512  fd95a8bc627a2b8b507353f761dc9fdc8e880a0dd2d75a51b9cb3ec664318796af9bb16a6ff9a1358bd77ad669c2a54e333be630f201f69287692a7d2d41c17e  nmap-7.95.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.97.tar.bz2.digest.txt (lowercase)
+sha256  af98f27925c670c257dd96a9ddf2724e06cb79b2fd1e0d08c9206316be1645c0  nmap-7.97.tar.bz2
+sha512  050241744c311f5fc16297e1698aded2a9fdc78eb7a0954d1c70f7713ef6e1b07f3fcbf28a6a53f43785b1ae710aadf10237d1d0bd8855c6b3c423da4d35961c  nmap-7.97.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 077840b192..a944627b38 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.95
+NMAP_VERSION = 7.97
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
