Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92427C38A2D
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 339BB400F8;
	Mon, 24 Oct 2022 21:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 339BB400F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P60onCCEL736; Mon, 24 Oct 2022 21:45:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7053D400CE;
	Mon, 24 Oct 2022 21:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7053D400CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68AD41BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B8A2402E8
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B8A2402E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qc60MTzeXhTR for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:43:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E109B4031E
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E109B4031E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE93F87048; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:27:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 225c0a9c0a7e790e92ee41d094932ce851b7dfcc
X-Git-Newrev: f17b56f1aa43361eff4a81538a61e34c509ebb70
X-Patchwork-Hint: ignore
Message-Id: <20221024214302.DE93F87048@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/file: bump to version 5.43
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

commit: https://git.buildroot.net/buildroot/commit/?id=f17b56f1aa43361eff4a81538a61e34c509ebb70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of src/vasprintf.c (typo fixed with
https://github.com/file/file/commit/42a6724bf9a9af6b1560100282fbe95341cf7125)

https://github.com/file/file/blob/FILE5_43/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/file/file.hash | 6 +++---
 package/file/file.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/file/file.hash b/package/file/file.hash
index 33875776eb..49fa9e1e1b 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,7 +1,7 @@
 # Locally calculated after verifying signature
-# ftp://ftp.astron.com/pub/file/file-5.41.tar.gz.asc
+# ftp://ftp.astron.com/pub/file/file-5.43.tar.gz.asc
 # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
-sha256  13e532c7b364f7d57e23dfeea3147103150cb90593a57af86c10e4f6e411603f  file-5.41.tar.gz
+sha256  8c8015e91ae0e8d0321d94c78239892ef9dbc70c4ade0008c0e95894abfb1991  file-5.43.tar.gz
 sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
 sha256  4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
-sha256  c4fa92d6504b88484a12140fe3e24b9b29b0112717f94b1ff4205d54828b1c70  src/vasprintf.c
+sha256  cc3d8704489d08eaefcaee8c639cc6436c6f0f6b2b03986d3ba7521a1a1d2fc9  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index c06975460f..9b751e2696 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.41
+FILE_VERSION = 5.43
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
