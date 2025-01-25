Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD69C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 13:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BB05406F7;
	Sat, 25 Jan 2025 13:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OTXHw0uj1OW; Sat, 25 Jan 2025 13:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6543940E52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6543940E52;
	Sat, 25 Jan 2025 13:03:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CF68941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E28281F96
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wQNYIgzOvzj for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 13:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A616C81F94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A616C81F94
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:03:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FA0A86311; Sat, 25 Jan 2025 13:03:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 13:49:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95cd45d77d759115758830673c5bf9072dabc2d4
X-Git-Newrev: 903a1388952584509b02bad36dd4bf13b4b17251
X-Patchwork-Hint: ignore
Message-Id: <20250125130319.8FA0A86311@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-periphery: bump to version
 2.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=903a1388952584509b02bad36dd4bf13b4b17251
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENCE:
    - Copyright (c) 2014 vsergeev / Ivan (Vanya) A. Sergeev
    + Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-periphery/lua-periphery.hash | 4 ++--
 package/lua-periphery/lua-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
index d1331a489f..6661656165 100644
--- a/package/lua-periphery/lua-periphery.hash
+++ b/package/lua-periphery/lua-periphery.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  ff8a4d08f02356586fadfe47f01859ba28539cc42013836f79a032bf4ccc78b3  lua-periphery-1.1.1-1.src.rock
-sha256  7c60847b46f718e9651d1eca2f56bf6be09608cf08d130446a521eb8288c98e1  lua-periphery/LICENSE
+sha256  63694d795a630afcdb4812cb0af489ab088501ad7fe1dc9ee1337b53ff849721  lua-periphery-2.4.2-1.src.rock
+sha256  2c29e38ac4d393558522c5fa671bd03f9d6f7d751c899a3482b20ab2a0ba5122  lua-periphery/LICENSE
diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
index af5abe70df..b9933a9001 100644
--- a/package/lua-periphery/lua-periphery.mk
+++ b/package/lua-periphery/lua-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_PERIPHERY_VERSION = 1.1.1-1
+LUA_PERIPHERY_VERSION = 2.4.2-1
 LUA_PERIPHERY_SUBDIR = lua-periphery
 LUA_PERIPHERY_LICENSE = MIT
 LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
