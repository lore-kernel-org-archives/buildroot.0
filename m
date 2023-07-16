Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF718EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 09:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8443981E34;
	Sun, 16 Jul 2023 09:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8443981E34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4SXnsROrktF; Sun, 16 Jul 2023 09:11:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB65D81E2F;
	Sun, 16 Jul 2023 09:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB65D81E2F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B0601BF8B4
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20BF740985
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20BF740985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZvK5hMsxiV8g for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 09:11:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10E654097C
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10E654097C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1C3E84003; Sun, 16 Jul 2023 09:11:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:27:24 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a65eb8c871ad7bd17ead79035bccb97838f6d0be
X-Git-Newrev: 77d944f083f4f6494642abc2b4278b112e8595d7
X-Patchwork-Hint: ignore
Message-Id: <20230716091125.F1C3E84003@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/dav1d: bump
 version to 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=77d944f083f4f6494642abc2b4278b112e8595d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3ed1653bfb4f90a7dce5c463a1d76d007d46e7c6)
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
