Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1694C4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B5DC40465;
	Mon, 26 Dec 2022 21:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B5DC40465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3wSrl3bmQL2; Mon, 26 Dec 2022 21:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9937540291;
	Mon, 26 Dec 2022 21:13:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9937540291
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEBF31BF8B4
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA9DE60B31
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA9DE60B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ayFUjMWLBSzD for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:13:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E389F60595
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 21:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E389F60595
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC76A86E32; Mon, 26 Dec 2022 21:13:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 22:10:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5dc7e1fc363b217683f009f6470519b751675083
X-Git-Newrev: eda08c6b88ca466c27cb02004e92ac5ae6e60998
X-Patchwork-Hint: ignore
Message-Id: <20221226211335.CC76A86E32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-cjson: bump to version 2.1.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=eda08c6b88ca466c27cb02004e92ac5ae6e60998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lua-cjson/Config.in      | 2 +-
 package/lua-cjson/lua-cjson.hash | 2 +-
 package/lua-cjson/lua-cjson.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
index 9474b3176c..1c153fa46a 100644
--- a/package/lua-cjson/Config.in
+++ b/package/lua-cjson/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_LUA_CJSON
 
 	  (C-module)
 
-	  http://www.kyne.com.au/~mark/software/lua-cjson.php
+	  https://www.kyne.com.au/~mark/software/lua-cjson.php
diff --git a/package/lua-cjson/lua-cjson.hash b/package/lua-cjson/lua-cjson.hash
index b052c5199c..5ddc07bcc6 100644
--- a/package/lua-cjson/lua-cjson.hash
+++ b/package/lua-cjson/lua-cjson.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  455fa7d07d8ac9d61f68f538958f8e28972256f38b0a1c2740873daf809d1837  lua-cjson-2.1.0.6-1.src.rock
+sha256  02dea368d07753647c75bd9e6660dd4d06ff7d09956d90d5afc4c3f5b78ed187  lua-cjson-2.1.0.10-1.src.rock
 sha256  9576e82ef5013fbe80b3bd446a7d9ddd47328baa2186c31d3d885e2a9a8cd31e  lua-cjson/LICENSE
diff --git a/package/lua-cjson/lua-cjson.mk b/package/lua-cjson/lua-cjson.mk
index e029dab5cb..e08d230060 100644
--- a/package/lua-cjson/lua-cjson.mk
+++ b/package/lua-cjson/lua-cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CJSON_VERSION = 2.1.0.6-1
+LUA_CJSON_VERSION = 2.1.0.10-1
 LUA_CJSON_SUBDIR = lua-cjson
 LUA_CJSON_LICENSE = MIT
 LUA_CJSON_LICENSE_FILES = $(LUA_CJSON_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
