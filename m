Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9677CEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 19:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4505C60AF8;
	Sat,  1 Jul 2023 19:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4505C60AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYwmuNA_0WVw; Sat,  1 Jul 2023 19:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BD5C60AE2;
	Sat,  1 Jul 2023 19:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BD5C60AE2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31D881BF2BA
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1590160AE2
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 19:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1590160AE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aO5uX08BEnpR for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 19:55:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4694F60ABD
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 19:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4694F60ABD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D4D38625D; Sat,  1 Jul 2023 19:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 21:55:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e539853fc31a8228a2ad86eca243fd6b4ade0cff
X-Git-Newrev: 9f55efebdf53c14aa45f33c70fe60b1e0c52d43f
X-Patchwork-Hint: ignore
Message-Id: <20230701195542.2D4D38625D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: bump version to 3.91
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f55efebdf53c14aa45f33c70fe60b1e0c52d43f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 63a35285d7..5a4fde42b6 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_89_1_RTM/src/SHA256SUMS
-sha256  3adaedb9e70c3c5f40603bf60a01e336190a6dbe01929d395f16b01fe84a0156  nss-3.89.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_91_RTM/src/SHA256SUMS
+sha256  84bd46376df17118c55f6d73d30fd93a0af21296c66e7690471547e5898fc4b3  nss-3.91.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 1253cc5d41..23b17ab459 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.89.1
+LIBNSS_VERSION = 3.91
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
