Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1455C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98807843C7;
	Tue, 29 Mar 2022 20:31:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IC-Tz3kHlumg; Tue, 29 Mar 2022 20:31:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE19B843C2;
	Tue, 29 Mar 2022 20:31:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 137301BF2E3
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6035843A5
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5PUa8OK6aTS0 for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:29:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7F24843A9
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:29:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6695185F88; Tue, 29 Mar 2022 20:20:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 22:02:19 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a66f78923985a838ba5a8b2ed945ba2f77c7fb11
X-Git-Newrev: 5adb8c23fdd0537fa04a9e7b673b7d9daf5d4d1c
X-Patchwork-Hint: ignore
Message-Id: <20220329202022.6695185F88@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/dav1d: use
 official tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=5adb8c23fdd0537fa04a9e7b673b7d9daf5d4d1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0bdf40b1b0a36212fefef0b19632545f94c06423)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dav1d/dav1d.hash | 3 ++-
 package/dav1d/dav1d.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index b0f163bae7..5e838b0951 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,3 +1,4 @@
+# From http://download.videolan.org/pub/videolan/dav1d/0.9.2/dav1d-0.9.2.tar.xz.sha256
+sha256  e3235ab6c43c0135b0db1d131e1923fad4c84db9d85683e30b91b33a52d61c71  dav1d-0.9.2.tar.xz
 # Locally computed
-sha256  0d198c4fe63fe7f0395b1b17de75b21c8c4508cd3204996229355759efa30ef8  dav1d-0.9.2.tar.bz2
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index d7224625c8..ecc4cc55c3 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 DAV1D_VERSION = 0.9.2
-DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.bz2
-DAV1D_SITE = https://code.videolan.org/videolan/dav1d/-/archive/$(DAV1D_VERSION)
+DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
+DAV1D_SITE = http://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
 DAV1D_LICENSE_FILES = COPYING
 DAV1D_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
