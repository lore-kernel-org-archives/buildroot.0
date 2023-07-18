Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72AFEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85FC361025;
	Tue, 18 Jul 2023 21:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FC361025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ADxhognQQdQa; Tue, 18 Jul 2023 21:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3D461006;
	Tue, 18 Jul 2023 21:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD3D461006
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0EBA1BF8C7
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A68160C19
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A68160C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCQf_jVUaFOb for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:06:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C052060B4C
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C052060B4C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF24787427; Tue, 18 Jul 2023 21:06:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:05:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab4f923f3291f39939d494b6ac49a5758144684c
X-Git-Newrev: 1cf3291ac8d0df8dae549e67ac6cc1564b2bf2a0
X-Patchwork-Hint: ignore
Message-Id: <20230718210616.AF24787427@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-livr: bump to version 0.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cf3291ac8d0df8dae549e67ac6cc1564b2bf2a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
-Copyright (C) 2018-2021 Francois Perrad.
+Copyright (C) 2018-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-livr/lua-livr.hash | 4 ++--
 package/lua-livr/lua-livr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr/lua-livr.hash b/package/lua-livr/lua-livr.hash
index fe9876909d..314f1d2bf8 100644
--- a/package/lua-livr/lua-livr.hash
+++ b/package/lua-livr/lua-livr.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  e2f39316b8a1e66420c56e8ddc9ce4c0118c1a240582f2ba52d7627da6dfb76d  lua-livr-0.2.2-1.src.rock
-sha256  69fd426251454ea43a8068e58ac25d882922372de6b22e249bb56e00ea2cd834  lua-LIVR-0.2.2/COPYRIGHT
+sha256  531c4d56e2ef7906a6075e61fafee9ea265dc1a62698b966f5fc2f3abda23084  lua-livr-0.3.0-1.src.rock
+sha256  c6c2ca8e29b8e3b0558b046ffcbd4a5c31800bdca4520002ed4af76985f82d7d  lua-LIVR-0.3.0/COPYRIGHT
diff --git a/package/lua-livr/lua-livr.mk b/package/lua-livr/lua-livr.mk
index 3f114c725e..fb835a1f90 100644
--- a/package/lua-livr/lua-livr.mk
+++ b/package/lua-livr/lua-livr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_VERSION = 0.2.2-1
+LUA_LIVR_VERSION = 0.3.0-1
 LUA_LIVR_NAME_UPSTREAM = lua-LIVR
 LUA_LIVR_LICENSE = MIT
 LUA_LIVR_LICENSE_FILES = $(LUA_LIVR_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
