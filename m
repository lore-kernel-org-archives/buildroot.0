Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED59C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8804F82640;
	Mon,  6 Dec 2021 18:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxID8DQbbKYr; Mon,  6 Dec 2021 18:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB46D8100D;
	Mon,  6 Dec 2021 18:20:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0C5C1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52D5440488
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l--l0ErH7PWJ for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EA29400CF
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DD9E081503; Mon,  6 Dec 2021 18:07:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 21:54:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1723424b8189730087006fc879fdae0cc123ca1
X-Git-Newrev: ab816582a6eb58381129e22d1c43ea9251edc621
X-Patchwork-Hint: ignore
Message-Id: <20211206180739.DD9E081503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwpe: bump to version 1.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab816582a6eb58381129e22d1c43ea9251edc621
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:

  https://wpewebkit.org/release/libwpe-1.12.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 200b6c2798..2ebe4f19bd 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.10.1.tar.xz.sums
-md5  f60fc13b519a66d262afb76c77441870  libwpe-1.10.1.tar.xz
-sha1  1a8085b9a172d37e952c07bbb09b1654d4161ab2  libwpe-1.10.1.tar.xz
-sha256  a327b3ffcf2356dbe8148c1db4bbdc5359d7e7163d177f67551a8393b144adf0  libwpe-1.10.1.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.12.0.tar.xz.sums
+md5  5a3f11789535d826370ba465ea141393  libwpe-1.12.0.tar.xz
+sha1  91aa47a593a5db511d667b3bdbaa76dee4301311  libwpe-1.12.0.tar.xz
+sha256  e8eeca228a6b4c36294cfb63f7d3ba9ada47a430904a5a973b3c99c96a44c18c  libwpe-1.12.0.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 6396fe696d..fe3c4b16d7 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.10.1
+LIBWPE_VERSION = 1.12.0
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
