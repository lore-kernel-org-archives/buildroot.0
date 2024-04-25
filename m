Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EB2C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 20:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 940C76136B;
	Thu, 25 Apr 2024 20:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Bu5rHYQyVgO; Thu, 25 Apr 2024 20:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C99F613A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C99F613A9;
	Thu, 25 Apr 2024 20:37:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2A41BF388
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 20:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C803C82FA5
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9gMm7nNuyOG0 for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 20:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 082DF82F8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 082DF82F8A
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 20:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F33EF8618B; Thu, 25 Apr 2024 20:37:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 22:37:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7ec640ec22dc19e76631ab8ca7446cc69653241
X-Git-Newrev: db37b0e27d3c54d27b854edbc3253d29f512a6ee
X-Patchwork-Hint: ignore
Message-Id: <20240425203736.F33EF8618B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-dkjson: bump to version 2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=db37b0e27d3c54d27b854edbc3253d29f512a6ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-dkjson/lua-dkjson.hash | 4 ++--
 package/lua-dkjson/lua-dkjson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-dkjson/lua-dkjson.hash b/package/lua-dkjson/lua-dkjson.hash
index 8f1a6f6a2f..2f210e497d 100644
--- a/package/lua-dkjson/lua-dkjson.hash
+++ b/package/lua-dkjson/lua-dkjson.hash
@@ -1,5 +1,5 @@
 # computed by luarocks/buildroot
-sha256  e4ba15f2a85f84ffc7f628157a4ad16b2b04ba05eb44a2e5956fa46bd104125e  dkjson-2.6-1.src.rock
+sha256  f6101a0e77ca857ec20799f6b998a600b04c8dd09b27c445ea09f29695bfffb0  dkjson-2.7-1.src.rock
 
 # locally computed
-sha256  7fd6585e9776c1cf2930e8ce660b3116c8a9b4b676929d45078870a42f16aa65  dkjson-2.6/readme.txt
+sha256  9d46e06db7feb8fd68f73bd024c8a2c04807629e16f396880860d151b60a3ed1  dkjson-2.7/readme.txt
diff --git a/package/lua-dkjson/lua-dkjson.mk b/package/lua-dkjson/lua-dkjson.mk
index 718c47f50e..2b110f8f1e 100644
--- a/package/lua-dkjson/lua-dkjson.mk
+++ b/package/lua-dkjson/lua-dkjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DKJSON_VERSION = 2.6-1
+LUA_DKJSON_VERSION = 2.7-1
 LUA_DKJSON_NAME_UPSTREAM = dkjson
 LUA_DKJSON_LICENSE = MIT
 LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
