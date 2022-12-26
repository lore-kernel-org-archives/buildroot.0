Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3573C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DBC5818D7;
	Mon, 20 Feb 2023 23:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DBC5818D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gOpZYTcAcHVl; Mon, 20 Feb 2023 23:26:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7C4D813F6;
	Mon, 20 Feb 2023 23:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7C4D813F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C66B1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD57961374
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD57961374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIZ2Qwe7-S1I for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8C7761386
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8C7761386
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADDF18648F; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 22:10:39 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 327b72f32bcfc01d580fa47f3e06cd42a828cd99
X-Git-Newrev: e3ce4fa930419e2968f844db4c7bc7a09ef473ba
X-Patchwork-Hint: ignore
Message-Id: <20230220205215.ADDF18648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-utf8: bump to
 version 0.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3ce4fa930419e2968f844db4c7bc7a09ef473ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lua-utf8/Config.in     | 2 +-
 package/lua-utf8/lua-utf8.hash | 4 ++--
 package/lua-utf8/lua-utf8.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-utf8/Config.in b/package/lua-utf8/Config.in
index 313fa4e45d..5815936df5 100644
--- a/package/lua-utf8/Config.in
+++ b/package/lua-utf8/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LUA_UTF8
 	  This module adds UTF-8 support to Lua.
 	  It's compatible with Lua "string" module.
 
-	  http://github.com/starwing/luautf8
+	  https://github.com/starwing/luautf8
diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index b6720b3603..b4d455ceb7 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  88c456bc0f00d28201b33551d83fa6e5c3ae6025aebec790c37afb317290e4fa  luautf8-0.1.3-1.src.rock
-sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.3/LICENSE
+sha256  68bd8e3c3e20f98fceb9e20d5a7a50168202c22eb45b87eff3247a0608f465ae  luautf8-0.1.5-2.src.rock
+sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.5/LICENSE
diff --git a/package/lua-utf8/lua-utf8.mk b/package/lua-utf8/lua-utf8.mk
index 52aaf5c71e..33c34a4eb2 100644
--- a/package/lua-utf8/lua-utf8.mk
+++ b/package/lua-utf8/lua-utf8.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_UTF8_VERSION = 0.1.3-1
+LUA_UTF8_VERSION = 0.1.5-2
 LUA_UTF8_NAME_UPSTREAM = luautf8
 LUA_UTF8_LICENSE = MIT
 LUA_UTF8_LICENSE_FILES = $(LUA_UTF8_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
