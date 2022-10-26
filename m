Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99494C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 19:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19C448129F;
	Wed, 26 Oct 2022 19:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19C448129F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KEhLlRG5TEl; Wed, 26 Oct 2022 19:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 465878128D;
	Wed, 26 Oct 2022 19:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 465878128D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 108BC1BF57C
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0CAA40547
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 19:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0CAA40547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWaE4wAXZJ9c for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 19:50:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2B9C40223
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 19:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2B9C40223
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF7DD87133; Wed, 26 Oct 2022 19:50:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 21:50:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26ec7c4d029d281fc4f0d61e18fc83b91142d9a1
X-Git-Newrev: 7630d0dde3b6284160bbe16474dad4fdc0b6a4fd
X-Patchwork-Hint: ignore
Message-Id: <20221026195017.CF7DD87133@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc, localedef}: bump to version
 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
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

commit: https://git.buildroot.net/buildroot/commit/?id=7630d0dde3b6284160bbe16474dad4fdc0b6a4fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index f5c0f1b175..16290461ac 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  596bee874d76bc6c5f62af142c9dd40bcb3625ea26975bbc52e552d40e864e54  glibc-2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3.tar.gz
+sha256  51b946f6c8dddd2b0c9902f7792ecf594497da6b0cc8fb9246fa30f108cbb422  glibc-2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 84122db91f..bb7c9e9a05 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
+GLIBC_VERSION = 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 987f7e8c65..05db7fa423 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.36-44-g2628500f5dff1dd99c49a09b418b3b1ea3a6b5d3
+LOCALEDEF_VERSION = 2.36-66-ga1dc0be03c9dd850b864bd7a9c03cf8e396eb7ca
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
