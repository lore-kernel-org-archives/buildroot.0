Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C35ECAAD5
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 14:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95738404F7;
	Tue,  6 Sep 2022 14:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95738404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpBqPGJKmb96; Tue,  6 Sep 2022 14:57:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA6794019D;
	Tue,  6 Sep 2022 14:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA6794019D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C3A21BF9BA
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 14:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EF0141675
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 14:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EF0141675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlM1L0_duC1J for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 14:57:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31DB8415ED
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 14:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31DB8415ED
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A4DDD81937; Tue,  6 Sep 2022 14:42:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Sep 2022 16:48:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 02e7e6977df290ff6e5ad724024aefb9d571e297
X-Git-Newrev: 7637a8ac8830fd22ae89b236b4946f1b8ce03e75
X-Patchwork-Hint: ignore
Message-Id: <20220906144210.A4DDD81937@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/luasocket: bump to
 version 3.1.0
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
