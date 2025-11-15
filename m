Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DDACEB2EE
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 17:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D28983F7A;
	Sat, 15 Nov 2025 17:26:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Et6EzCqhk6tS; Sat, 15 Nov 2025 17:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 429FC83F49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 429FC83F49;
	Sat, 15 Nov 2025 17:26:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB3EB1A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DAE240291
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQuo88bVAJzJ for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 17:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAEEE400C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAEEE400C4
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:26:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B522784524; Sat, 15 Nov 2025 17:26:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 18:21:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b65dae967035ca5a31f10149c69cad62f2b1e0d6
X-Git-Newrev: a6d7bcc16286f9665fefc6c589f0f54c17e6a5fb
X-Patchwork-Hint: ignore
Message-Id: <20251115172647.B522784524@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: bump to version 1.4.82
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6d7bcc16286f9665fefc6c589f0f54c17e6a5fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
- https://www.lighttpd.net/2025/9/12/1.4.82/

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lighttpd/lighttpd.hash | 8 ++++----
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index a23af84c28..2a7c3c5e84 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,6 +1,6 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha512sum
-sha512  10c24b1c1ce1aa1d826a426868223393eb81d7c0fbcc0b4f032b082a14593e0364228a5275e1440ed8782a2e78f0ded7cf72bc6642e5528bc82defcefab9301b  lighttpd-1.4.81.tar.xz
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.sha256sum
-sha256  d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e909f81cf50842a5840  lighttpd-1.4.81.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.sha512sum
+sha512  a8ced6e61b6768d31fb643c1f75af906ee975000286a9a522415571878c7979fd9e5e39f36871e8f34f6ca5d3702fa4b20a0c1203b57ba446dae2dbb6efa71b4  lighttpd-1.4.82.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.sha256sum
+sha256  abfe74391f9cbd66ab154ea07e64f194dbe7e906ef4ed47eb3b0f3b46246c962  lighttpd-1.4.82.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 71c860a31a..a126e96167 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).81
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).82
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
