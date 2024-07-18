Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F8AC3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B4240987;
	Thu, 18 Jul 2024 20:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3acXBg-gu_sj; Thu, 18 Jul 2024 20:03:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB35E4098A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB35E4098A;
	Thu, 18 Jul 2024 20:03:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77D3B1BF36D
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70DDC4098A
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z9GmjQw4rzls for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:03:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5710440987
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5710440987
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:03:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41BE686DA1; Thu, 18 Jul 2024 20:03:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 22:03:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d0f6ecc5a53c7197a1a1642702ea0fd8e370db6
X-Git-Newrev: eb5f194fcf7da0ce6338e594012e3d7e003f2898
X-Patchwork-Hint: ignore
Message-Id: <20240718200320.41BE686DA1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lsdbus: bump to version
 ca7509b41a26b4a3c9b9d2c523be090bdbcc89fe
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb5f194fcf7da0ce6338e594012e3d7e003f2898
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-lsdbus/lua-lsdbus.hash | 2 +-
 package/lua-lsdbus/lua-lsdbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
index 369370d63a..93a086f16c 100644
--- a/package/lua-lsdbus/lua-lsdbus.hash
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b515cd00c844abc80993e9552d884c71a80a680e47b90a628f1f7bd18b9b821a  lua-lsdbus-d132f8b2bd390d0b1c7d17b300190279f92bd494.tar.gz
+sha256  9a967720736b0f6ff9b3f527846de28aaf74f58775af6358c13c31c0ac37b832  lua-lsdbus-ca7509b41a26b4a3c9b9d2c523be090bdbcc89fe.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
index cbd7ee9d4b..865a5f8f34 100644
--- a/package/lua-lsdbus/lua-lsdbus.mk
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LSDBUS_VERSION = d132f8b2bd390d0b1c7d17b300190279f92bd494
+LUA_LSDBUS_VERSION = ca7509b41a26b4a3c9b9d2c523be090bdbcc89fe
 LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
 LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
 LUA_LSDBUS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
