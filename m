Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3805FC54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C099260673;
	Fri, 15 Mar 2024 19:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UiQw9PSsIC6F; Fri, 15 Mar 2024 19:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B39360677
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B39360677;
	Fri, 15 Mar 2024 19:52:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62DC61BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E98E40399
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:52:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5MKifKhkvX17 for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A371C4042B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A371C4042B
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:52:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AED7883A6; Fri, 15 Mar 2024 19:52:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 20:41:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b59ee9f191bfaaf9dcb8d74efdcc67754d8db3e
X-Git-Newrev: 8b025251d370357a0580acfdba876d4f8387559f
X-Patchwork-Hint: ignore
Message-Id: <20240315195210.9AED7883A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luarocks: bump to version 3.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b025251d370357a0580acfdba876d4f8387559f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYING: update copyright notice
see https://github.com/luarocks/luarocks/commit/a0bc05dcc7f44b94fb4585c560928ba9be6d8bdc

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/luarocks/buildroot.lua | 3 +++
 package/luarocks/luarocks.hash | 4 ++--
 package/luarocks/luarocks.mk   | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index 3c044d89b5..2b52358667 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -350,8 +350,11 @@ function buildroot.command(args)
       return nil, "Error loading rockspec: " .. err
    end
    if rockspec.source.file then
+      rockspec.source.dir = rockspec.source.dir or dir.deduce_base_dir(rockspec.source.file)
       ok, err = fs.unpack_archive(rockspec.source.file)
       if not ok then return nil, err end
+   else
+      rockspec.source.dir = rockspec.source.dir or '.'
    end
 
    if rockspec.source.dir ~= '.' then
diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 7136456923..fbf5270216 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ffafd83b1c42aa38042166a59ac3b618c838ce4e63f4ace9d961a5679ef58253  luarocks-3.9.1.tar.gz
-sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
+sha256  25f56b3c7272fb35b869049371d649a1bbe668a56d24df0a66e3712e35dd44a6  luarocks-3.11.0.tar.gz
+sha256  660773f53ed17cd0d8be7d67168c25e8cc664a506788c7b5971192bdd2994a9d  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 2bec2fca25..4c99229142 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.9.1
+LUAROCKS_VERSION = 3.11.0
 LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
