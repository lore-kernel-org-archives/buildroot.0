Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B4CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A80F681450;
	Mon,  2 May 2022 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15LnY-v6xTBe; Mon,  2 May 2022 22:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C960881398;
	Mon,  2 May 2022 22:00:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 466011BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56FAE415DF
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sb5jKwvlcaGM for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE2AA414E5
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B45E084EC9; Mon,  2 May 2022 21:48:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:40:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a9cf5d308b948d0ffff6263a2c01119d273afd4
X-Git-Newrev: a6b71b47568cebe9b0a36380f4cbce509411017c
X-Patchwork-Hint: ignore
Message-Id: <20220502214850.B45E084EC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oniguruma: bump to version 6.9.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6b71b47568cebe9b0a36380f4cbce509411017c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/kkos/oniguruma/releases/tag/v6.9.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/oniguruma/oniguruma.hash | 4 ++--
 package/oniguruma/oniguruma.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/oniguruma/oniguruma.hash b/package/oniguruma/oniguruma.hash
index 3a6112e832..89befe7dbf 100644
--- a/package/oniguruma/oniguruma.hash
+++ b/package/oniguruma/oniguruma.hash
@@ -1,4 +1,4 @@
-# From https://github.com/kkos/oniguruma/releases/download/v6.9.7/onig-6.9.7.1.tar.gz.sha256
-sha256  6444204b9c34e6eb6c0b23021ce89a0370dad2b2f5c00cd44c342753e0b204d9  onig-6.9.7.1.tar.gz
+# From https://github.com/kkos/oniguruma/releases/download/v6.9.8/onig-6.9.8.tar.gz.sha256
+sha256  28cd62c1464623c7910565fb1ccaaa0104b2fe8b12bcd646e81f73b47535213e  onig-6.9.8.tar.gz
 # Hash for license file
 sha256  70ba5469ea0bab6e18a32d7009068f996503168d27be57747e08da34337ff26f  COPYING
diff --git a/package/oniguruma/oniguruma.mk b/package/oniguruma/oniguruma.mk
index 31c8d8e512..f5ac810c10 100644
--- a/package/oniguruma/oniguruma.mk
+++ b/package/oniguruma/oniguruma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ONIGURUMA_VERSION = 6.9.7.1
+ONIGURUMA_VERSION = 6.9.8
 ONIGURUMA_SITE = \
 	https://github.com/kkos/oniguruma/releases/download/v$(ONIGURUMA_VERSION)
 ONIGURUMA_SOURCE = onig-$(ONIGURUMA_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
