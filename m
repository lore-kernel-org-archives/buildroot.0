Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7B7C0015E
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00C108223B;
	Sat, 22 Jul 2023 21:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00C108223B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fW6LpjtcfV_N; Sat, 22 Jul 2023 21:24:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF1B78235E;
	Sat, 22 Jul 2023 21:24:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1B78235E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 748C31BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E13683323
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E13683323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ph1P8c1y6pLG for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:24:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30E698235E
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30E698235E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F87F821B6; Sat, 22 Jul 2023 21:24:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:23:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89260833ed9483284c9e349c43a71be0df8ea20d
X-Git-Newrev: d06e610d582e3be4b20f9939e5cab6765b7fb69a
X-Patchwork-Hint: ignore
Message-Id: <20230722212401.1F87F821B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: bump to version 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d06e610d582e3be4b20f9939e5cab6765b7fb69a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://mesonbuild.com/Release-notes-for-1-2-0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index cb36b674fa..02fa1535ef 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.1.1/meson-1.1.1.tar.gz.asc
-sha256  d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c  meson-1.1.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.2.0/meson-1.2.0.tar.gz.asc
+sha256  1c0b634fe6b6a7072e398647f1bf392048577068a5c92ae44d04085dab0ded6f  meson-1.2.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 503aca8c25..8eabe108c4 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.1.1
+MESON_VERSION = 1.2.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
