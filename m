Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFF2C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD42740981;
	Mon,  5 Feb 2024 10:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD42740981
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rn1qnz8fAZ1w; Mon,  5 Feb 2024 10:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02F0B4025A;
	Mon,  5 Feb 2024 10:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02F0B4025A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C46E41BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB6AF60EA1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB6AF60EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ON5StJZvmFYX for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:19:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D93C9607C0
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D93C9607C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C345286A1D; Mon,  5 Feb 2024 10:19:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:17:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6925d696c1fdd89e2e86fca5ae70dc36c3b11d0a
X-Git-Newrev: 524f3536029dace3ce9aa154d3ca4685582e1955
X-Patchwork-Hint: ignore
Message-Id: <20240205101903.C345286A1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/autoconf: bump to version 2.72
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

commit: https://git.buildroot.net/buildroot/commit/?id=524f3536029dace3ce9aa154d3ca4685582e1955
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.savannah.gnu.org/cgit/autoconf.git/tree/NEWS?h=v2.72
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/autoconf/0001-dont-add-dirty-to-version.patch | 2 +-
 package/autoconf/autoconf.hash                        | 2 +-
 package/autoconf/autoconf.mk                          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/autoconf/0001-dont-add-dirty-to-version.patch b/package/autoconf/0001-dont-add-dirty-to-version.patch
index e8d9f6a29d..8df2276865 100644
--- a/package/autoconf/0001-dont-add-dirty-to-version.patch
+++ b/package/autoconf/0001-dont-add-dirty-to-version.patch
@@ -17,7 +17,7 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 diff -Nura autoconf-2.69.orig/build-aux/git-version-gen autoconf-2.69/build-aux/git-version-gen
 --- autoconf-2.69.orig/build-aux/git-version-gen	2013-06-27 11:31:02.340200154 -0300
 +++ autoconf-2.69/build-aux/git-version-gen	2013-06-27 11:31:13.734577033 -0300
-@@ -203,7 +203,7 @@
+@@ -210,7 +210,7 @@
        *) # Append the suffix only if there isn't one already.
            case $v in
              *-dirty) ;;
diff --git a/package/autoconf/autoconf.hash b/package/autoconf/autoconf.hash
index de0840dd84..f94b2d9de5 100644
--- a/package/autoconf/autoconf.hash
+++ b/package/autoconf/autoconf.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  f14c83cfebcc9427f2c3cea7258bd90df972d92eb26752da4ddad81c87a0faa4  autoconf-2.71.tar.xz
+sha256  ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a  autoconf-2.72.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYINGv3
 sha256  1f1cde9fb68b9b3cff18c420894bec5bd4defacd700b7d13df54a887301e5350  COPYING.EXCEPTION
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 15ce9d5927..48bfc80e7f 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_VERSION = 2.71
+AUTOCONF_VERSION = 2.72
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.xz
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
