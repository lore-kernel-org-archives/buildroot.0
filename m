Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B63ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5008842E9;
	Sun, 11 Sep 2022 09:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5008842E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lo_HEgTcw9k; Sun, 11 Sep 2022 09:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E14B8842E0;
	Sun, 11 Sep 2022 09:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E14B8842E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B11A1BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA2CC60777
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA2CC60777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KguhpfjbnkDN for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 102D46102D
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 102D46102D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0EA71835E4; Sun, 11 Sep 2022 08:48:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 16:48:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02e7e6977df290ff6e5ad724024aefb9d571e297
X-Git-Newrev: 7637a8ac8830fd22ae89b236b4946f1b8ce03e75
X-Patchwork-Hint: ignore
Message-Id: <20220911084829.0EA71835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luasocket: bump to version 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7637a8ac8830fd22ae89b236b4946f1b8ce03e75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luasocket/luasocket.hash | 2 +-
 package/luasocket/luasocket.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luasocket/luasocket.hash b/package/luasocket/luasocket.hash
index b66ae57b9b..bfbc06f3ee 100644
--- a/package/luasocket/luasocket.hash
+++ b/package/luasocket/luasocket.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  63fd2dd18dfe242ca5bcc1203839e86a9c8936261a9ca9f3200f2deab431da88  luasocket-3.0.0-1.src.rock
+sha256  f4a207f50a3f99ad65def8e29c54ac9aac668b216476f7fae3fae92413398ed2  luasocket-3.1.0-1.src.rock
 sha256  224afe42d0738eaaeb57ab289466a1c4e77091591e69dbcef2dbb385589f2f41  luasocket/LICENSE
diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index eeece26fd5..be360a3371 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASOCKET_VERSION = 3.0.0-1
+LUASOCKET_VERSION = 3.1.0-1
 LUASOCKET_SUBDIR = luasocket
 LUASOCKET_LICENSE = MIT
 LUASOCKET_LICENSE_FILES = $(LUASOCKET_SUBDIR)/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
