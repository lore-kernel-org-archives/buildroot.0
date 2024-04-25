Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD65C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 20:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4944F61379;
	Thu, 25 Apr 2024 20:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97etKBAMneHn; Thu, 25 Apr 2024 20:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30E1A6139F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30E1A6139F;
	Thu, 25 Apr 2024 20:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC13C1BF990
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 20:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C49F782F99
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Axksjk_kO-Hn for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 20:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1B3882F6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1B3882F6F
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 20:37:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D974E8618A; Thu, 25 Apr 2024 20:37:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 22:36:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 086035d4f953d07467f5982fc0b8a686e20026d6
X-Git-Newrev: 75c73c31ac881f095966dbeae8dcc3668b13939b
X-Patchwork-Hint: ignore
Message-Id: <20240425203736.D974E8618A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-silva: bump to version 0.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=75c73c31ac881f095966dbeae8dcc3668b13939b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
    -Copyright (C) 2017-2023 Francois Perrad.
    +Copyright (C) 2017-2024 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-silva/lua-silva.hash | 4 ++--
 package/lua-silva/lua-silva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-silva/lua-silva.hash b/package/lua-silva/lua-silva.hash
index 3ceab6572b..aa63d6ef30 100644
--- a/package/lua-silva/lua-silva.hash
+++ b/package/lua-silva/lua-silva.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  fa838ed10b2e2c16f76fff9e47d52cde1f250efd73994865090d85218c2e5368  lua-silva-0.2.0-1.src.rock
-sha256  638206532ac117ec92a04791045e274e6aa55c3d7f408cd2be993a00424c2f96  lua-Silva-0.2.0/COPYRIGHT
+sha256  f06ceb2bfbd73b192459455fb8983c4a4ad6f1b895fe5513651a3308865c389c  lua-silva-0.2.1-1.src.rock
+sha256  e0c12da9671784c2f51e7db81bf98014365da94bfde81de3e88f2addd683c4be  lua-Silva-0.2.1/COPYRIGHT
diff --git a/package/lua-silva/lua-silva.mk b/package/lua-silva/lua-silva.mk
index 809ac3dd2d..4cbd53d4ca 100644
--- a/package/lua-silva/lua-silva.mk
+++ b/package/lua-silva/lua-silva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_SILVA_VERSION = 0.2.0-1
+LUA_SILVA_VERSION = 0.2.1-1
 LUA_SILVA_NAME_UPSTREAM = lua-Silva
 LUA_SILVA_LICENSE = MIT
 LUA_SILVA_LICENSE_FILES = $(LUA_SILVA_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
