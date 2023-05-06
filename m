Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D7EC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88EE261110;
	Sat,  6 May 2023 14:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88EE261110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pb9UiZhVRHJ; Sat,  6 May 2023 14:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA78610C9;
	Sat,  6 May 2023 14:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA78610C9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10C211BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D70B083F89
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70B083F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6vvBslnccRs for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:41:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D053B82321
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D053B82321
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C001485DB4; Sat,  6 May 2023 14:41:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 16:28:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b613beef33dac6a3118172fd4c23f32af54ee5ba
X-Git-Newrev: 7d8da5965b9b9474e4bdbe1d41204e3a88c48e18
X-Patchwork-Hint: ignore
Message-Id: <20230506144102.C001485DB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exiv2: bump version to 0.27.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d8da5965b9b9474e4bdbe1d41204e3a88c48e18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated the link to the sources on github, the previous link no longer
exists.

Release notes:
https://github.com/Exiv2/exiv2/releases/tag/v0.27.6

Signed-off-by: Nicolas Serafini <nicolas.serafini@ik.me>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/exiv2/exiv2.hash | 2 +-
 package/exiv2/exiv2.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index a405d2611b..c871277801 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  35a58618ab236a901ca4928b0ad8b31007ebdc0386d904409d825024e45ea6e2  exiv2-0.27.5-Source.tar.gz
+sha256  4c192483a1125dc59a3d70b30d30d32edace9e14adf52802d2f853abf72db8a6  exiv2-0.27.6-Source.tar.gz
 sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 2a91c71c8f..869f8e48dd 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.27.5
+EXIV2_VERSION = 0.27.6
 EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-Source.tar.gz
-EXIV2_SITE = https://exiv2.org/builds
+EXIV2_SITE = https://github.com/Exiv2/exiv2/releases/download/v$(EXIV2_VERSION)
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
 EXIV2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
