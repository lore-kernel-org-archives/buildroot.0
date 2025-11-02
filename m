Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48C1CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 11:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648DE851DB;
	Sun,  2 Nov 2025 11:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H35ynca0cEhj; Sun,  2 Nov 2025 11:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8160984C87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8160984C87;
	Sun,  2 Nov 2025 11:55:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E43C1222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CADFC84C87
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bAP-olnQHBnH for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 11:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB39384C35
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB39384C35
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 11:55:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA43A839A1; Sun,  2 Nov 2025 11:55:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Nov 2025 12:22:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5225c4c573ef95e32341695017d426cd7af3187
X-Git-Newrev: 5b8cd76e1ada85b4d98451cff0f703715a2eb122
X-Patchwork-Hint: ignore
Message-Id: <20251102115518.DA43A839A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] packages/libunistring: bump to version
 1.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b8cd76e1ada85b4d98451cff0f703715a2eb122
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://savannah.gnu.org/projects/libunistring/

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libunistring/libunistring.hash | 6 +++---
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index e7fbc85414..f86b6f94b0 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libunistring/libunistring-1.3.tar.xz.sig
-sha256  f245786c831d25150f3dfb4317cda1acc5e3f79a5da4ad073ddca58886569527  libunistring-1.3.tar.xz
+# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.1.tar.xz.sig
+sha256  67d88430892527861903788868c77802a217b0959990f7449f2976126a307763  libunistring-1.4.1.tar.xz
 # Locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index fc785c28a5..1abbfde6da 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 1.3
+LIBUNISTRING_VERSION = 1.4.1
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
