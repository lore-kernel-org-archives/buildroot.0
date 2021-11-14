Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E4FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:29:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 988F1611CE
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 988F1611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E20A4022B;
	Sun, 14 Nov 2021 14:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TOc1sxQDASGc; Sun, 14 Nov 2021 14:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55240401FD;
	Sun, 14 Nov 2021 14:29:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 304C61BF20B
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16D3D606A8
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3BIqddNfR_we for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:29:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74192606B3
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:29:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0E1F88D26E; Sun, 14 Nov 2021 14:25:00 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:29:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5d6e55627453a80c887b26ade354a174b6b4fb04
X-Git-Newrev: fd680ed98d6b5dc21ba130efc2f3886d91170b9a
X-Patchwork-Hint: ignore
Message-Id: <20211114142500.0E1F88D26E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/luv: bump to version
 1.42.0-1
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
Content-Type: multipart/mixed; boundary="===============4857113705606165934=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4857113705606165934==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fd680ed98d6b5dc21ba130efc2f3886d91170b9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 6dfd8b9f19..2fb2b5c4fc 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b5228a9d0eaacd9f862b6270c732d5c90773a28ce53b6d9e32a14050e7947f36  luv-1.42.0-0.tar.gz
+sha256  4b6fbaa89d2420edf6070ad9e522993e132bd7eb2540ff754c2b9f1497744db2  luv-1.42.0-1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index fae94fa6b2..2dc9af3b7a 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.42.0-0
+LUV_VERSION = 1.42.0-1
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt

--===============4857113705606165934==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4857113705606165934==--
