Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EE6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CABF740216;
	Sun, 21 Nov 2021 20:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvkS2lCQ7fFV; Sun, 21 Nov 2021 20:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BB3E4018C;
	Sun, 21 Nov 2021 20:38:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8B81BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C9F860673
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JKAXEhXJKDrw for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:38:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8885D6061F
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:38:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6B4E98DC41; Sun, 21 Nov 2021 20:33:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:37:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e22572d1a109f4010c552d72e91da86a3fd1e3fa
X-Git-Newrev: 9f41dfe7877ce3d19cc848e5f4852f1acc2c0798
X-Patchwork-Hint: ignore
Message-Id: <20211121203338.6B4E98DC41@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hackrf: replace BSD-3c by
 BSD-3-Clause
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f41dfe7877ce3d19cc848e5f4852f1acc2c0798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hackrf/hackrf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index b83f6518e8..391bddcdb0 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -7,7 +7,7 @@
 HACKRF_VERSION = 2018.01.1
 HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VERSION)
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
-HACKRF_LICENSE = GPL-2.0+ BSD-3c
+HACKRF_LICENSE = GPL-2.0+ BSD-3-Clause
 HACKRF_LICENSE_FILES = COPYING
 HACKRF_DEPENDENCIES = fftw-single libusb
 HACKRF_SUBDIR = host
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
