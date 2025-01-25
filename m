Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61690C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 13:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 307BF820C4;
	Sat, 25 Jan 2025 13:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TcbspY7W5J0L; Sat, 25 Jan 2025 13:13:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E27E820D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E27E820D7;
	Sat, 25 Jan 2025 13:13:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE818941
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC4E6606FF
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOsVWw3ZDpRc for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 13:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D90A2606E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D90A2606E8
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:13:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEE047FB18; Sat, 25 Jan 2025 13:13:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 14:04:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21f57ed4ed952d0d327903efe4dffc9044b1c43e
X-Git-Newrev: 85a79bdbfd1707820f3f769173076ffc7f46109e
X-Patchwork-Hint: ignore
Message-Id: <20250125131317.BEE047FB18@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lsdbus: bump to version
 3704232a634d1c866275b9a138b860421fd1c8ac
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=85a79bdbfd1707820f3f769173076ffc7f46109e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lua-lsdbus/lua-lsdbus.hash | 2 +-
 package/lua-lsdbus/lua-lsdbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
index 43029f61e9..d6f30c0529 100644
--- a/package/lua-lsdbus/lua-lsdbus.hash
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  33d14d52df702dbb2b1e5b7770cb4e4efb11df2da0b743c5f9a19e16a09783fe  lua-lsdbus-ae5e674e5e792dd72e4164c436ca7b064158e7c6.tar.gz
+sha256  fce5db789b18663c5c48010eaa0b3411f63a7f0b3c70c761535c0d5e3f9f5e11  lua-lsdbus-3704232a634d1c866275b9a138b860421fd1c8ac.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
index 606fa16c5e..d398af029f 100644
--- a/package/lua-lsdbus/lua-lsdbus.mk
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LSDBUS_VERSION = ae5e674e5e792dd72e4164c436ca7b064158e7c6
+LUA_LSDBUS_VERSION = 3704232a634d1c866275b9a138b860421fd1c8ac
 LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
 LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
 LUA_LSDBUS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
