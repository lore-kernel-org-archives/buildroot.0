Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABAAC02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 10:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6A53410E0;
	Sun, 16 Feb 2025 10:58:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSnBRYI0fEFX; Sun, 16 Feb 2025 10:58:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E46A41117
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E46A41117;
	Sun, 16 Feb 2025 10:58:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EA3BDE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1815540F8F
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDpGIcqLTW0T for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 10:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5EC740151
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5EC740151
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 10:58:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE40487610; Sun, 16 Feb 2025 10:58:33 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 11:55:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c98a3ddc3c73da474d54e10f3c369ad9af89db9
X-Git-Newrev: acb81d4a690ab30d6d9cedc811b20d89ff128376
X-Patchwork-Hint: ignore
Message-Id: <20250216105833.CE40487610@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmdbx: bump version to 0.13.4
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
Content-Type: multipart/mixed; boundary="===============0170879479564289816=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0170879479564289816==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=acb81d4a690ab30d6d9cedc811b20d89ff128376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is stable release "Sigma Boy" of frontward libmdbx branch with new superior features.

Since 0.13.x libmdbx is licensed under the Apache 2.0 License.
For notes about the license change, credits and acknowledgments,
please refer to the COPYRIGHT file within original libmdbx source code
repository https://gitflic.ru/project/erthink/libmdbx

Please visit https://libmdbx.dqdkfa.ru for more information, changelog,
documentation, C++ API description and links to the original git repo
with the source code. Questions, feedback and suggestions are welcome
to the Telegram' group https://t.me/libmdbx.

Signed-off-by: Леонид Юрьев (Leonid Yuriev) <leo@yuriev.ru>
[Julien: remove _REDISTRIBUTE = YES to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmdbx/libmdbx.hash | 5 +++--
 package/libmdbx/libmdbx.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
index 222e7caf5c..202937e7be 100644
--- a/package/libmdbx/libmdbx.hash
+++ b/package/libmdbx/libmdbx.hash
@@ -1,5 +1,6 @@
 # Hashes from: https://libmdbx.dqdkfa.ru/release/SHA256SUMS
-sha256  19c0eb33e1ed43ca2a94dceb06dd31946432d16f30a9751d3701c67efa22eb1a  libmdbx-amalgamated-0.12.12.tar.xz
+sha256  86df30ca2231c9b3ad71424bb829dca9041947f5539d4295030c653d4982c1be  libmdbx-amalgamated-0.13.4.tar.xz
 
 # Locally calculated
-sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
+sha256  699a62986b6c8d31124646dffd4b15872c7d3bc5eecea5994edb1f5195df49d1  NOTICE
diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
index c736945e92..204815e688 100644
--- a/package/libmdbx/libmdbx.mk
+++ b/package/libmdbx/libmdbx.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBMDBX_VERSION = 0.12.12
+LIBMDBX_VERSION = 0.13.4
 LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.xz
 LIBMDBX_SITE = https://libmdbx.dqdkfa.ru/release
 LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
-LIBMDBX_LICENSE = OLDAP-2.8
-LIBMDBX_LICENSE_FILES = LICENSE
+LIBMDBX_LICENSE = Apache-2.0
+LIBMDBX_LICENSE_FILES = LICENSE NOTICE
 LIBMDBX_STRIP_COMPONENTS = 0
 LIBMDBX_INSTALL_STAGING = YES
 

--===============0170879479564289816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0170879479564289816==--
