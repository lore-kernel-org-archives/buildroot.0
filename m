Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F9FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18BDC60E67;
	Mon, 28 Mar 2022 19:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rxlTWqPgKG7; Mon, 28 Mar 2022 19:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7BC160C02;
	Mon, 28 Mar 2022 19:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B727E1BF9AC
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13A52819F6
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7XLAvvurIk_B for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 564F581B10
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5820185F3E; Mon, 28 Mar 2022 19:48:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 20:54:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92e436b73df21ff9347c53c25fd33d8fd48a9d43
X-Git-Newrev: ab1c99158aa499cca78058ad2284f1e16deb6045
X-Patchwork-Hint: ignore
Message-Id: <20220328194854.5820185F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luasocket: bump to version 3.0.0
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
Content-Type: multipart/mixed; boundary="===============8393170812070651363=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8393170812070651363==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ab1c99158aa499cca78058ad2284f1e16deb6045
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

moved under the hat of https://github.com/lunarmodules

diff LICENSE:
-LuaSocket 3.0 license
-Copyright � 2004-2013 Diego Nehab
+Copyright (C) 2004-2022 Diego Nehab

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luasocket/Config.in      | 2 +-
 package/luasocket/luasocket.hash | 4 ++--
 package/luasocket/luasocket.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
index 45263030f3..5ad00f5c48 100644
--- a/package/luasocket/Config.in
+++ b/package/luasocket/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LUASOCKET
 	  It provides easy access to TCP, UDP, DNS, SMTP,
 	  FTP, HTTP, MIME and much more.
 
-	  http://luaforge.net/projects/luasocket/
+	  https://github.com/lunarmodules/luasocket
diff --git a/package/luasocket/luasocket.hash b/package/luasocket/luasocket.hash
index 843647b27f..b66ae57b9b 100644
--- a/package/luasocket/luasocket.hash
+++ b/package/luasocket/luasocket.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 453fc1d0e9b6a44bbada4290d565f840a5e96ba2d1b47562ba38bd9c7e82195a  luasocket-3.0rc1-1.src.rock
-sha256 8e8c6314d9e78fe452ee355167f2c40cfbee8207e14dcb5ddd4a2655cb5c6aad  luasocket-3.0-rc1/LICENSE
+sha256  63fd2dd18dfe242ca5bcc1203839e86a9c8936261a9ca9f3200f2deab431da88  luasocket-3.0.0-1.src.rock
+sha256  224afe42d0738eaaeb57ab289466a1c4e77091591e69dbcef2dbb385589f2f41  luasocket/LICENSE
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 20927fc1d6..eeece26fd5 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUASOCKET_VERSION = 3.0rc1-1
-LUASOCKET_SUBDIR = luasocket-3.0-rc1
+LUASOCKET_VERSION = 3.0.0-1
+LUASOCKET_SUBDIR = luasocket
 LUASOCKET_LICENSE = MIT
 LUASOCKET_LICENSE_FILES = $(LUASOCKET_SUBDIR)/LICENSE
 

--===============8393170812070651363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8393170812070651363==--
