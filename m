Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00C4CAC589
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFFFB80571;
	Mon,  8 Sep 2025 14:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYR-lSb_NkqB; Mon,  8 Sep 2025 14:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA0D80559
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAA0D80559;
	Mon,  8 Sep 2025 14:16:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17925234
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B42CC4020A
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RukCOXap4hAT for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 011A340204
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 011A340204
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2AE083CAF; Mon,  8 Sep 2025 14:16:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 20:55:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91a7ac76d2e3e39c7d37c5d1fa412eb74c92d33b
X-Git-Newrev: c3ceae347284e0bb018b074520e317160b3d16dc
X-Patchwork-Hint: ignore
Message-Id: <20250908141620.F2AE083CAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-zlib: bump to version 1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3ceae347284e0bb018b074520e317160b3d16dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/brimworks/lua-zlib/releases/tag/v1.3

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add link to changelog]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-zlib/lua-zlib.hash | 2 +-
 package/lua-zlib/lua-zlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-zlib/lua-zlib.hash b/package/lua-zlib/lua-zlib.hash
index cef29efb10..c092ea431a 100644
--- a/package/lua-zlib/lua-zlib.hash
+++ b/package/lua-zlib/lua-zlib.hash
@@ -1,2 +1,2 @@
 # computed by luarocks/buildroot
-sha256  42436ba2b78c9a2d515d6da59ceb12cdea7f84c9ce3c859d91addb42badd4061  lua-zlib-1.2-0.src.rock
+sha256  65e90d13f9da12168276d5533b1989ad0d8fc806ee93152b52106a6f2c52c1ae  lua-zlib-1.3-0.src.rock
diff --git a/package/lua-zlib/lua-zlib.mk b/package/lua-zlib/lua-zlib.mk
index 23e2a8ae32..cc58073716 100644
--- a/package/lua-zlib/lua-zlib.mk
+++ b/package/lua-zlib/lua-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ZLIB_VERSION = 1.2-0
+LUA_ZLIB_VERSION = 1.3-0
 LUA_ZLIB_SUBDIR = lua-zlib
 LUA_ZLIB_LICENSE = MIT
 LUA_ZLIB_DEPENDENCIES = zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
