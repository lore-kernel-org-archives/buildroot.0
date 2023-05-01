Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11BCC77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 07:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43FAB61317;
	Mon,  1 May 2023 07:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43FAB61317
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MucAtemcWv5q; Mon,  1 May 2023 07:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ECEE61133;
	Mon,  1 May 2023 07:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ECEE61133
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 580B61BF852
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3107860767
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 07:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3107860767
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4RUo36IC5ib0 for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 07:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 601F360648
 for <buildroot@buildroot.org>; Mon,  1 May 2023 07:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 601F360648
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E44B846CB; Mon,  1 May 2023 07:26:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 09:24:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f32673ff8defabd50ec6f59fdb77152161d6afc3
X-Git-Newrev: 3ed1653bfb4f90a7dce5c463a1d76d007d46e7c6
X-Patchwork-Hint: ignore
Message-Id: <20230501072655.4E44B846CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dav1d: bump version to 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ed1653bfb4f90a7dce5c463a1d76d007d46e7c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 35d753fc27..cbeebc579d 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From http://download.videolan.org/pub/videolan/dav1d/1.0.0/dav1d-1.0.0.tar.xz.sha256
-sha256  51737db7e4897e599684f873a4725176dd3c779e639411d7c4fce134bb5ebb82  dav1d-1.0.0.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.1.0/dav1d-1.1.0.tar.xz.sha256
+sha256  fb57aae7875f28c30fb3dbae4a3683d27e2f91dde09ce5c60c22cef9bc58dfd1  dav1d-1.1.0.tar.xz
 # Locally computed
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 2d42cdcb67..5fe603fc1c 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.0.0
+DAV1D_VERSION = 1.1.0
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
-DAV1D_SITE = http://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
+DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
 DAV1D_LICENSE_FILES = COPYING
 DAV1D_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
