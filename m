Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7C0E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 12:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42E4E400EF;
	Sun,  1 Oct 2023 12:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E4E400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mk6drYH7KbmR; Sun,  1 Oct 2023 12:41:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79651402A7;
	Sun,  1 Oct 2023 12:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79651402A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7C901BF479
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 12:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FED94095B
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 12:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FED94095B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WGMNpv2GepN for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 12:40:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 576F640905
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 12:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576F640905
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4404E81EA4; Sun,  1 Oct 2023 12:40:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 14:37:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de38484ec31437e3f2f0d7c0fa46f2f30d0a8fbb
X-Git-Newrev: 4111a8db7fdfa8c2f1012cad38849d3fec41b5b3
X-Patchwork-Hint: ignore
Message-Id: <20231001124056.4404E81EA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-mqtt: bump to version 0.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4111a8db7fdfa8c2f1012cad38849d3fec41b5b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-mqtt/lua-mqtt.hash | 4 ++--
 package/lua-mqtt/lua-mqtt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-mqtt/lua-mqtt.hash b/package/lua-mqtt/lua-mqtt.hash
index 62f8f350fa..fecd4dbbdd 100644
--- a/package/lua-mqtt/lua-mqtt.hash
+++ b/package/lua-mqtt/lua-mqtt.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  1b5ec0aebb2d41700762e3d6f542517c55b8cf44e323c53d55a47f19e22b664a  lua-mqtt-0.3.0-1.src.rock
-sha256  c8d12c868b979f5b9592eec503fc3de54e9feb92163f3cfc50a141ee2bcccc25  lua-mqtt-0.3.0/COPYRIGHT
+sha256  0444119ab5a1230e38e35f3948db19e8dc6310991b419ca75e6660588f2d95f7  lua-mqtt-0.3.1-1.src.rock
+sha256  c8d12c868b979f5b9592eec503fc3de54e9feb92163f3cfc50a141ee2bcccc25  lua-mqtt-0.3.1/COPYRIGHT
diff --git a/package/lua-mqtt/lua-mqtt.mk b/package/lua-mqtt/lua-mqtt.mk
index ff889237e4..a000ffdb16 100644
--- a/package/lua-mqtt/lua-mqtt.mk
+++ b/package/lua-mqtt/lua-mqtt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MQTT_VERSION = 0.3.0-1
+LUA_MQTT_VERSION = 0.3.1-1
 LUA_MQTT_LICENSE = MIT
 LUA_MQTT_LICENSE_FILES = $(LUA_MQTT_SUBDIR)/COPYRIGHT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
