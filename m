Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D215BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 05:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6651C400F1;
	Tue, 17 May 2022 05:47:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiArYtjcNyz2; Tue, 17 May 2022 05:47:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 693FC40364;
	Tue, 17 May 2022 05:47:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58F331BF33C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 05:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4764A4192C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 05:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMbiyHIsNF37 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 05:47:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F9E2416CD
 for <buildroot@buildroot.org>; Tue, 17 May 2022 05:47:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4BC1085EEE; Tue, 17 May 2022 05:36:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 07:47:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13bb9642ade57c3818c68ce6271cb2b1b53a69eb
X-Git-Newrev: 1386336fc82f841fc1b57b5448477d5b1b4302fd
X-Patchwork-Hint: ignore
Message-Id: <20220517053626.4BC1085EEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc, localedef}: bump to version
 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1386336fc82f841fc1b57b5448477d5b1b4302fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
Generating locale C.UTF-8
[error] LC_MONETARY: value for field `mon_decimal_point' must not be an empty string
[error] no output file produced because errors were issued

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index f28c15c2a3..e0bbf341eb 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  0ca43b2a6cd74609519554303a16e350abdac0e66943c5d98d91228233c826a0  glibc-2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586.tar.gz
+sha256  fc3c1d25640fd4cd09fbf7e17eafcc7943731e901cc0a3686503ae8adfb11d31  glibc-2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5772c3355b..f3a08fbf24 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
+GLIBC_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index fb5edde0c2..061b7c7fc2 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
+LOCALEDEF_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
