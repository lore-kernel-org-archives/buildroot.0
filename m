Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B74C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11FEB416B1;
	Sat, 23 Dec 2023 17:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11FEB416B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFXzSmy72FdS; Sat, 23 Dec 2023 17:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 487BF41609;
	Sat, 23 Dec 2023 17:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 487BF41609
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 111671BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE63582150
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE63582150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ae5hO61-b8rk for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:34:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EEFC82125
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EEFC82125
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC4B187D9A; Sat, 23 Dec 2023 17:34:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 18:12:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e70abe9716109068b7c9176dced5396719f64c24
X-Git-Newrev: ef851d6d93d120648d62572c8f8f570ab8c34fa2
X-Patchwork-Hint: ignore
Message-Id: <20231223173407.EC4B187D9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-messagepack: bump to version
 0.5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef851d6d93d120648d62572c8f8f570ab8c34fa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-messagepack/lua-messagepack.hash | 6 +++---
 package/lua-messagepack/lua-messagepack.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index 6c650ce14b..f61a351383 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256  fe39b8ad92acf13f91d8660a04ab8fc9fb5d6370f99304d46cab8137ee9147b8  lua-messagepack-0.5.3-1.src.rock
-sha256  a7c1842ab7404104c941bc71809cd41c7685b4cd5edd4f1925f9cbe434f3ed4a  lua-messagepack-lua53-0.5.3-1.src.rock
-sha256  1dbe8e7da2d71088d4759da33a42eda89f5be90d1a9c0b823360a270d6628ed8  lua-MessagePack-0.5.3/COPYRIGHT
+sha256  86e5aedc94342f1447b3cac26dfacc69f05b0827221cd5e44d3b623087b16f37  lua-messagepack-0.5.4-1.src.rock
+sha256  3ed7ac22e50b06e63f91a16ad6457381af7317f1bccd778f104a4513c1cc118b  lua-messagepack-lua53-0.5.4-1.src.rock
+sha256  1dbe8e7da2d71088d4759da33a42eda89f5be90d1a9c0b823360a270d6628ed8  lua-MessagePack-0.5.4/COPYRIGHT
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index 390f85c6e3..7e5ab006c9 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.3
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.4
 LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack-lua53
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
