Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A230C001DE
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15EA16104B;
	Tue, 18 Jul 2023 21:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15EA16104B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KDUjjRoLv1zD; Tue, 18 Jul 2023 21:06:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3414761046;
	Tue, 18 Jul 2023 21:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3414761046
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B588E1BF95C
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F5DE404D3
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F5DE404D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id batNJGw17JNE for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:06:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9AEE40280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9AEE40280
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B896B87428; Tue, 18 Jul 2023 21:06:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:05:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cf3291ac8d0df8dae549e67ac6cc1564b2bf2a0
X-Git-Newrev: 902e4fbcf27b84f6c1bec7a62b20628f60abdd01
X-Patchwork-Hint: ignore
Message-Id: <20230718210616.B896B87428@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-livr-extra: bump to version
 0.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=902e4fbcf27b84f6c1bec7a62b20628f60abdd01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
-Copyright (C) 2018-2019 Francois Perrad.
+Copyright (C) 2018-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-livr-extra/lua-livr-extra.hash | 4 ++--
 package/lua-livr-extra/lua-livr-extra.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr-extra/lua-livr-extra.hash b/package/lua-livr-extra/lua-livr-extra.hash
index 747004cfa6..7f8f66f056 100644
--- a/package/lua-livr-extra/lua-livr-extra.hash
+++ b/package/lua-livr-extra/lua-livr-extra.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  42fef357db3e05e32112ddebcd4296f040a825dfac77ff2fa03aedbdcdaac729  lua-livr-extra-0.1.1-1.src.rock
-sha256  96751dc604608ecf2357d1599bc2d2e9f56382793a6c218dc98d460759adbf07  lua-LIVR-extra-0.1.1/COPYRIGHT
+sha256  363e571d001b2e56eeafe2379c20aca65d67b5197199c957f9bb2a0c169aab5a  lua-livr-extra-0.2.0-1.src.rock
+sha256  ded97ea3e541833b9c2c9bf9b266f037a83b57e2e2847fecdfbb9397818f5623  lua-LIVR-extra-0.2.0/COPYRIGHT
diff --git a/package/lua-livr-extra/lua-livr-extra.mk b/package/lua-livr-extra/lua-livr-extra.mk
index 0a6378dbf5..ce783f519f 100644
--- a/package/lua-livr-extra/lua-livr-extra.mk
+++ b/package/lua-livr-extra/lua-livr-extra.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_EXTRA_VERSION = 0.1.1-1
+LUA_LIVR_EXTRA_VERSION = 0.2.0-1
 LUA_LIVR_EXTRA_NAME_UPSTREAM = lua-LIVR-extra
 LUA_LIVR_EXTRA_LICENSE = MIT
 LUA_LIVR_EXTRA_LICENSE_FILES = $(LUA_LIVR_EXTRA_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
