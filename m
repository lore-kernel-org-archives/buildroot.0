Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F09C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D46060F1D;
	Wed,  8 Dec 2021 08:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esHH5sYXoPKp; Wed,  8 Dec 2021 08:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD87860F19;
	Wed,  8 Dec 2021 08:41:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8EB11BF365
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E44A560F1D
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5PaTb6oMdnkV for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D67660F04
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:39:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1F93381839; Wed,  8 Dec 2021 08:34:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Dec 2021 09:35:00 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5ee093db3035716b98233f70c4ec27b4426809ce
X-Git-Newrev: d78f9d568cff8f026459bb50233c115f1b90a02a
X-Patchwork-Hint: ignore
Message-Id: <20211208083455.1F93381839@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/qdecoder: set
 license to BSD-2-Clause
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

commit: https://git.buildroot.net/buildroot/commit/?id=d78f9d568cff8f026459bb50233c115f1b90a02a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Set license to BSD-2-Clause instead of BSD-2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit eaaa756bbe0cfaf572ff74372f418e0a8fe47912)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qdecoder/qdecoder.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index 12784fc451..8cb5d3bc97 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -6,7 +6,7 @@
 
 QDECODER_VERSION = 12.0.8
 QDECODER_SITE = $(call github,wolkykim,qdecoder,v$(QDECODER_VERSION))
-QDECODER_LICENSE = BSD-2
+QDECODER_LICENSE = BSD-2-Clause
 QDECODER_LICENSE_FILES = COPYING
 QDECODER_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
