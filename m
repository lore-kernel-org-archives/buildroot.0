Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63661EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 12:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F790414C0;
	Sun, 18 Jun 2023 12:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F790414C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mq5_kip_5JAJ; Sun, 18 Jun 2023 12:49:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C079041741;
	Sun, 18 Jun 2023 12:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C079041741
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AF441BF5A8
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA0EF4032A
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA0EF4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QncS_Oo_0c2E for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 12:48:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A0F4402F6
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 12:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A0F4402F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0854B83C1C; Sun, 18 Jun 2023 12:48:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 14:46:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21674cb1f7030d43e201d735b42621fd170e79b4
X-Git-Newrev: b91524f373ad5f82b0cfa3d00aa36689eb4f4ef4
X-Patchwork-Hint: ignore
Message-Id: <20230618124833.0854B83C1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nettle: bump version to 3.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b91524f373ad5f82b0cfa3d00aa36689eb4f4ef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00007.html
https://lists.gnu.org/archive/html/info-gnu/2023-06/msg00000.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nettle/nettle.hash | 4 ++--
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index d726cb94c6..6c2486e260 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.8.1.tar.gz.sig
-sha256  364f3e2b77cd7dcde83fd7c45219c834e54b0c75e428b6f894a23d12dd41cbfe  nettle-3.8.1.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.9.1.tar.gz.sig
+sha256  ccfeff981b0ca71bbd6fbcb054f407c60ffb644389a5be80d6716d5b550c6ce3  nettle-3.9.1.tar.gz
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index dd4dfbbe38..d1987d427f 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.8.1
+NETTLE_VERSION = 3.9.1
 NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
