Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E1EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:10:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3345B60F70
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3345B60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AEF6606FA;
	Sun, 14 Nov 2021 14:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OV6GXVAmCEne; Sun, 14 Nov 2021 14:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C11606F7;
	Sun, 14 Nov 2021 14:10:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E01191BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8E8A4022B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lzH7csmm_YPk for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:09:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1900400DA
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:09:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 72CF38D1DB; Sun, 14 Nov 2021 14:05:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:08:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9ec3b986e66ba481de4ca3abb4d83470e8861264
X-Git-Newrev: c2c15af2b840c41d7bee34c1f244551eefce6ba5
X-Patchwork-Hint: ignore
Message-Id: <20211114140518.72CF38D1DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/socat: bump to version
 1.7.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2c15af2b840c41d7bee34c1f244551eefce6ba5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bug fixes release.

Update README hash for version update.

Update comment; we do not patch configure.in.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/socat/socat.hash | 6 +++---
 package/socat/socat.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 5a4c520455..0d9d0ba76c 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  36cad050ecf4981ab044c3fbd75c643f  socat-1.7.4.1.tar.bz2
+md5  003686f80d820072649660b85f80c58f  socat-1.7.4.2.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  3faca25614e89123dff5045680549ecef519d02e331aaf3c4f5a8f6837c675e9  socat-1.7.4.1.tar.bz2
+sha256  6690a9f9990457b505097a272bbf2cbf4cc35576176f76646e3524b0e91c1763  socat-1.7.4.2.tar.bz2
 # Locally calculated
-sha256  b1ebebbce145027f4268211f36d121b083aeeabdc1736eb144b8afd8e86ce8da  README
+sha256  062e425b43da6b3df6d8657639b5e2c781781572b5d8867444fd6d2487ac7644  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 61c9852565..cf2a31b096 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.7.4.1
+SOCAT_VERSION = 1.7.4.2
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
@@ -24,7 +24,7 @@ SOCAT_CONF_ENV += \
 endif
 
 # We need to run autoconf to regenerate the configure script, since we patch
-# configure.in and Makefile.in. However, the package only uses autoconf and not
+# Makefile.in. However, the package only uses autoconf and not
 # automake, so we can't use the normal autoreconf logic.
 
 SOCAT_DEPENDENCIES = host-autoconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
