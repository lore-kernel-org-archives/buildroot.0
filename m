Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E151C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30CC68179A;
	Sun,  6 Aug 2023 12:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30CC68179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpAdgPYMvebh; Sun,  6 Aug 2023 12:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F29881E7D;
	Sun,  6 Aug 2023 12:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F29881E7D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CF261BF2A4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DCD860B1F
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DCD860B1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZIENCIIozHG for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:05:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A46DE60A87
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 12:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A46DE60A87
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92A5F84323; Sun,  6 Aug 2023 12:05:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 13:55:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cb9c63055db66f29cc0af15ba3f2be87ead0cf6f
X-Git-Newrev: 727584320785aca15990b2a03d4ff7b541b4c210
X-Patchwork-Hint: ignore
Message-Id: <20230806120520.92A5F84323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-rotas: bump to
 version 0.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=727584320785aca15990b2a03d4ff7b541b4c210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-rotas/lua-rotas.hash | 4 ++--
 package/lua-rotas/lua-rotas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-rotas/lua-rotas.hash b/package/lua-rotas/lua-rotas.hash
index cb8d48c0ea..6b33d94a85 100644
--- a/package/lua-rotas/lua-rotas.hash
+++ b/package/lua-rotas/lua-rotas.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  601d0fe9cb57e4c2fd22352c6e0f064888edc428e32f0cb7ddbdc9650f21d8d9  lua-rotas-0.2.2-1.src.rock
-sha256  1112307622ef36ed8ee3e8ddb15ed294e699a9db45f6251d89343534388ec3dd  lua-Rotas-0.2.2/COPYRIGHT
+sha256  c1570d38552816c7b4a4881e491049a22214ddaa609f65d9edc8013b416cecf7  lua-rotas-0.3.0-1.src.rock
+sha256  1112307622ef36ed8ee3e8ddb15ed294e699a9db45f6251d89343534388ec3dd  lua-Rotas-0.3.0/COPYRIGHT
diff --git a/package/lua-rotas/lua-rotas.mk b/package/lua-rotas/lua-rotas.mk
index 5c9b2caacb..79e1e42291 100644
--- a/package/lua-rotas/lua-rotas.mk
+++ b/package/lua-rotas/lua-rotas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ROTAS_VERSION = 0.2.2-1
+LUA_ROTAS_VERSION = 0.3.0-1
 LUA_ROTAS_NAME_UPSTREAM = lua-Rotas
 LUA_ROTAS_LICENSE = MIT
 LUA_ROTAS_LICENSE_FILES = $(LUA_ROTAS_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
