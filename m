Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4A0C0218B
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC0578474C;
	Sat, 14 Sep 2024 09:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7gKJ-vwd8mj; Sat, 14 Sep 2024 09:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74D8B84763
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74D8B84763;
	Sat, 14 Sep 2024 09:23:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7F01BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 513D0605DC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDEF5cA75dox for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:22:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9326A605F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9326A605F7
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:22:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CE328706F; Sat, 14 Sep 2024 09:22:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:22:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8331fb05925b33fbff1b08367470652e31996b39
X-Git-Newrev: ed2013938f5962ad638d85232de96599bde231b5
X-Patchwork-Hint: ignore
Message-Id: <20240914092253.8CE328706F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lmdb: bump to version 0.9.33
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed2013938f5962ad638d85232de96599bde231b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

switch site to git.openldap.org

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lmdb/lmdb.hash | 2 +-
 package/lmdb/lmdb.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lmdb/lmdb.hash b/package/lmdb/lmdb.hash
index d72c66aace..4b80953dff 100644
--- a/package/lmdb/lmdb.hash
+++ b/package/lmdb/lmdb.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dd70a8c67807b3b8532b3e987b0a4e998962ecc28643e1af5ec77696b081c9b0  lmdb-0.9.31.tar.gz
+sha256  d19d52725800177b89d235161c0af8ae8b2932207e3c9eb87e95b61f1925206d  openldap-LMDB_0.9.33.tar.bz2
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  libraries/liblmdb/LICENSE
diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
index 86d72e1abc..e4f929c7f0 100644
--- a/package/lmdb/lmdb.mk
+++ b/package/lmdb/lmdb.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LMDB_VERSION = 0.9.31
-LMDB_SITE = $(call github,LMDB,lmdb,LMDB_$(LMDB_VERSION))
+LMDB_VERSION = 0.9.33
+LMDB_SOURCE = openldap-LMDB_$(LMDB_VERSION).tar.bz2
+LMDB_SITE = https://git.openldap.org/openldap/openldap/-/archive/LMDB_$(LMDB_VERSION)
 LMDB_LICENSE = OLDAP-2.8
 LMDB_LICENSE_FILES = libraries/liblmdb/LICENSE
 LMDB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
