Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E55FCCA492
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0CC840B5A;
	Tue,  7 Jun 2022 19:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8x1eta7-BYgR; Tue,  7 Jun 2022 19:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1337740B49;
	Tue,  7 Jun 2022 19:28:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B13B1BF9B4
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C01C408C8
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sI19A7j4fDOn for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DA0C405EC
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1E2BB86E22; Tue,  7 Jun 2022 19:04:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:26:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a02fb55404b9b6a0b98777fdb2dfa4403fd685e
X-Git-Newrev: 4adef845d150ae09300b6722bfacfbd17fa2e47e
X-Patchwork-Hint: ignore
Message-Id: <20220607190457.1E2BB86E22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-jose: bump version to 1.11.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=4adef845d150ae09300b6722bfacfbd17fa2e47e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-jose/erlang-jose.hash | 4 ++--
 package/erlang-jose/erlang-jose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-jose/erlang-jose.hash b/package/erlang-jose/erlang-jose.hash
index 71a1543d92..75e6f0a041 100644
--- a/package/erlang-jose/erlang-jose.hash
+++ b/package/erlang-jose/erlang-jose.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d55a9d3a1697833fed555a21f1aeb2727af88193995cb6ffa945d4b6749d0e8d erlang-jose-1.9.0.tar.gz
-sha256 6397e2bd9a35a64c1bb798b937071fbe49d90667f717e65c74a0d0fe93d5c1be LICENSE.md
+sha256  87cdcb9df6f943c97772e5d90bed87555a72c8957ce2cb901df259050e18e7bb  erlang-jose-1.11.1.tar.gz
+sha256  6397e2bd9a35a64c1bb798b937071fbe49d90667f717e65c74a0d0fe93d5c1be  LICENSE.md
diff --git a/package/erlang-jose/erlang-jose.mk b/package/erlang-jose/erlang-jose.mk
index 43ed22a9f7..b31a60aa3e 100644
--- a/package/erlang-jose/erlang-jose.mk
+++ b/package/erlang-jose/erlang-jose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JOSE_VERSION = 1.9.0
+ERLANG_JOSE_VERSION = 1.11.1
 ERLANG_JOSE_SITE = $(call github,potatosalad,erlang-jose,$(ERLANG_JOSE_VERSION))
 ERLANG_JOSE_LICENSE = MIT
 ERLANG_JOSE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
