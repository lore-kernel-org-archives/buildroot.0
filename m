Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA0EEC8734
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A6580ECA;
	Thu,  7 Sep 2023 15:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A6580ECA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eevXPXxZHUdm; Thu,  7 Sep 2023 15:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D1EC83C41;
	Thu,  7 Sep 2023 15:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1EC83C41
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CD091BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8255841DDD
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8255841DDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 28nBN-rMT3JT for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 965DB41D99
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 965DB41D99
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B41686A1E; Thu,  7 Sep 2023 14:51:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:23:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebe2a113aba9f15e19c36c0c204e50980ba7e7ae
X-Git-Newrev: f0ca197b0e2eb70355704d1202ef0437a2cec9ab
X-Patchwork-Hint: ignore
Message-Id: <20230907145130.7B41686A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: bump package to version
 8.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0ca197b0e2eb70355704d1202ef0437a2cec9ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release note:
https://octave.org/news/release/2023/08/08/octave-8.3.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 6e82a589ec..a655f82849 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-8.2.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-8.3.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  8ac875a9f8e44b8eb4b75ca8638531e2ca47cd9d13a6ca39d3a0eccd175f8a05  octave-8.2.0.tar.lz
+sha256  4dbd5da711b20ce640d75471895172b60e0bb9f45b75a0daa5ddf3050488d639  octave-8.3.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 81954bbdd3..86f5564c02 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 8.2.0
+OCTAVE_VERSION = 8.3.0
 OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
