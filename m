Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF8EC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 12:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A188E82061;
	Wed, 10 Jul 2024 12:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZUyBCUZEW9C0; Wed, 10 Jul 2024 12:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DAE382004
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DAE382004;
	Wed, 10 Jul 2024 12:25:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92BBB1BF5A8
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AE6841461
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBzfDakTnA3h for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 12:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 832B240327
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 832B240327
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 12:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BE4684612; Wed, 10 Jul 2024 12:25:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 14:24:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82730b2077b7d6b8b936359304ea42dd4a7cb8f2
X-Git-Newrev: ee5bacaf4d30705ea7793a0a33debaa6bbbea87c
X-Patchwork-Hint: ignore
Message-Id: <20240710122518.7BE4684612@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-livr-extra: bump to version
 0.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee5bacaf4d30705ea7793a0a33debaa6bbbea87c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
    -Copyright (C) 2018-2023 Francois Perrad.
    +Copyright (C) 2018-2024 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lua-livr-extra/lua-livr-extra.hash | 4 ++--
 package/lua-livr-extra/lua-livr-extra.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-livr-extra/lua-livr-extra.hash b/package/lua-livr-extra/lua-livr-extra.hash
index 7f8f66f056..28f71e4f02 100644
--- a/package/lua-livr-extra/lua-livr-extra.hash
+++ b/package/lua-livr-extra/lua-livr-extra.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  363e571d001b2e56eeafe2379c20aca65d67b5197199c957f9bb2a0c169aab5a  lua-livr-extra-0.2.0-1.src.rock
-sha256  ded97ea3e541833b9c2c9bf9b266f037a83b57e2e2847fecdfbb9397818f5623  lua-LIVR-extra-0.2.0/COPYRIGHT
+sha256  3033526912977b3c618090c9f6e610d8dca596d423c9d09446c3507f2cc1f879  lua-livr-extra-0.3.0-1.src.rock
+sha256  94306dda50b3db0017b5d4fc31de4b82658153fed00a579f8b53abba43182c8c  lua-LIVR-extra-0.3.0/COPYRIGHT
diff --git a/package/lua-livr-extra/lua-livr-extra.mk b/package/lua-livr-extra/lua-livr-extra.mk
index ce783f519f..c86da9372f 100644
--- a/package/lua-livr-extra/lua-livr-extra.mk
+++ b/package/lua-livr-extra/lua-livr-extra.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LIVR_EXTRA_VERSION = 0.2.0-1
+LUA_LIVR_EXTRA_VERSION = 0.3.0-1
 LUA_LIVR_EXTRA_NAME_UPSTREAM = lua-LIVR-extra
 LUA_LIVR_EXTRA_LICENSE = MIT
 LUA_LIVR_EXTRA_LICENSE_FILES = $(LUA_LIVR_EXTRA_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
