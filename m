Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9612CECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 256C841825;
	Wed, 21 Sep 2022 20:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 256C841825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQz8tIprItta; Wed, 21 Sep 2022 20:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E841F417B1;
	Wed, 21 Sep 2022 20:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E841F417B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DB831BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 456C041729
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 456C041729
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zW5DW9Z3eEtF for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:37:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2552E417D7
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2552E417D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1303A856CA; Wed, 21 Sep 2022 20:37:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 22:34:55 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: d91453a419437f3cde9ba7026ec8b7c2316d0951
X-Git-Newrev: 5cba94e6025db1ef3bb092ad1fb33f80e2930ded
X-Patchwork-Hint: ignore
Message-Id: <20220921203705.1303A856CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libmdbx: bump
 version to 0.11.11
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
Content-Type: multipart/mixed; boundary="===============3343113679697834492=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3343113679697834492==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5cba94e6025db1ef3bb092ad1fb33f80e2930ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This is stable bugfix release of libmdbx. So it is reasonable to backport
this patch to all applicable releases/branches of Buildroot.

Release notes since v0.11.8:
 - for v0.11.9  https://gitflic.ru/project/erthink/libmdbx/release/4742671e-a691-45a5-88de-c6341f762d0b
 - for v0.11.10 https://gitflic.ru/project/erthink/libmdbx/release/2886daeb-f583-4c30-bede-b8e60965c834
 - for v0.11.11 https://gitflic.ru/project/erthink/libmdbx/release/7f1a026d-28aa-4d92-a1e0-a1a75ebe0b3d

The complete ChangeLog: https://gitflic.ru/project/erthink/libmdbx/blob?file=ChangeLog.md

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b8ff431322f4614ebddeb8b15dd57d530510f268)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmdbx/libmdbx.hash | 2 +-
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 33b2b53afa..c4d9c8d8ce 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,5 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  06011f361481ee7adc2111e48b7b121384294e0b6b8f10c75e7886629297b279  libmdbx-amalgamated-0.11.8.tar.xz
+sha256  d2c81db716a33d007cc75702ecf3c45cfb7c33a2261fbacced6945204ece1b67  libmdbx-amalgamated-0.11.11.tar.xz
 
 # Locally calculated
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 130fe96793..018c0db840 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.11.8
+LIBMDBX_VERSION = 0.11.11
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO

--===============3343113679697834492==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3343113679697834492==--
