Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CFFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 21:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FB1D82EF1;
	Tue, 19 Jul 2022 21:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FB1D82EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KEFIjjRLO83l; Tue, 19 Jul 2022 21:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F3F82EDB;
	Tue, 19 Jul 2022 21:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F3F82EDB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B31D1BF37C
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83368400BB
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 21:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83368400BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1uur0U4Yv8C for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 21:51:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB5EE40105
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 21:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB5EE40105
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 277FD83F26; Tue, 19 Jul 2022 21:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 23:50:24 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 1666013009704961480ee0c2d9c4729a184a5faf
X-Git-Newrev: 76d1ac024a7178d46ce76351015cc0941122596c
X-Patchwork-Hint: ignore
Message-Id: <20220719213734.277FD83F26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 package/wireguard-linux-compat: bump version to 1.0.20211208
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

commit: https://git.buildroot.net/buildroot/commit/?id=76d1ac024a7178d46ce76351015cc0941122596c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2021-December/007369.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit df27a9daa68f2f9dae1315df5aed026f0e8df58d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index e18bd10cf7..3072b66e92 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2021-June/006781.html
-sha256  3f5d990006e6eabfd692d925ec314fff2c5ee7dcdb869a6510d579acfdd84ec0  wireguard-linux-compat-1.0.20210606.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2021-December/007369.html
+sha256  c0e607138a17daac656f508d8e63ea3737b5221fa5d9288191ddeb099f5a3b92  wireguard-linux-compat-1.0.20211208.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 1b7ec941db..44cc30f36e 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20210606
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20211208
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
