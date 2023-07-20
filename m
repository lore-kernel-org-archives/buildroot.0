Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1E7EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C764D612A1;
	Thu, 20 Jul 2023 21:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C764D612A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKa_98I6wSId; Thu, 20 Jul 2023 21:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 970AF612D7;
	Thu, 20 Jul 2023 21:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 970AF612D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B9F51BF980
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8150141E25
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8150141E25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ukl3DEkj433Q for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9484841DDD
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9484841DDD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EA09874A8; Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:07:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e46856b4a905ba13c90ee7d491c7d18128130d12
X-Git-Newrev: 4dd6dd20b9a6bb16283dbb31a23b5f6e5320b65f
X-Patchwork-Hint: ignore
Message-Id: <20230720211019.7EA09874A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-jose: bump version to 1.11.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dd6dd20b9a6bb16283dbb31a23b5f6e5320b65f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/potatosalad/erlang-jose/blob/main/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-jose/erlang-jose.hash | 2 +-
 package/erlang-jose/erlang-jose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jose/erlang-jose.hash b/package/erlang-jose/erlang-jose.hash
index 75e6f0a041..1e763fd5ba 100644
--- a/package/erlang-jose/erlang-jose.hash
+++ b/package/erlang-jose/erlang-jose.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  87cdcb9df6f943c97772e5d90bed87555a72c8957ce2cb901df259050e18e7bb  erlang-jose-1.11.1.tar.gz
+sha256  2186b93ad20d386e6db9f673c135c48568a55de42b5a1d839518c65509af4ea5  erlang-jose-1.11.5.tar.gz
 sha256  6397e2bd9a35a64c1bb798b937071fbe49d90667f717e65c74a0d0fe93d5c1be  LICENSE.md
diff --git a/package/erlang-jose/erlang-jose.mk b/package/erlang-jose/erlang-jose.mk
index b31a60aa3e..4df5173b2c 100644
--- a/package/erlang-jose/erlang-jose.mk
+++ b/package/erlang-jose/erlang-jose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JOSE_VERSION = 1.11.1
+ERLANG_JOSE_VERSION = 1.11.5
 ERLANG_JOSE_SITE = $(call github,potatosalad,erlang-jose,$(ERLANG_JOSE_VERSION))
 ERLANG_JOSE_LICENSE = MIT
 ERLANG_JOSE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
