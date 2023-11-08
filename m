Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121CBC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 12:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF88E418BE;
	Wed,  8 Nov 2023 12:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF88E418BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5Nd0ciUQrO4; Wed,  8 Nov 2023 12:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E79734187D;
	Wed,  8 Nov 2023 12:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E79734187D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE2261BF4E4
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 12:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A842A41805
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 12:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A842A41805
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMOPp-n-kHwW for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 12:28:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA82D417FC
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 12:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA82D417FC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3BD986CB7; Wed,  8 Nov 2023 12:28:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 13:21:32 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: e91d46937f9c9a056a782c1c7bf4bffc3cfaf7dd
X-Git-Newrev: 9dbb7a112c0d2e307fe0417a8bbd29a619520c92
X-Patchwork-Hint: ignore
Message-Id: <20231108122825.B3BD986CB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libupnp: bump to
 version 1.14.18
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

commit: https://git.buildroot.net/buildroot/commit/?id=9dbb7a112c0d2e307fe0417a8bbd29a619520c92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

https://github.com/pupnp/pupnp/blob/release-1.14.18/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bca9f4c98b28b06f74414d7a6475f4545f2daaee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index fcb231cff6..6fd4678c0d 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  025d7aee1ac5ca8f0bd99cb58b83fcfca0efab0c5c9c1d48f72667fe40788a4e  libupnp-1.14.13.tar.bz2
+sha256  16a7cee93ce2868ae63ab1a8164dc7de43577c59983b9f61293a310d6888dceb  libupnp-1.14.18.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 8c6ae005a0..f8551a2a0d 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.13
+LIBUPNP_VERSION = 1.14.18
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
 	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
