Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17017C369C4
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 17:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1F0584884;
	Wed, 16 Apr 2025 17:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtPA3jg-rstW; Wed, 16 Apr 2025 17:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF07B8487C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF07B8487C;
	Wed, 16 Apr 2025 17:21:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 023B26B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 543A54100B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDeDGPLrgSX6 for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 17:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CB9A40A99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CB9A40A99
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 17:21:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C24982670; Wed, 16 Apr 2025 17:21:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 19:18:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26c2dd8fdbb1bc23df6dc0a43e809e26afefd72f
X-Git-Newrev: 28851289475c4475ab2de9abcf062095e42731b8
X-Patchwork-Hint: ignore
Message-Id: <20250416172109.7C24982670@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-periphery: bump to version
 2.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=28851289475c4475ab2de9abcf062095e42731b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
    - Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev
    + Copyright (c) 2014-2025 vsergeev / Ivan (Vanya) A. Sergeev

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-periphery/lua-periphery.hash | 4 ++--
 package/lua-periphery/lua-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
index 6661656165..b09dbe7c5f 100644
--- a/package/lua-periphery/lua-periphery.hash
+++ b/package/lua-periphery/lua-periphery.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  63694d795a630afcdb4812cb0af489ab088501ad7fe1dc9ee1337b53ff849721  lua-periphery-2.4.2-1.src.rock
-sha256  2c29e38ac4d393558522c5fa671bd03f9d6f7d751c899a3482b20ab2a0ba5122  lua-periphery/LICENSE
+sha256  cd8ecf48e1dd53244f7e108e5e77f8a1c78949e8decd7ada1a881c6178b840e6  lua-periphery-2.4.3-1.src.rock
+sha256  fd3377c82df42bd00d8ac9c25d22dc63f80b7a491b84f2ba82d2a7621432c511  lua-periphery/LICENSE
diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
index b9933a9001..f0a52bf8b3 100644
--- a/package/lua-periphery/lua-periphery.mk
+++ b/package/lua-periphery/lua-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_PERIPHERY_VERSION = 2.4.2-1
+LUA_PERIPHERY_VERSION = 2.4.3-1
 LUA_PERIPHERY_SUBDIR = lua-periphery
 LUA_PERIPHERY_LICENSE = MIT
 LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
