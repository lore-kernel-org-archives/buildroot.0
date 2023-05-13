Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A028AC77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 330654207B;
	Sat, 13 May 2023 20:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 330654207B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYKCsDmyRoih; Sat, 13 May 2023 20:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED62441E19;
	Sat, 13 May 2023 20:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED62441E19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B63D1BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5406860C2F
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5406860C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaavrVKHqKWs for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:36:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7906E60C02
 for <buildroot@buildroot.org>; Sat, 13 May 2023 20:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7906E60C02
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6108286613; Sat, 13 May 2023 20:36:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 22:36:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b41ff7dd46c50728603f1d2953352f82bba8c538
X-Git-Newrev: 8361da393bf7185950810e554bdd4d5aa1285faa
X-Patchwork-Hint: ignore
Message-Id: <20230513203648.6108286613@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-mqtt: bump to version 0.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8361da393bf7185950810e554bdd4d5aa1285faa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
-Copyright (C) 2022 Francois Perrad.
+Copyright (C) 2022-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lua-mqtt/lua-mqtt.hash | 4 ++--
 package/lua-mqtt/lua-mqtt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-mqtt/lua-mqtt.hash b/package/lua-mqtt/lua-mqtt.hash
index 3636e9e6af..62f8f350fa 100644
--- a/package/lua-mqtt/lua-mqtt.hash
+++ b/package/lua-mqtt/lua-mqtt.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  986ec63dd9f0761f9c5231f6e19529138602c289e13da5c71dc1449f5f247152  lua-mqtt-0.1.0-1.src.rock
-sha256  e86d7c8adfabcb7c6515cc6e524bf0a76f7b3a86560a7ac47d7cabae5f8391a2  lua-mqtt-0.1.0/COPYRIGHT
+sha256  1b5ec0aebb2d41700762e3d6f542517c55b8cf44e323c53d55a47f19e22b664a  lua-mqtt-0.3.0-1.src.rock
+sha256  c8d12c868b979f5b9592eec503fc3de54e9feb92163f3cfc50a141ee2bcccc25  lua-mqtt-0.3.0/COPYRIGHT
diff --git a/package/lua-mqtt/lua-mqtt.mk b/package/lua-mqtt/lua-mqtt.mk
index a2f17d2b2e..ff889237e4 100644
--- a/package/lua-mqtt/lua-mqtt.mk
+++ b/package/lua-mqtt/lua-mqtt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MQTT_VERSION = 0.1.0-1
+LUA_MQTT_VERSION = 0.3.0-1
 LUA_MQTT_LICENSE = MIT
 LUA_MQTT_LICENSE_FILES = $(LUA_MQTT_SUBDIR)/COPYRIGHT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
