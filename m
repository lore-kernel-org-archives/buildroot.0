Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA2AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 21:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87FCC83F07;
	Sun, 17 Jul 2022 21:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87FCC83F07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPSMlWiUZZ_3; Sun, 17 Jul 2022 21:24:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B3FE83EFF;
	Sun, 17 Jul 2022 21:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B3FE83EFF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45EF01BF29D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28E56416C2
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 21:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28E56416C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJFyZb0ELAYq for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 21:23:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7181F416B9
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 21:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7181F416B9
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7231783C45; Sun, 17 Jul 2022 21:10:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 23:10:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83bad5e0f00df3b03fd55916f5e03e64946ff177
X-Git-Newrev: 91923baf49f358160fe6e0850bdba3d03329a7f5
X-Patchwork-Hint: ignore
Message-Id: <20220717211032.7231783C45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvazaar: bump to version 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=91923baf49f358160fe6e0850bdba3d03329a7f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball and so drop autoreconf
- License is BSD-3-Clause and ISC since
  https://github.com/ultravideo/kvazaar/commit/57883369ca05bee0dbc0b36fb2c78985f906a523
- Update indentation in hash file (two spaces)

https://github.com/ultravideo/kvazaar/releases/tag/v2.1.0
https://github.com/ultravideo/kvazaar/releases/tag/v2.0.0
https://github.com/ultravideo/kvazaar/releases/tag/v1.3.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kvazaar/kvazaar.hash |  6 ++++--
 package/kvazaar/kvazaar.mk   | 10 +++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/kvazaar/kvazaar.hash b/package/kvazaar/kvazaar.hash
index fe3255a6c7..20b8e5918e 100644
--- a/package/kvazaar/kvazaar.hash
+++ b/package/kvazaar/kvazaar.hash
@@ -1,3 +1,5 @@
 # Locally calculated
-sha256 480ecfd9b4d2b7d21b355e4a35fcf47b4db7a3b0315b6219d93733db42392bd9  kvazaar-1.2.0.tar.gz
-sha256 531712277c3543b9ee86c4c4e0e424f531b893a44cc021c74a24b038d8de4d2a COPYING
+sha256  a76998462924ab8409cf8de4947ba5a5023daa33207676e9c4eefc2bbd46c834  kvazaar-2.1.0.tar.xz
+sha256  4caf7852236f62bfd77aac10a7b9a42372b00aa461ad8912780cd865a39062ff  LICENSE
+sha256  16f569c87d5ec20b7474b55ee0a8877b8f8b4dc13f9567ebe0b8fe8afdeb34d2  LICENSE.greatest
+sha256  f84c0f33873a015f399d8171cf321af2f09ef915ae7ad5a9edaa7d0286cf9d5e  LICENSE.x264asm
diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
index 29433d6eb3..e2ab132203 100644
--- a/package/kvazaar/kvazaar.mk
+++ b/package/kvazaar/kvazaar.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-KVAZAAR_VERSION = 1.2.0
-KVAZAAR_SITE = $(call github,ultravideo,kvazaar,v$(KVAZAAR_VERSION))
-KVAZAAR_LICENSE = LGPL-2.1+
-KVAZAAR_LICENSE_FILES = COPYING
-KVAZAAR_AUTORECONF = YES
+KVAZAAR_VERSION = 2.1.0
+KVAZAAR_SOURCE = kvazaar-$(KVAZAAR_VERSION).tar.xz
+KVAZAAR_SITE = https://github.com/ultravideo/kvazaar/releases/download/v$(KVAZAAR_VERSION)
+KVAZAAR_LICENSE = BSD-3-Clause, ISC (greatest, x264asm)
+KVAZAAR_LICENSE_FILES = LICENSE LICENSE.greatest LICENSE.x264asm
 KVAZAAR_INSTALL_STAGING = YES
 KVAZAAR_DEPENDENCIES = host-pkgconf
 KVAZAAR_CONF_OPTS = --without-cryptopp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
