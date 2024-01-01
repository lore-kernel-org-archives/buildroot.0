Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED83C4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ED7641741;
	Mon,  1 Jan 2024 21:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ED7641741
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OT8WH3r5I8LE; Mon,  1 Jan 2024 21:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DEF440A44;
	Mon,  1 Jan 2024 21:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DEF440A44
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1366B1BF3D5
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74B744086E
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74B744086E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kd6hKWrTHTqy for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:06:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32F2440645
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32F2440645
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 206CB83B1F; Mon,  1 Jan 2024 21:06:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 22:05:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5328e02cf78a055fdfa81384780bd43771f34a06
X-Git-Newrev: bdeaa933fbe899c515edf80602ce4128b3a3cf45
X-Patchwork-Hint: ignore
Message-Id: <20240101210633.206CB83B1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenh264: bump to version 2.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdeaa933fbe899c515edf80602ce4128b3a3cf45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/cisco/openh264/blob/v2.4.0/RELEASES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libopenh264/libopenh264.hash | 2 +-
 package/libopenh264/libopenh264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index eecb0b9625..fe98b7773f 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  453afa66dacb560bc5fd0468aabee90c483741571bca820a39a1c07f0362dc32  libopenh264-2.3.1.tar.gz
+sha256  a44d1ccc348a790f9a272bba2d1c2eb9a9bbd0302e4e9b655d709e1c32f92691  libopenh264-2.4.0.tar.gz
 sha256  dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 750ec41e4d..478c29d7a8 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = 2.3.1
+LIBOPENH264_VERSION = 2.4.0
 LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
