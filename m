Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13118C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B33FB43290;
	Wed,  1 Nov 2023 21:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B33FB43290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j77E3rfUZwwE; Wed,  1 Nov 2023 21:45:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDEB2432A0;
	Wed,  1 Nov 2023 21:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDEB2432A0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3392F1BF97F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CA9A84D90
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CA9A84D90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRxprKB63tmb for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:44:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63E4484D86
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63E4484D86
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 511DF864C0; Wed,  1 Nov 2023 21:44:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 22:40:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bca9f4c98b28b06f74414d7a6475f4545f2daaee
X-Git-Newrev: 810a7bba04fde47c20ce26bbe7a4189bcf2d1135
X-Patchwork-Hint: ignore
Message-Id: <20231101214427.511DF864C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oniguruma: bump to version 6.9.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=810a7bba04fde47c20ce26bbe7a4189bcf2d1135
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/kkos/oniguruma/releases/tag/v6.9.9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/oniguruma/oniguruma.hash | 4 ++--
 package/oniguruma/oniguruma.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index 89befe7dbf..ac1d375b7a 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,4 +1,4 @@
-# From https://github.com/kkos/oniguruma/releases/download/v6.9.8/onig-6.9.8.tar.gz.sha256
-sha256  28cd62c1464623c7910565fb1ccaaa0104b2fe8b12bcd646e81f73b47535213e  onig-6.9.8.tar.gz
+# From https://github.com/kkos/oniguruma/releases/download/v6.9.9/onig-6.9.9.tar.gz.sha256
+sha256  60162bd3b9fc6f4886d4c7a07925ffd374167732f55dce8c491bfd9cd818a6cf  onig-6.9.9.tar.gz
 # Hash for license file
 sha256  70ba5469ea0bab6e18a32d7009068f996503168d27be57747e08da34337ff26f  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index e81190c0c6..1e8a119cf1 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.8
+ONIGURUMA_VERSION = 6.9.9
 ONIGURUMA_SITE = \
 	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
