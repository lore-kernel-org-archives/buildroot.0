Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C19C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42C1E84038;
	Sat,  6 Jan 2024 09:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42C1E84038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EX4t3gOH-tWC; Sat,  6 Jan 2024 09:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F27D83F7A;
	Sat,  6 Jan 2024 09:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F27D83F7A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 175281BF360
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2059142175
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2059142175
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfM2Mt_xpyrs for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 486994217C
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 486994217C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37D4D84688; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 10:52:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36743d61756ec4c8bdf1963a8cfea01724ba78ef
X-Git-Newrev: cb7c72530f776ab3571d614df4460e02bed0ac97
X-Patchwork-Hint: ignore
Message-Id: <20240106095524.37D4D84688@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tcping: bump to version 2.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb7c72530f776ab3571d614df4460e02bed0ac97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/mkirchner/tcping/releases/tag/2.1.0
https://github.com/mkirchner/tcping/releases/tag/2.0.0

https://github.com/mkirchner/tcping/compare/1.3.6...2.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tcping/tcping.hash | 2 +-
 package/tcping/tcping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcping/tcping.hash b/package/tcping/tcping.hash
index c97c0fa2a4..f706599c2d 100644
--- a/package/tcping/tcping.hash
+++ b/package/tcping/tcping.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a731f0e48ff931d7b2a0e896e4db40867043740fe901dd225780f2164fdbdcf3  tcping-1.3.6.tar.gz
+sha256  b8aa427420fe00173b5a2c0013d78e52b010350f5438bf5903c1942cba7c39c9  tcping-2.1.0.tar.gz
 sha256  4a35620e27ddb8de27898e4206c8f93633d877c1e128e98e95a035f760d94428  LICENSE
diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
index 5eaf702ef0..9a068f5668 100644
--- a/package/tcping/tcping.mk
+++ b/package/tcping/tcping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPING_VERSION = 1.3.6
+TCPING_VERSION = 2.1.0
 TCPING_SITE = $(call github,mkirchner,tcping,$(TCPING_VERSION))
 TCPING_LICENSE = MIT
 TCPING_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
