Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41AEC77B7F
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 19:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84EA061561;
	Wed,  3 May 2023 19:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84EA061561
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeKLS3PlaB7k; Wed,  3 May 2023 19:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A3561550;
	Wed,  3 May 2023 19:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5A3561550
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ED871BF31F
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 19:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 706424099B
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 19:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 706424099B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_DhvFP3NS7x for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 19:40:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6885C40998
 for <buildroot@buildroot.org>; Wed,  3 May 2023 19:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6885C40998
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B06285AB3; Wed,  3 May 2023 19:40:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 3 May 2023 21:40:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a0857d734c5fca74915b1cd85b92555fe15fb93
X-Git-Newrev: 2c5ee71c4897eecf0d01b9fa6749640838eadb7e
X-Patchwork-Hint: ignore
Message-Id: <20230503194059.4B06285AB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpqxx: bump version to 7.7.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c5ee71c4897eecf0d01b9fa6749640838eadb7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libpqxx/libpqxx.hash | 4 ++--
 package/libpqxx/libpqxx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 167b5edc9d..1c0e4c185d 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  86921fdb0fe54495a79d5af2c96f2c771098c31e9b352d0834230fd2799ad362  libpqxx-6.4.5.tar.gz
-sha256  36c48c1ca1b0a68639d919196b5d92c971858ad8e24da24385ba1c65cc5eac38  COPYING
+sha256  c7dc3e8fa2eee656f2b6a8179d72f15db10e97a80dc4f173f806e615ea990973  libpqxx-7.7.5.tar.gz
+sha256  91718581edafc9f722915133d75f74c82d7c2e41a1831c1e042206423e5a63b0  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 9de7df3ed2..b280f5a52a 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 6.4.5
+LIBPQXX_VERSION = 7.7.5
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
