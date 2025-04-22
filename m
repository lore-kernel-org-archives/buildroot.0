Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F45C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 18:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DA2A80E6E;
	Tue, 22 Apr 2025 18:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbUr2446v0eU; Tue, 22 Apr 2025 18:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980B180E8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 980B180E8F;
	Tue, 22 Apr 2025 18:52:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 697D51BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F5E14098C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNGfes0loerh for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 18:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BDCD4096D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BDCD4096D
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 18:52:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93CED860C8; Tue, 22 Apr 2025 18:52:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 20:46:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6240b75d0cd2d602e8449a093c6a0499b3e66733
X-Git-Newrev: 47232b4f621ea101b3de817e9b1eb753631bca45
X-Patchwork-Hint: ignore
Message-Id: <20250422185247.93CED860C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.13.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============1956297239254869676=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1956297239254869676==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=47232b4f621ea101b3de817e9b1eb753631bca45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release called "Бузина" (Elderberry) of the stable libmdbx branch.

Please visit https://libmdbx.dqdkfa.ru for more information, changelog,
credits and acknowledgments, documentation, C++ API description and
links to the original git repo with the source code. Questions, feedback
and suggestions are welcome to the Telegram' group https://t.me/libmdbx.

Since 0.13.x libmdbx is licensed under the Apache 2.0 License.
For notes about the license change, please refer to the COPYRIGHT file
within original libmdbx source code repository
https://gitflic.ru/project/erthink/libmdbx

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmdbx/libmdbx.hash | 4 ++--
 package/libmdbx/libmdbx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 202937e7be..ae5266716b 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,6 +1,6 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  86df30ca2231c9b3ad71424bb829dca9041947f5539d4295030c653d4982c1be  libmdbx-amalgamated-0.13.4.tar.xz
+sha256  57db987de6f7ccc66a66ae28a7bda9f9fbb48ac5fb9279bcca92fd5de13075d1  libmdbx-amalgamated-0.13.6.tar.xz
 
 # Locally calculated
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
-sha256  699a62986b6c8d31124646dffd4b15872c7d3bc5eecea5994edb1f5195df49d1  NOTICE
+sha256  651f71b46c6bb0046d2122df7f9def9cb24f4dc28c5b11cef059f66565cda30f  NOTICE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index 204815e688..f461d98397 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.13.4
+LIBMDBX_VERSION = 0.13.6
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO

--===============1956297239254869676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1956297239254869676==--
