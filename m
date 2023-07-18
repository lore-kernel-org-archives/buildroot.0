Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446FCEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F12A060DF9;
	Tue, 18 Jul 2023 21:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F12A060DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5WZdeY1NhYyA; Tue, 18 Jul 2023 21:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4563060C19;
	Tue, 18 Jul 2023 21:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4563060C19
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A463B1BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E1F881F75
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E1F881F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Im2U9irHW4fR for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:06:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA14381F74
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA14381F74
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A72D287426; Tue, 18 Jul 2023 21:06:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:05:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40fa607e5172159d9d54e6a6acc140d864240bc9
X-Git-Newrev: ab4f923f3291f39939d494b6ac49a5758144684c
X-Patchwork-Hint: ignore
Message-Id: <20230718210616.A72D287426@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-rotas: bump to version 0.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab4f923f3291f39939d494b6ac49a5758144684c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
-Copyright (C) 2018-2021 Francois Perrad.
+Copyright (C) 2018-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-rotas/lua-rotas.hash | 4 ++--
 package/lua-rotas/lua-rotas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-rotas/lua-rotas.hash b/package/lua-rotas/lua-rotas.hash
index 037844e9f7..cb8d48c0ea 100644
--- a/package/lua-rotas/lua-rotas.hash
+++ b/package/lua-rotas/lua-rotas.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  a947026be3552cbf676a0cef36a618111712257d306cbd9d340ed8895a4cbd2b  lua-rotas-0.2.1-1.src.rock
-sha256  ac8bb87b7b5e803ae27510b9c6fd284f1b00e741258bc59fc78d3bc107d96fbb  lua-Rotas-0.2.1/COPYRIGHT
+sha256  601d0fe9cb57e4c2fd22352c6e0f064888edc428e32f0cb7ddbdc9650f21d8d9  lua-rotas-0.2.2-1.src.rock
+sha256  1112307622ef36ed8ee3e8ddb15ed294e699a9db45f6251d89343534388ec3dd  lua-Rotas-0.2.2/COPYRIGHT
diff --git a/package/lua-rotas/lua-rotas.mk b/package/lua-rotas/lua-rotas.mk
index 84d6c9a582..5c9b2caacb 100644
--- a/package/lua-rotas/lua-rotas.mk
+++ b/package/lua-rotas/lua-rotas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ROTAS_VERSION = 0.2.1-1
+LUA_ROTAS_VERSION = 0.2.2-1
 LUA_ROTAS_NAME_UPSTREAM = lua-Rotas
 LUA_ROTAS_LICENSE = MIT
 LUA_ROTAS_LICENSE_FILES = $(LUA_ROTAS_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
