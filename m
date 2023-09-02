Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4B1EC873D
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D247D83F1D;
	Thu,  7 Sep 2023 15:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D247D83F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCF_D2V3Ha9r; Thu,  7 Sep 2023 15:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D37683F18;
	Thu,  7 Sep 2023 15:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D37683F18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 164FA1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2B6C41E54
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2B6C41E54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6AYQd9-zhZK for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E776641E69
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E776641E69
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E112186A1F; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 14:47:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 571bf3f7a6f937d7625f12a768685fb78d29df9c
X-Git-Newrev: 464ff28b7a7afc73b51aa9324b24a5aca5bf2ade
X-Patchwork-Hint: ignore
Message-Id: <20230907145134.E112186A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luasec: bump to version 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=464ff28b7a7afc73b51aa9324b24a5aca5bf2ade
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-LuaSec 1.2.0 license
-Copyright (C) 2006-2022 Bruno Silvestre, UFG
+LuaSec 1.3.2 license
+Copyright (C) 2006-2023 Bruno Silvestre, UFG

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luasec/luasec.hash | 4 ++--
 package/luasec/luasec.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 3c2b7d803b..0fb9996d39 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  82d9ea7d11688a2b11fc1c4549a2e7b0aca00790b49e67a41dac0c81f2890f1c  luasec-1.2.0-1.src.rock
-sha256  bbf73e23eae7df57a4c4ff33bc23c41a2dc4f8707ba33235c2026d20b41405a7  luasec/LICENSE
+sha256  f93bf9927bd34a5d4f897f4488b285a12bee89c0e7d54b3b36dfcbf43a7ad4e5  luasec-1.3.2-1.src.rock
+sha256  a3eab8badfcce959ae0c50be4ce460b547785dba61e6dcc6a1dbb8f800a18563  luasec/LICENSE
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index c7f3a94d9a..6e338a7be3 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 1.2.0-1
+LUASEC_VERSION = 1.3.2-1
 LUASEC_SUBDIR = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
