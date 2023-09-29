Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18448E728CA
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 17:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BABF081358;
	Fri, 29 Sep 2023 17:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BABF081358
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9cOu2Uh6M_4i; Fri, 29 Sep 2023 17:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D2C2820B9;
	Fri, 29 Sep 2023 17:40:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D2C2820B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E801B1BF267
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF3BF4044F
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 17:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF3BF4044F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTrvcF3iTGMh for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 17:40:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 158B6400D7
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 17:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 158B6400D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 033EC83550; Fri, 29 Sep 2023 17:40:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 19:38:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4038b6af4e7a6b47b01c4b71eacd999bf8300d7
X-Git-Newrev: c3edc92673af8edc3c93cdf450b4943f5cbc360e
X-Patchwork-Hint: ignore
Message-Id: <20230929174000.033EC83550@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-messagepack: bump to version
 0.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3edc92673af8edc3c93cdf450b4943f5cbc360e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
    -Copyright (C) 2012-2019 Francois Perrad.
    +Copyright (C) 2012-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-messagepack/lua-messagepack.hash | 6 +++---
 package/lua-messagepack/lua-messagepack.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index 5c8dd59366..6c650ce14b 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256  cbb1b7b12834b7f49fd20621446ec4d76eff67d324b8182b7988324b10830a43  lua-messagepack-0.5.2-1.src.rock
-sha256  b3b3d8c3d28a4d4f26404cdb7d7d9329e2e831ea2dd2c6b119d958ed113579b2  lua-messagepack-lua53-0.5.2-1.src.rock
-sha256  709fd93a7dd6f8e941e7f0cb9e3eeba1f4de375302f1b19e14bb51aff23c5970  lua-MessagePack-0.5.2/COPYRIGHT
+sha256  fe39b8ad92acf13f91d8660a04ab8fc9fb5d6370f99304d46cab8137ee9147b8  lua-messagepack-0.5.3-1.src.rock
+sha256  a7c1842ab7404104c941bc71809cd41c7685b4cd5edd4f1925f9cbe434f3ed4a  lua-messagepack-lua53-0.5.3-1.src.rock
+sha256  1dbe8e7da2d71088d4759da33a42eda89f5be90d1a9c0b823360a270d6628ed8  lua-MessagePack-0.5.3/COPYRIGHT
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index 33d460b4fc..390f85c6e3 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.2
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.3
 LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack-lua53
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
