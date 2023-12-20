Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC2EC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 10:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5163A41E66;
	Wed, 20 Dec 2023 10:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5163A41E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RdeMaehRhu0; Wed, 20 Dec 2023 10:50:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C52E84203A;
	Wed, 20 Dec 2023 10:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C52E84203A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0388B1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0F2B82C21
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0F2B82C21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hU6ufG1pEijI for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CB5E81BB2
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 10:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CB5E81BB2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE9A187C2E; Wed, 20 Dec 2023 10:50:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 11:41:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96d0d677790e659b822761b50561b0316b4abf43
X-Git-Newrev: 8c4bb1abb9102140b6f4726915fa7555e21b96b4
X-Patchwork-Hint: ignore
Message-Id: <20231220105004.DE9A187C2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gawk: bump to version 5.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c4bb1abb9102140b6f4726915fa7555e21b96b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
https://git.savannah.gnu.org/cgit/gawk.git/tree/ChangeLog?h=gawk-5.3.0

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gawk/gawk.hash | 4 ++--
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 852a815d04..3ff0a90030 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.2.2.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.3.0.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  3c1fce1446b4cbee1cd273bd7ec64bc87d89f61537471cd3e05e33a965a250e9  gawk-5.2.2.tar.xz
+sha256  ca9c16d3d11d0ff8c69d79dc0b47267e1329a69b39b799895604ed447d3ca90b  gawk-5.3.0.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 62270cea9c..ff1b9920af 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.2.2
+GAWK_VERSION = 5.3.0
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
