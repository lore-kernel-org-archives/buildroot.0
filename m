Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84666C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 20:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B9524371D;
	Wed, 20 Dec 2023 20:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B9524371D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHbxBemuzwM3; Wed, 20 Dec 2023 20:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E4BB436D9;
	Wed, 20 Dec 2023 20:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E4BB436D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6889D1BF365
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42368839A4
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 20:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42368839A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uu3LtXY7nSbK for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 20:42:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 049BE8399B
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 20:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 049BE8399B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E768E87C45; Wed, 20 Dec 2023 20:42:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 21:32:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceb678ca19d66ea1be945097d3cf53a3af735ca1
X-Git-Newrev: 259de5cff6841346dc39cd7eb64a58ccd78c8cd3
X-Patchwork-Hint: ignore
Message-Id: <20231220204216.E768E87C45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-compat53: bump to version 0.12
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8862606364750468942=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8862606364750468942==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=259de5cff6841346dc39cd7eb64a58ccd78c8cd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the project has moved to the organization “Lunar Modules”,
see https://github.com/lunarmodules/

diff LICENCE:
-Copyright (c) 2015 Kepler Project.
+Copyright (C) 1994-2020 Lua.org, PUC-Rio.
+Copyright (C) 2013-2023 The Lua-Compat-5.3 authors.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-compat53/Config.in         | 2 +-
 package/lua-compat53/lua-compat53.hash | 4 ++--
 package/lua-compat53/lua-compat53.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-compat53/Config.in b/package/lua-compat53/Config.in
index de468fcf66..695c139280 100644
--- a/package/lua-compat53/Config.in
+++ b/package/lua-compat53/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LUA_COMPAT53
 	  Compatibility module providing Lua-5.3-style APIs for Lua 5.2
 	  and 5.1.
 
-	  https://github.com/keplerproject/lua-compat-5.3
+	  https://github.com/lunarmodules/lua-compat-5.3
diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
index ccd9a71205..1930063fdc 100644
--- a/package/lua-compat53/lua-compat53.hash
+++ b/package/lua-compat53/lua-compat53.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  e513e75ba0ef4923a1ec0d4f0beb5972a11cc9bd7ac1b0953b5e4f037b259c92  compat53-0.8-1.src.rock
-sha256  1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.8/LICENSE
+sha256  bff8e597384776de7c139bee7d6a6f2c05c3eb7315d08733473fa986720cec60  compat53-0.12-1.src.rock
+sha256  870cdff7e4db4c2e84a335b2b9e242b9f963830550026e2057a5885e945982e5  lua-compat-5.3-0.12/LICENSE
diff --git a/package/lua-compat53/lua-compat53.mk b/package/lua-compat53/lua-compat53.mk
index 0e8f1c3600..0cfbe2d795 100644
--- a/package/lua-compat53/lua-compat53.mk
+++ b/package/lua-compat53/lua-compat53.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_COMPAT53_VERSION_UPSTREAM = 0.8
+LUA_COMPAT53_VERSION_UPSTREAM = 0.12
 LUA_COMPAT53_VERSION = $(LUA_COMPAT53_VERSION_UPSTREAM)-1
 LUA_COMPAT53_NAME_UPSTREAM = compat53
 LUA_COMPAT53_SUBDIR = lua-compat-5.3-$(LUA_COMPAT53_VERSION_UPSTREAM)

--===============8862606364750468942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8862606364750468942==--
