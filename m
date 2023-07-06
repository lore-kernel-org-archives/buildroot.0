Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C57EB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 08:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1E5A40261;
	Thu,  6 Jul 2023 08:57:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1E5A40261
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OjnWgx5aaYJL; Thu,  6 Jul 2023 08:57:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975594179F;
	Thu,  6 Jul 2023 08:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 975594179F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEE4C1BF97D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5C8860B99
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:56:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5C8860B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pL1LlS5LlSZ5 for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 08:56:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE75C60AAA
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 08:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE75C60AAA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEBD7867CD; Thu,  6 Jul 2023 08:56:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 10:42:07 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: e2c274ef77926ef187cb37dea0b6810e82158600
X-Git-Newrev: 1eee210297d113043c321674cc3869ccf92f9f57
X-Patchwork-Hint: ignore
Message-Id: <20230706085635.BEBD7867CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/gnupg2: bump
 version to 2.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1eee210297d113043c321674cc3869ccf92f9f57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Added sha256 hash provided by upstream.

Release notes:
https://lists.gnupg.org/pipermail/gnupg-announce/2023q2/000479.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bfffbd7ed871332d2300684afd1c177e0209ca92)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 10 ++++------
 package/gnupg2/gnupg2.mk   |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index baee824104..aa71881f41 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,5 @@
-# From  https://lists.gnupg.org/pipermail/gnupg-announce/2023q2/000478.html
-sha1  d7d021101361a5e1166a6c0cc1731276e7134547  gnupg-2.4.1.tar.bz2
-# Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.1.tar.bz2.sig
-# using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  76b71e5aeb443bfd910ce9cbc8281b617c8341687afb67bae455877972b59de8  gnupg-2.4.1.tar.bz2
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  3efd495a94dc81fd0ea8788bef6c69d1f13cedd7  gnupg-2.4.2.tar.bz2
+sha256  97eb47df8ae5a3ff744f868005a090da5ab45cb48ee9836dbf5ee739a4e5cf49  gnupg-2.4.2.tar.bz2
+# Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index f7c7ae847c..760af3b05e 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.4.1
+GNUPG2_VERSION = 2.4.2
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
