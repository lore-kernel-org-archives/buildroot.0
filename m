Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0BCC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:16:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B265661163
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B265661163
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C91E80C46;
	Tue, 26 Oct 2021 12:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dU5wELtjgTh; Tue, 26 Oct 2021 12:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED01280EE2;
	Tue, 26 Oct 2021 12:16:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA9D1BF9AA
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15D4B60632
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sOqWGD2wK3VL for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:15:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B04C600D1
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:15:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 289E188DA3; Tue, 26 Oct 2021 12:12:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 14:14:16 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c2cfab554010ade6ef033684ec518a5c0ab5a382
X-Git-Newrev: 67a9ec958a9a30fc248dd64f8198955b4221b1f8
X-Patchwork-Hint: ignore
Message-Id: <20211026121221.289E188DA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/freerdp: bump to
 version 2.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=67a9ec958a9a30fc248dd64f8198955b4221b1f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://github.com/FreeRDP/FreeRDP/blob/2.3.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 01e78811db25c34d506138994efd981e4ab60caf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 8217a2106c..ebb5798ace 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.2.0.tar.gz.sha256
-sha256  19b30759e324ce7a9767af880116a4c571761e9ad9c5d6c98c5b302ff8c24c6c  freerdp-2.2.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.3.1.tar.gz.sha256
+sha256  20071c691c1947ca256149e1d03edec1a5dfbf9960f0ef4e21ecab87433c2178  freerdp-2.3.1.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 16d58b5aa0..171c248bd2 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.2.0
+FREERDP_VERSION = 2.3.1
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
