Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EE1C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE2FE40965;
	Mon, 15 Jul 2024 14:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDs02CRyQjoL; Mon, 15 Jul 2024 14:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCCD140976
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCCD140976;
	Mon, 15 Jul 2024 14:44:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6BAA1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3ABD408CF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JCFdIoRBTf3E for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CFE8403FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CFE8403FC
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:44:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79ED186CD9; Mon, 15 Jul 2024 14:44:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 16:43:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52df03ba50c2b7bc473650015ccebd67216cc8bf
X-Git-Newrev: ebccc2130379708daba70dfdcc5269c6eadf08e3
X-Patchwork-Hint: ignore
Message-Id: <20240715144418.79ED186CD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua: add tag Upstream in patches
 not sent upstream
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebccc2130379708daba70dfdcc5269c6eadf08e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add "Upstream: N/A" tag for patches that were not sent upstream. These
are all patches that would not be acceptable for upstream.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                              | 6 ------
 package/lua/5.1.5/0001-root-path.patch           | 1 +
 package/lua/5.1.5/0002-shared-libs-for-lua.patch | 1 +
 package/lua/5.3.6/0001-root-path.patch           | 1 +
 package/lua/5.3.6/0002-shared-libs-for-lua.patch | 1 +
 package/lua/5.4.7/0001-root-path.patch           | 1 +
 package/lua/5.4.7/0002-shared-libs-for-lua.patch | 1 +
 7 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7a76b57f0f..2e6e8a9cac 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -887,12 +887,6 @@ package/lua-gd/0001-Protect-declaration-of-LgdImageCreateFromPng-with-GD.patch l
 package/lua-lunix/0001-remove-link-with-librt.patch lib_patch.Upstream
 package/lua-sdl2/0001-Do-not-reference-host-directory-for-headers.patch lib_patch.Upstream
 package/lua-sdl2/0002-CMakeLists-do-not-require-C.patch lib_patch.Upstream
-package/lua/5.1.5/0001-root-path.patch lib_patch.Upstream
-package/lua/5.1.5/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.3.6/0001-root-path.patch lib_patch.Upstream
-package/lua/5.3.6/0002-shared-libs-for-lua.patch lib_patch.Upstream
-package/lua/5.4.7/0001-root-path.patch lib_patch.Upstream
-package/lua/5.4.7/0002-shared-libs-for-lua.patch lib_patch.Upstream
 package/luajit/0001-no-bin-symlink.patch lib_patch.Upstream
 package/luajit/0002-install-inc.patch lib_patch.Upstream
 package/luasyslog/0001-remove-AX_LUA_LIBS.patch lib_patch.Upstream
diff --git a/package/lua/5.1.5/0001-root-path.patch b/package/lua/5.1.5/0001-root-path.patch
index fd0da6eb57..41de4ba2b9 100644
--- a/package/lua/5.1.5/0001-root-path.patch
+++ b/package/lua/5.1.5/0001-root-path.patch
@@ -1,5 +1,6 @@
 Adjust installation location to /usr.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/etc/lua.pc
diff --git a/package/lua/5.1.5/0002-shared-libs-for-lua.patch b/package/lua/5.1.5/0002-shared-libs-for-lua.patch
index 3f863a530c..5ae0756c4c 100644
--- a/package/lua/5.1.5/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.1.5/0002-shared-libs-for-lua.patch
@@ -3,6 +3,7 @@ Compile the lua binary with the shared library.
 And install the shared library.
 The variable BUILDMODE allows to switch between static and dynamic mode.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/Makefile
diff --git a/package/lua/5.3.6/0001-root-path.patch b/package/lua/5.3.6/0001-root-path.patch
index a44c55c955..b41df3ecb7 100644
--- a/package/lua/5.3.6/0001-root-path.patch
+++ b/package/lua/5.3.6/0001-root-path.patch
@@ -1,5 +1,6 @@
 Adjust installation location to /usr.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/luaconf.h
diff --git a/package/lua/5.3.6/0002-shared-libs-for-lua.patch b/package/lua/5.3.6/0002-shared-libs-for-lua.patch
index 493828c9da..0821007474 100644
--- a/package/lua/5.3.6/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.3.6/0002-shared-libs-for-lua.patch
@@ -3,6 +3,7 @@ Compile the lua binary with the shared library.
 And install the shared library.
 The variable BUILDMODE allows to switch between static and dynamic mode.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/Makefile
diff --git a/package/lua/5.4.7/0001-root-path.patch b/package/lua/5.4.7/0001-root-path.patch
index 5e3037b786..cec9066eee 100644
--- a/package/lua/5.4.7/0001-root-path.patch
+++ b/package/lua/5.4.7/0001-root-path.patch
@@ -1,5 +1,6 @@
 Adjust installation location to /usr.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/src/luaconf.h
diff --git a/package/lua/5.4.7/0002-shared-libs-for-lua.patch b/package/lua/5.4.7/0002-shared-libs-for-lua.patch
index 388aa9966a..6115960956 100644
--- a/package/lua/5.4.7/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.4.7/0002-shared-libs-for-lua.patch
@@ -3,6 +3,7 @@ Compile the lua binary with the shared library.
 And install the shared library.
 The variable BUILDMODE allows to switch between static and dynamic mode.
 
+Upstream: N/A specific for Buildroot build
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 Index: b/Makefile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
