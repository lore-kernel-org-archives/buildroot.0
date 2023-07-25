Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88282EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 364C3418AD;
	Tue, 25 Jul 2023 21:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 364C3418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z_i2Mv8fbwYt; Tue, 25 Jul 2023 21:15:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6B73418BC;
	Tue, 25 Jul 2023 21:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B73418BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E3181BF47A
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75DD840643
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75DD840643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTaj58cXMkfT for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89F194014B
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89F194014B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7103E8349A; Tue, 25 Jul 2023 21:15:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 23:08:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d33993395a9002448bf21bb734c55c36fcd4c62
X-Git-Newrev: 73cfad4ed9881f66ab388b20aab91bc5cd2a4d6c
X-Patchwork-Hint: ignore
Message-Id: <20230725211501.7103E8349A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump to version 2.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=73cfad4ed9881f66ab388b20aab91bc5cd2a4d6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license hash because of copyright year update (2022 -> 2023).

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jpeg-turbo/jpeg-turbo.hash | 10 +++++-----
 package/jpeg-turbo/jpeg-turbo.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 6e1278b48a..a929ae4dcb 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.4/
-sha1  5a355c08caa326cef7c2a61e062edfe8dd02ac07  libjpeg-turbo-2.1.4.tar.gz
-md5  3241b54016c445e5d8f0ebb0ad9294ed  libjpeg-turbo-2.1.4.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.1.5/
+sha1  edab071e7c5bc12f98a2a7ae499bd6b312770849  libjpeg-turbo-2.1.5.tar.gz
+md5  1c6e9f8550a82c6d4cd30b370c22a5fd  libjpeg-turbo-2.1.5.tar.gz
 # Locally computed
-sha256  d3ed26a1131a13686dfca4935e520eb7c90ae76fbc45d98bb50a8dc86230342b  libjpeg-turbo-2.1.4.tar.gz
-sha256  ee1eaf194d5924b6360af8a6ba6a4e1554037091f7505943300cdeec65f1aebb  LICENSE.md
+sha256  bc12bc9dce55300c6bf4342bc233bcc26bd38bf289eedf147360d731c668ddaf  libjpeg-turbo-2.1.5.tar.gz
+sha256  60c756742db3ad1913304e8b13f0e86e22e51adb50cc0b3333c163f7e45ceec1  LICENSE.md
 sha256  4b7b9f8c03bb8d60270dfd12684e70ab21e4abfd27e73905cd1a7c4cae6f5cdb  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index e5bc8e7cf2..5e806156e8 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.1.4
+JPEG_TURBO_VERSION = 2.1.5
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
