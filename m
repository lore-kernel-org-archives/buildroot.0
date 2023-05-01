Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E24C77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 11:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16CB540A56;
	Mon,  1 May 2023 11:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16CB540A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urrx6v6Cod-V; Mon,  1 May 2023 11:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 325F440B8C;
	Mon,  1 May 2023 11:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 325F440B8C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 697FC1BF336
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EBD54180B
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EBD54180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VX9q9w8cy0tM for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 11:52:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFBAB41821
 for <buildroot@buildroot.org>; Mon,  1 May 2023 11:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFBAB41821
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC09E84F81; Mon,  1 May 2023 11:52:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 13:51:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b63325e86a034b63075f01a2ddbb7c5b1f67dc1
X-Git-Newrev: 20026dd4d7ea17ada0d99a1fbd18b62af0f2ea40
X-Patchwork-Hint: ignore
Message-Id: <20230501115253.DC09E84F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.12.5
 "Dynamo"
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
Content-Type: multipart/mixed; boundary="===============3534992216570635163=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3534992216570635163==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=20026dd4d7ea17ada0d99a1fbd18b62af0f2ea40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is stable release of frontward _libmdbx_ branch with new superior features
on the day of 100 anniversary of USSR' «Dynamo» sports and fitness society.

The complete ChangeLog: https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index b1a2891b91..7a5b19952e 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  97b03965b5b61727dc4232c50ccb174c632470a3d24438b3c52315bef6fb4033  libmdbx-amalgamated-0.11.14.tar.xz
+sha256  9c3abaaf9079a9518bb7155734817a2e286fffea46f7cc0825dfbd1cf9174075  libmdbx-amalgamated-0.12.5.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 5e7995f8c8..0c6c9bcb9f 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.11.14
+LIBMDBX_VERSION = 0.12.5
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO

--===============3534992216570635163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3534992216570635163==--
