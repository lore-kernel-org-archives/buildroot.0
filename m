Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB9DD767F4
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7CE460AC9;
	Thu, 31 Oct 2024 18:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bY0x5WcaesQd; Thu, 31 Oct 2024 18:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FB7760AFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FB7760AFC;
	Thu, 31 Oct 2024 18:26:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48C5C494E
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 285CE40204
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r_8thMDuOhXz for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3563B40158
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3563B40158
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FCA7852A6; Thu, 31 Oct 2024 18:26:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 19:22:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 378110eb597de6fdab09df8f9da2233cb04dc820
X-Git-Newrev: 75fca5bb5fa61e91c0274b377677e2e5592fd452
X-Patchwork-Hint: ignore
Message-Id: <20241031182644.1FCA7852A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-compat53: bump to version
 0.14.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=75fca5bb5fa61e91c0274b377677e2e5592fd452
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-compat53/lua-compat53.hash | 4 ++--
 package/lua-compat53/lua-compat53.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
index 1930063fdc..cd2c35d621 100644
--- a/package/lua-compat53/lua-compat53.hash
+++ b/package/lua-compat53/lua-compat53.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  bff8e597384776de7c139bee7d6a6f2c05c3eb7315d08733473fa986720cec60  compat53-0.12-1.src.rock
-sha256  870cdff7e4db4c2e84a335b2b9e242b9f963830550026e2057a5885e945982e5  lua-compat-5.3-0.12/LICENSE
+sha256  987e286e63e568c2a7d50b6a66ea9d4189254be49ebd6477ed8945e23e195c44  compat53-0.14.3-1.src.rock
+sha256  870cdff7e4db4c2e84a335b2b9e242b9f963830550026e2057a5885e945982e5  lua-compat-5.3-0.14.3/LICENSE
diff --git a/package/lua-compat53/lua-compat53.mk b/package/lua-compat53/lua-compat53.mk
index 12ac5c011b..048a52279f 100644
--- a/package/lua-compat53/lua-compat53.mk
+++ b/package/lua-compat53/lua-compat53.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COMPAT53_VERSION_UPSTREAM = 0.12
+LUA_COMPAT53_VERSION_UPSTREAM = 0.14.3
 LUA_COMPAT53_VERSION = $(LUA_COMPAT53_VERSION_UPSTREAM)-1
 LUA_COMPAT53_NAME_UPSTREAM = compat53
 LUA_COMPAT53_SUBDIR = lua-compat-5.3-$(LUA_COMPAT53_VERSION_UPSTREAM)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
