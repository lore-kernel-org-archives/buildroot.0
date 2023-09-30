Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77420E77360
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 08:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BE298133A;
	Sat, 30 Sep 2023 08:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BE298133A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60PTGhD_o3Ti; Sat, 30 Sep 2023 08:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E17FF813C5;
	Sat, 30 Sep 2023 08:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E17FF813C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B2A61BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 105D342DFD
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 08:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 105D342DFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BoqwPbGKC_c8 for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 08:00:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D674141B4E
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 08:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D674141B4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDF2D83689; Sat, 30 Sep 2023 08:00:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 09:52:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8eea6a9eb03046b390e66a862dddac9577b01d4
X-Git-Newrev: 380cf4279df25be64003f5609dd2143c98c6e39c
X-Patchwork-Hint: ignore
Message-Id: <20230930080010.BDF2D83689@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pcsc-lite: bump to version 2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=380cf4279df25be64003f5609dd2143c98c6e39c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 4326822e41..e0face9ddb 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  cbcc3b34c61f53291cecc0d831423c94d437b188eb2b97b7febc08de1c914e8a  pcsc-lite-1.9.9.tar.bz2
+sha256  d6c3e2b64510e5ed6fcd3323febf2cc2a8e5fda5a6588c7671f2d77f9f189356  pcsc-lite-2.0.0.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 0b92380ccb..2b2114835e 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.9.9
+PCSC_LITE_VERSION = 2.0.0
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
