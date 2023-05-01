Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7932FC77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A47882120;
	Mon,  1 May 2023 07:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A47882120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STlfmQwscctJ; Mon,  1 May 2023 07:37:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B74382123;
	Mon,  1 May 2023 07:37:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B74382123
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C76571BF852
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A100182115
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A100182115
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LwkmznhdQg7 for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:36:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E4D98210A
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E4D98210A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C7DD84705; Mon,  1 May 2023 07:36:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 09:29:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 272bfb4cabe70e4251650f9fa27124c189eb835e
X-Git-Newrev: 60d8e5257608098bd1d66c44282b04d02c733f75
X-Patchwork-Hint: ignore
Message-Id: <20230501073635.3C7DD84705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua: bump to version 5.4.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=60d8e5257608098bd1d66c44282b04d02c733f75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua/5.4.4/lua.hash                                  | 6 ------
 package/lua/{5.4.4 => 5.4.5}/0001-root-path.patch           | 2 +-
 package/lua/{5.4.4 => 5.4.5}/0002-shared-libs-for-lua.patch | 2 +-
 package/lua/{5.4.4 => 5.4.5}/0011-linenoise.patch           | 2 +-
 package/lua/5.4.5/lua.hash                                  | 5 +++++
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/lua/5.4.4/lua.hash b/package/lua/5.4.4/lua.hash
deleted file mode 100644
index b55b17f258..0000000000
--- a/package/lua/5.4.4/lua.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-md5  bd8ce7069ff99a400efd14cf339a727b  lua-5.4.4.tar.gz
-sha1  03c27684b9d5d9783fb79a7c836ba1cdc5f309cd  lua-5.4.4.tar.gz
-
-# Locally computed
-sha256  2556ac7198243f9f83130b9c81016e1904f7b30351481f1c28e02475dbd237fb  doc/readme.html
diff --git a/package/lua/5.4.4/0001-root-path.patch b/package/lua/5.4.5/0001-root-path.patch
similarity index 95%
rename from package/lua/5.4.4/0001-root-path.patch
rename to package/lua/5.4.5/0001-root-path.patch
index c4f6e312eb..5e3037b786 100644
--- a/package/lua/5.4.4/0001-root-path.patch
+++ b/package/lua/5.4.5/0001-root-path.patch
@@ -6,7 +6,7 @@ Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -217,7 +217,7 @@
+@@ -223,7 +223,7 @@
  
  #else			/* }{ */
  
diff --git a/package/lua/5.4.4/0002-shared-libs-for-lua.patch b/package/lua/5.4.5/0002-shared-libs-for-lua.patch
similarity index 96%
rename from package/lua/5.4.4/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.5/0002-shared-libs-for-lua.patch
index 4ff2044298..388aa9966a 100644
--- a/package/lua/5.4.4/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.4.5/0002-shared-libs-for-lua.patch
@@ -31,7 +31,7 @@ Index: b/src/Makefile
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -33,6 +33,7 @@
- PLATS= guess aix bsd c89 freebsd generic linux linux-readline macosx mingw posix solaris
+ PLATS= guess aix bsd c89 freebsd generic ios linux linux-readline macosx mingw posix solaris
  
  LUA_A=	liblua.a
 +LUA_SO=	liblua.so
diff --git a/package/lua/5.4.4/0011-linenoise.patch b/package/lua/5.4.5/0011-linenoise.patch
similarity index 97%
rename from package/lua/5.4.4/0011-linenoise.patch
rename to package/lua/5.4.5/0011-linenoise.patch
index 68316e108f..5054ae19e2 100644
--- a/package/lua/5.4.4/0011-linenoise.patch
+++ b/package/lua/5.4.5/0011-linenoise.patch
@@ -8,7 +8,7 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -428,6 +428,14 @@
+@@ -438,6 +438,14 @@
  #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
  
diff --git a/package/lua/5.4.5/lua.hash b/package/lua/5.4.5/lua.hash
new file mode 100644
index 0000000000..5526cd5125
--- /dev/null
+++ b/package/lua/5.4.5/lua.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://www.lua.org/ftp/
+sha256  59df426a3d50ea535a460a452315c4c0d4e1121ba72ff0bdde58c2ef31d6f444  lua-5.4.5.tar.gz
+
+# Locally computed
+sha256  0d4ee721cf740f9cd878ef82ef75f4f2724dcf0403e56cd0b5643ad88f9de337  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 16086e7bf4..ecb86c11ed 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.4
+LUA_VERSION = 5.4.5
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
