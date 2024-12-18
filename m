Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F16C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 798794F1AF;
	Fri, 28 Feb 2025 16:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLhjqC_STJHG; Fri, 28 Feb 2025 16:42:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C6042F07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38C6042F07;
	Fri, 28 Feb 2025 16:42:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13C5068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A04C442752
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVtAsnx-uwOR for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 344BD424E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 344BD424E7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DA0E85E77; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 21:39:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fbb4844409fb37b4298815f9e72112e3108758e8
X-Git-Newrev: 19ec245339e79ebcb2d23295fc9febfc9f55b7bc
X-Patchwork-Hint: ignore
Message-Id: <20250228162943.2DA0E85E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/luaexpat: bump to
 version 1.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=19ec245339e79ebcb2d23295fc9febfc9f55b7bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release note, see:
https://github.com/lunarmodules/luaexpat/releases/tag/1.5.2

This commit updates the license hash, due to year update:
https://github.com/lunarmodules/luaexpat/commit/947d2e9596ac1ff9a7c61b27e964db2db0722c88

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to release note and license update commit]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/luaexpat/luaexpat.hash | 4 ++--
 package/luaexpat/luaexpat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaexpat/luaexpat.hash b/package/luaexpat/luaexpat.hash
index 621293a0b9..91fc9177c1 100644
--- a/package/luaexpat/luaexpat.hash
+++ b/package/luaexpat/luaexpat.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  eb7abc4cc39dd50eecb30896686bac84e66fd3c0774d0749b391e7ac5d222f45  luaexpat-1.5.1-1.src.rock
-sha256  7e6a727e5b57cca713a2f2633f05d7e0cc1e261cc6a7613bbe266e625b2f14da  luaexpat/LICENSE
+sha256  a88ac147d2ceaf168fddedd2245928f35d4c0218094142b054db7e9bae0b5b82  luaexpat-1.5.2-1.src.rock
+sha256  9a169eddcc5b1f05e85659a0ba5403a7e3804bc3b6e60b730251d963e1a9ac10  luaexpat/LICENSE
diff --git a/package/luaexpat/luaexpat.mk b/package/luaexpat/luaexpat.mk
index 73675a8ee6..86d800d690 100644
--- a/package/luaexpat/luaexpat.mk
+++ b/package/luaexpat/luaexpat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAEXPAT_VERSION = 1.5.1-1
+LUAEXPAT_VERSION = 1.5.2-1
 LUAEXPAT_SUBDIR = luaexpat
 LUAEXPAT_LICENSE = MIT
 LUAEXPAT_LICENSE_FILES = $(LUAEXPAT_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
