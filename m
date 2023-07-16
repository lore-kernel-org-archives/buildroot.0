Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE53EB64DA
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 07:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94DF081BF5;
	Sun, 16 Jul 2023 07:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94DF081BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzfbrPaevxRg; Sun, 16 Jul 2023 07:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D92B781BC6;
	Sun, 16 Jul 2023 07:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D92B781BC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F9F71BF2CC
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 07:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 152AD409DF
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 07:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152AD409DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8YNokmbnoJZ for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 07:17:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D85F3409C3
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 07:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D85F3409C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C479A86CC4; Sun, 16 Jul 2023 07:17:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 08:24:08 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: bf495325c1e3d2ab0184ebafeceac07b4797be39
X-Git-Newrev: 8375841e0b30a7ce8a22f656867f5d37c2fe2420
X-Patchwork-Hint: ignore
Message-Id: <20230716071722.C479A86CC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/dav1d: bump
 version to 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8375841e0b30a7ce8a22f656867f5d37c2fe2420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 199301a6d59af20f6a7bb6da0d22bffb64baaea4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 1af699dbe3..68757060bf 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.2.0/dav1d-1.2.0.tar.xz.sha256
-sha256  231bed8bc1bb28a41d88da6b4c2c118de84b92e5f1d67caffa1b7f81aaea8c6e  dav1d-1.2.0.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.2.1/dav1d-1.2.1.tar.xz.sha256
+sha256  4e33eb61ec54c768a16da0cf8fa0928b4c4593f5f804a3c887d4a21c318340b2  dav1d-1.2.1.tar.xz
 # Locally computed
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index f8d4464cd4..670a81d1c8 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.2.0
+DAV1D_VERSION = 1.2.1
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
