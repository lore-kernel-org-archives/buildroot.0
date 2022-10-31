Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEC1FA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B1EF60D71;
	Mon, 31 Oct 2022 14:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1EF60D71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zxlSvklGpwXJ; Mon, 31 Oct 2022 14:43:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4625960C25;
	Mon, 31 Oct 2022 14:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4625960C25
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4518C1BF95D
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D76381991
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D76381991
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jiyQI3ihpBEO for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6834981987
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6834981987
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55C7D87968; Mon, 31 Oct 2022 14:42:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 15:42:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b55d1e9c1549ef7f53c9cf42e8cd73745063fdfe
X-Git-Newrev: ce2b819d74465dc9720eeb8e5f18d789b5d2915f
X-Patchwork-Hint: ignore
Message-Id: <20221031144227.55C7D87968@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-lyaml: bump to version 6.2.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce2b819d74465dc9720eeb8e5f18d789b5d2915f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENCE:
-Copyright (C) 2013-2020 Gary V. Vaughan
+Copyright (C) 2013-2022 Gary V. Vaughan

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-lyaml/lua-lyaml.hash | 4 ++--
 package/lua-lyaml/lua-lyaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-lyaml/lua-lyaml.hash b/package/lua-lyaml/lua-lyaml.hash
index af3d0ae6da..a8599bc3dd 100644
--- a/package/lua-lyaml/lua-lyaml.hash
+++ b/package/lua-lyaml/lua-lyaml.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  9bb489cefae48b150d66f6bab4141d8d5831fcb7465bfc52a9845fa01efc63b0  lua-lyaml-6.2.7.tar.gz
-sha256  81e4ea1d897e259b31111adc2d3c185fe23e435942ff3e9de8c8c9c5d01247d0  LICENSE
+sha256  c6169f516ff2a8da96d55aa3a087e718edf7bceb2f1cae2def4e65cd2b41ac2d  lua-lyaml-6.2.8.tar.gz
+sha256  796d267e51d61652c55694d21108e7352e98b1ed489ab7516acc07102157e08d  LICENSE
diff --git a/package/lua-lyaml/lua-lyaml.mk b/package/lua-lyaml/lua-lyaml.mk
index 77980f5312..00a868ec29 100644
--- a/package/lua-lyaml/lua-lyaml.mk
+++ b/package/lua-lyaml/lua-lyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LYAML_VERSION = 6.2.7
+LUA_LYAML_VERSION = 6.2.8
 LUA_LYAML_NAME_UPSTREAM = lyaml
 LUA_LYAML_SITE = $(call github,gvvaughan,$(LUA_LYAML_NAME_UPSTREAM),v$(LUA_LYAML_VERSION))
 LUA_LYAML_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
