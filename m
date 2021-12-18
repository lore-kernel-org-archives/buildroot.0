Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4D3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E93141D7B;
	Sat, 18 Dec 2021 22:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-T7X4IVtxkf; Sat, 18 Dec 2021 22:23:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F8B41DA4;
	Sat, 18 Dec 2021 22:23:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 014A61BF23C
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9E2B4017C
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HSj5X9LUU1u for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:23:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B908400AF
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:23:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C89587F89F; Sat, 18 Dec 2021 22:18:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 23:07:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b53b6ec34cc37aa547eb4d07d6ef43afc04cdee
X-Git-Newrev: 4e6ec456ef0c4d90878787a7e3525d9e12b01d02
X-Patchwork-Hint: ignore
Message-Id: <20211218221808.C89587F89F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ed: bump to version 1.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e6ec456ef0c4d90878787a7e3525d9e12b01d02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.gnu.org/archive/html/bug-ed/2021-01/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ed/ed.hash | 4 ++--
 package/ed/ed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 3169923c3d..90d467d1f3 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/bug-ed/2020-02/msg00002.html
-sha256  cfc07a14ab048a758473ce222e784fbf031485bcd54a76f74acfee1f390d8b2c  ed-1.16.tar.lz
+# From https://lists.gnu.org/archive/html/bug-ed/2021-01/msg00000.html
+sha256  71de39883c25b6fab44add80635382a10c9bf154515b94729f4a6529ddcc5e54  ed-1.17.tar.lz
 # Locally calculated
 sha256  f03a12bef9dfb7281864a0dd965166d4f4ec7a66633df2bc72fa4363e57de02c  COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 1b299781d0..975cf3be10 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ED_VERSION = 1.16
+ED_VERSION = 1.17
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
 ED_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
