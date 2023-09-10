Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3CDEE49A4
	for <buildroot@archiver.kernel.org>; Sun, 10 Sep 2023 16:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F3260DB7;
	Sun, 10 Sep 2023 16:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F3260DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2HnNmtJTB2M; Sun, 10 Sep 2023 16:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3954860C00;
	Sun, 10 Sep 2023 16:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3954860C00
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 848171BF263
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B9BF400D7
 for <buildroot@lists.busybox.net>; Sun, 10 Sep 2023 16:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B9BF400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1JOvVzTh8Frs for <buildroot@lists.busybox.net>;
 Sun, 10 Sep 2023 16:42:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9117F400A4
 for <buildroot@buildroot.org>; Sun, 10 Sep 2023 16:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9117F400A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BBD786B53; Sun, 10 Sep 2023 16:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 10 Sep 2023 18:37:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02497626adad0da120315e00ef8a323546ce53b8
X-Git-Newrev: 4dbee80f33db2464e8275a940c3371ba484153a5
X-Patchwork-Hint: ignore
Message-Id: <20230910164235.7BBD786B53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dbee80f33db2464e8275a940c3371ba484153a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since v0.3.23, see:
https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.24

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 2e5fa8865f..8e416f98f6 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.23
-md5  115634b39007de71eb7e75cf7591dfb2  openblas-0.3.23.tar.gz
+# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.24
+md5  23599a30e4ce887590957d94896789c8  openblas-0.3.24.tar.gz
 # Locally calculated
-sha256  5d9491d07168a5d00116cdc068a40022c3455bf9293c7cb86a65b1054d7e5114  openblas-0.3.23.tar.gz
+sha256  ceadc5065da97bd92404cac7254da66cc6eb192679cf1002098688978d4d5132  openblas-0.3.24.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index d8fcb4a2c6..0d0e8e56dd 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.23
+OPENBLAS_VERSION = 0.3.24
 OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
