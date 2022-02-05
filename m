Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D5EC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 15:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C38A60C14;
	Sat,  5 Feb 2022 15:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xRuDv2vN2-2y; Sat,  5 Feb 2022 15:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8288060BEA;
	Sat,  5 Feb 2022 15:32:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D54C1BF39A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A26E81BCF
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9frZIAMFWbhg for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 15:32:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67D3B81CD0
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 15:32:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0DCD48295E; Sat,  5 Feb 2022 15:25:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 16:31:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc27267ae41bf44276c63b1e86042c4fae4adf50
X-Git-Newrev: 1e48e5bf0c67295e219a2d7d58213d0a71a5863d
X-Patchwork-Hint: ignore
Message-Id: <20220205152507.0DCD48295E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lcms2: bump to version 2.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e48e5bf0c67295e219a2d7d58213d0a71a5863d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://littlecms.com/blog/2022/01/28/lcms2-2.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lcms2/lcms2.hash | 6 +++---
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 8477610ff0..d3ae1d934f 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.12
-sha1  3d0c0276fcd3930b80c424512ec0b1ed54ec1497  lcms2-2.12.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.13
+sha1  1676097fb18fce83c9c876d56828c83a6ad829dd  lcms2-2.13.tar.gz
 # Locally computed:
-sha256  18663985e864100455ac3e507625c438c3710354d85e5cbb7cd4043e11fe10f5  lcms2-2.12.tar.gz
+sha256  0c67a5cc144029cfa34647a52809ec399aae488db4258a6a66fba318474a070f  lcms2-2.13.tar.gz
 sha256  46d4e05af3bce75332a12d01f19bcce7e32b6bac544be28a64043d0231291e31  COPYING
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 49ddccd82b..5a253d044b 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.12
+LCMS2_VERSION = 2.13
 LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
