Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF18EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 737034032E;
	Sat,  5 Feb 2022 22:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flWg7ObOJbH8; Sat,  5 Feb 2022 22:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E29E4010E;
	Sat,  5 Feb 2022 22:55:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3093A1BF95F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4F8340889
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3L_2d7J62Sp for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7FCA4088C
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:55:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C6A7482AA2; Sat,  5 Feb 2022 22:47:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 23:45:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c667a11400e51618a4b38d288816cbb3ee7478f
X-Git-Newrev: 4f9a5659023c66fc166de28fd39a6c97a9490667
X-Patchwork-Hint: ignore
Message-Id: <20220205224746.C6A7482AA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua: bump to version 5.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f9a5659023c66fc166de28fd39a6c97a9490667
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lua/5.4.3/lua.hash                                  | 6 ------
 package/lua/{5.4.3 => 5.4.4}/0001-root-path.patch           | 0
 package/lua/{5.4.3 => 5.4.4}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.3 => 5.4.4}/0011-linenoise.patch           | 2 +-
 package/lua/5.4.4/lua.hash                                  | 6 ++++++
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/lua/5.4.3/lua.hash b/package/lua/5.4.3/lua.hash
deleted file mode 100644
index be3604837f..0000000000
--- a/package/lua/5.4.3/lua.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-md5  ef63ed2ecfb713646a7fcc583cf5f352  lua-5.4.3.tar.gz
-sha1  1dda2ef23a9828492b4595c0197766de6e784bc7  lua-5.4.3.tar.gz
-
-# Locally computed
-sha256  d205bfea131113bcdd64d4ebe4a50ce34063b42bad24b93e44b4b0d853ae4d49  doc/readme.html
diff --git a/package/lua/5.4.3/0001-root-path.patch b/package/lua/5.4.4/0001-root-path.patch
similarity index 100%
rename from package/lua/5.4.3/0001-root-path.patch
rename to package/lua/5.4.4/0001-root-path.patch
diff --git a/package/lua/5.4.3/0002-shared-libs-for-lua.patch b/package/lua/5.4.4/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.3/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.4/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.3/0011-linenoise.patch b/package/lua/5.4.4/0011-linenoise.patch
similarity index 97%
rename from package/lua/5.4.3/0011-linenoise.patch
rename to package/lua/5.4.4/0011-linenoise.patch
index 7b9d6d76f3..68316e108f 100644
--- a/package/lua/5.4.3/0011-linenoise.patch
+++ b/package/lua/5.4.4/0011-linenoise.patch
@@ -8,7 +8,7 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -421,6 +421,14 @@
+@@ -428,6 +428,14 @@
  #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
  
diff --git a/package/lua/5.4.4/lua.hash b/package/lua/5.4.4/lua.hash
new file mode 100644
index 0000000000..b55b17f258
--- /dev/null
+++ b/package/lua/5.4.4/lua.hash
@@ -0,0 +1,6 @@
+# Hashes from: https://www.lua.org/ftp/
+md5  bd8ce7069ff99a400efd14cf339a727b  lua-5.4.4.tar.gz
+sha1  03c27684b9d5d9783fb79a7c836ba1cdc5f309cd  lua-5.4.4.tar.gz
+
+# Locally computed
+sha256  2556ac7198243f9f83130b9c81016e1904f7b30351481f1c28e02475dbd237fb  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 844e165df0..09e7b34f7d 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.3
+LUA_VERSION = 5.4.4
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
