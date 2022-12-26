Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FBDC4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1618F406E0;
	Mon, 26 Dec 2022 21:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1618F406E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 88-Qg3bumWnL; Mon, 26 Dec 2022 21:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31513405CE;
	Mon, 26 Dec 2022 21:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31513405CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C6E291BF3B9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A060D813A8
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A060D813A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IrRc8jw9IEtM for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:13:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F41E4813A7
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 21:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F41E4813A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E225386E35; Mon, 26 Dec 2022 21:13:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 22:10:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7145d04349fbc92588984a01180fc35f044f879a
X-Git-Newrev: 327b72f32bcfc01d580fa47f3e06cd42a828cd99
X-Patchwork-Hint: ignore
Message-Id: <20221226211335.E225386E35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-ev: bump to version 1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=327b72f32bcfc01d580fa47f3e06cd42a828cd99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lua-ev/lua-ev.hash | 4 ++--
 package/lua-ev/lua-ev.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-ev/lua-ev.hash b/package/lua-ev/lua-ev.hash
index eb4f4cf74c..278f5f8f7f 100644
--- a/package/lua-ev/lua-ev.hash
+++ b/package/lua-ev/lua-ev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4e26e05830955fdd882a1b48b535be94356582eea310327f839f830cd9250d3a  lua-ev-339426fbe528f11cb3cd1af69a88f06bba367981.tar.gz
-sha256  c224cc31feec52e33b621ccdbc245e21316a20a134a4cd8706438a3b3382e8ac  README
+sha256  26ac116722a241bf59daf5315ce0ffe751c1babea9a146ffc0a389f1af3facca  lua-ev-1.5.tar.gz
+sha256  3b6f8a25e3443c8be61fc7a91e1d27b5514d489bb3ea5986eace6fe1531aabcc  README
diff --git a/package/lua-ev/lua-ev.mk b/package/lua-ev/lua-ev.mk
index 39394875b8..eec078944b 100644
--- a/package/lua-ev/lua-ev.mk
+++ b/package/lua-ev/lua-ev.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUA_EV_VERSION = 339426fbe528f11cb3cd1af69a88f06bba367981
-LUA_EV_SITE = $(call github,brimworks,lua-ev,$(LUA_EV_VERSION))
+LUA_EV_VERSION = 1.5
+LUA_EV_SITE = $(call github,brimworks,lua-ev,v$(LUA_EV_VERSION))
 LUA_EV_DEPENDENCIES = luainterpreter libev
 LUA_EV_LICENSE = MIT
 LUA_EV_LICENSE_FILES = README
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
