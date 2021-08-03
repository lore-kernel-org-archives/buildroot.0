Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81B9C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:58:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F89D6103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F89D6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 627D040368;
	Tue,  3 Aug 2021 19:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-MIokxwMEn7; Tue,  3 Aug 2021 19:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7B49403D3;
	Tue,  3 Aug 2021 19:58:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 49EC81BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 433284037E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wK7_nItwzxZz for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2710440368
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8B3E58B357; Tue,  3 Aug 2021 19:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 21:51:40 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 71f5e2e92f2b27a257819d95bb828c864d552b4b
X-Git-Newrev: 216902567f4340c3a29d9bfa2d4bbe41aae97a8f
X-Patchwork-Hint: ignore
Message-Id: <20210803195719.8B3E58B357@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/putty: bump to
 version 0.75
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=216902567f4340c3a29d9bfa2d4bbe41aae97a8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Upstream does not set -Werror in its build files anymore.  License file
just changed copyright years and holders.  PGP signatures of source
tarball and hashes were checked.

Link: https://www.chiark.greenend.org.uk/~sgtatham/putty/releases/0.75.html
Link: https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html
Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d562009f7b9701cb20bc4b1d389d19f9a647cc3b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.hash | 12 ++++++------
 package/putty/putty.mk   |  3 +--
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 3885cef9b8..8974aaac5e 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,8 +1,8 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.74/{md5,sha1,sha256,sha512}sums
-md5  dbfa58f22a91b22b7489173e9dd09e30  putty-0.74.tar.gz
-sha1  17b160e9720f67f9af9399d7d185b913b81f18fe  putty-0.74.tar.gz
-sha256  ddd5d388e51dd9e6e294005b30037f6ae802239a44c9dc9808c779e6d11b847d  putty-0.74.tar.gz
-sha512  0da86849ea764cd88643bd2c1984ac7211ae72dd7c41232307b1960a29ca9518044b022d87c60272d6db71a3357026862a112bedb90ee732b41494fca3acde9b  putty-0.74.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.75/{md5,sha1,sha256,sha512}sums
+md5  fae57a9ab209f303cc9e9f83eecaa27c  putty-0.75.tar.gz
+sha1  cdb976811a35eed67c5a2c588908b08edf6e3e1d  putty-0.75.tar.gz
+sha256  d3173b037eddbe9349abe978101277b4ba9f9959e25dedd44f87e7b85cc8f9f5  putty-0.75.tar.gz
+sha512  3dbc15485008a98daf60236061253e66b94a6e5da123fc84c5f0ac006c84e17c70fe748987677775e3b54a12297eb826cccf70a4fc039b633bc2d512938b3028  putty-0.75.tar.gz
 
 # Locally calculated
-sha256  92028b6d56212bd3e4ce6a36bd2e2454851dca7e8ffe4c6ab51385ca214ca322  LICENCE
+sha256  3f3e870dd3d0867d79370b1d433602c60bb91b59de04e5d8f2a149b788530d53  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 8a494d4e54..4876d3818e 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.74
+PUTTY_VERSION = 0.75
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
 PUTTY_CONF_OPTS = --disable-gtktest
-PUTTY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
 
 # Windows only, fixed for Windows with 0.75
 PUTTY_IGNORE_CVES += CVE-2021-33500
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
