Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CD9C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 18:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B08415B3;
	Thu, 24 Aug 2023 18:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97B08415B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzN3-HR1X7l6; Thu, 24 Aug 2023 18:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC6704159D;
	Thu, 24 Aug 2023 18:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC6704159D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00EDD1BF853
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF3D583963
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF3D583963
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzwAXVccNvTa for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 18:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0957A83934
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 18:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0957A83934
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEDCF86238; Thu, 24 Aug 2023 18:57:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 20:57:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7b29c67e97072229fe5f836f51fa7a3a1f1db0aa
X-Git-Newrev: 2b765178f41bed3720f16e9c850b0d0efc332531
X-Patchwork-Hint: ignore
Message-Id: <20230824185759.DEDCF86238@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-silva: bump to
 version 0.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2b765178f41bed3720f16e9c850b0d0efc332531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

diff COPYRIGHT:
-Copyright (C) 2017-2021 Francois Perrad.
+Copyright (C) 2017-2023 Francois Perrad

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-silva/lua-silva.hash | 4 ++--
 package/lua-silva/lua-silva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-silva/lua-silva.hash b/package/lua-silva/lua-silva.hash
index 418c3e9e43..3ceab6572b 100644
--- a/package/lua-silva/lua-silva.hash
+++ b/package/lua-silva/lua-silva.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  0e656c42c71b64285d4a375fa7b8b1a910b05c4ab6d30f5b427b078fff204e1f  lua-silva-0.1.8-1.src.rock
-sha256  5b59ffbfc12d9d1cb907dd65b0f16d3453e1a43cc018c6128a00b00e08f6c485  lua-Silva-0.1.8/COPYRIGHT
+sha256  fa838ed10b2e2c16f76fff9e47d52cde1f250efd73994865090d85218c2e5368  lua-silva-0.2.0-1.src.rock
+sha256  638206532ac117ec92a04791045e274e6aa55c3d7f408cd2be993a00424c2f96  lua-Silva-0.2.0/COPYRIGHT
diff --git a/package/lua-silva/lua-silva.mk b/package/lua-silva/lua-silva.mk
index 91b1b77476..809ac3dd2d 100644
--- a/package/lua-silva/lua-silva.mk
+++ b/package/lua-silva/lua-silva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_SILVA_VERSION = 0.1.8-1
+LUA_SILVA_VERSION = 0.2.0-1
 LUA_SILVA_NAME_UPSTREAM = lua-Silva
 LUA_SILVA_LICENSE = MIT
 LUA_SILVA_LICENSE_FILES = $(LUA_SILVA_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
