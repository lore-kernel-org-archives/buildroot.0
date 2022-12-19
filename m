Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25BAC4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 09:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35E134012E;
	Mon, 19 Dec 2022 09:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35E134012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ubxvlBUEqW31; Mon, 19 Dec 2022 09:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A9CA40227;
	Mon, 19 Dec 2022 09:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A9CA40227
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB291BF31B
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 09:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5518D81280
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 09:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5518D81280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kw3aXoC_JcJ9 for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 09:00:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8117F8128C
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 09:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8117F8128C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7014C8699F; Mon, 19 Dec 2022 09:00:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 10:00:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 163f933692f616c1b73d060aa03bd8323956692f
X-Git-Newrev: d4386b912db9f9f9a3cf5cbc9165e1609a55309f
X-Patchwork-Hint: ignore
Message-Id: <20221219090054.7014C8699F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpfr: bump to version 4.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4386b912db9f9f9a3cf5cbc9165e1609a55309f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.mpfr.org/mpfr-4.1.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpfr/mpfr.hash | 2 +-
 package/mpfr/mpfr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index 35056f626a..4b0d14c9c2 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f  mpfr-4.1.0.tar.xz
+sha256  ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d  mpfr-4.1.1.tar.xz
 
 # Hash for license file
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index cd558dae0e..8d12c7502b 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 4.1.0
+MPFR_VERSION = 4.1.1
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
