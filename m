Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19AEEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5059E4089E;
	Sun, 20 Aug 2023 21:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5059E4089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9R-A5P8sxMb; Sun, 20 Aug 2023 21:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46B494048F;
	Sun, 20 Aug 2023 21:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46B494048F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5823A1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30FB84036A
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30FB84036A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id luLsQGbKg8gh for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:24:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FDAC40136
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FDAC40136
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5FECF85E9E; Sun, 20 Aug 2023 21:24:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:23:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ebe2a113aba9f15e19c36c0c204e50980ba7e7ae
X-Git-Newrev: f0ca197b0e2eb70355704d1202ef0437a2cec9ab
X-Patchwork-Hint: ignore
Message-Id: <20230820212409.5FECF85E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/octave: bump package
 to version 8.3.0
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
