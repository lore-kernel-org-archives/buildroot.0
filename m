Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B397EE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33E0C60BF1;
	Sun, 20 Aug 2023 21:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33E0C60BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6-aPa961vYS; Sun, 20 Aug 2023 21:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C06E60BE8;
	Sun, 20 Aug 2023 21:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C06E60BE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 817A51BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B2E9402B1
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B2E9402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYV7NtCgrSea for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:12:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A3FB40136
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A3FB40136
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6785E85E6E; Sun, 20 Aug 2023 21:12:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:12:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bf2d7f8f5395253e42c234f24ba0803eb85215bf
X-Git-Newrev: c252392fb557c8fb7c882cfdd44ca38978bc8908
X-Patchwork-Hint: ignore
Message-Id: <20230820211256.6785E85E6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-rotas: bump to
 version 0.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c252392fb557c8fb7c882cfdd44ca38978bc8908
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-rotas/lua-rotas.hash | 4 ++--
 package/lua-rotas/lua-rotas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-rotas/lua-rotas.hash b/package/lua-rotas/lua-rotas.hash
index 6b33d94a85..eccff44269 100644
--- a/package/lua-rotas/lua-rotas.hash
+++ b/package/lua-rotas/lua-rotas.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  c1570d38552816c7b4a4881e491049a22214ddaa609f65d9edc8013b416cecf7  lua-rotas-0.3.0-1.src.rock
-sha256  1112307622ef36ed8ee3e8ddb15ed294e699a9db45f6251d89343534388ec3dd  lua-Rotas-0.3.0/COPYRIGHT
+sha256  90ed9305b68f49f2293a3a547b7ec7c290be5bcc1afbae87e2e860eb3b04f18b  lua-rotas-0.3.1-1.src.rock
+sha256  1112307622ef36ed8ee3e8ddb15ed294e699a9db45f6251d89343534388ec3dd  lua-Rotas-0.3.1/COPYRIGHT
diff --git a/package/lua-rotas/lua-rotas.mk b/package/lua-rotas/lua-rotas.mk
index 79e1e42291..1f99dbaf08 100644
--- a/package/lua-rotas/lua-rotas.mk
+++ b/package/lua-rotas/lua-rotas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ROTAS_VERSION = 0.3.0-1
+LUA_ROTAS_VERSION = 0.3.1-1
 LUA_ROTAS_NAME_UPSTREAM = lua-Rotas
 LUA_ROTAS_LICENSE = MIT
 LUA_ROTAS_LICENSE_FILES = $(LUA_ROTAS_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
