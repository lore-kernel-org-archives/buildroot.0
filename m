Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11ACC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 08:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B274E84C31;
	Wed,  8 Dec 2021 08:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9p0FKinJ-r1a; Wed,  8 Dec 2021 08:40:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2560284C23;
	Wed,  8 Dec 2021 08:40:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B261E1BF9C2
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1983403E8
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 08:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kazEg1LYLiFZ for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 08:39:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2D7E403DA
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 08:39:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8073C81839; Wed,  8 Dec 2021 08:34:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Dec 2021 09:34:55 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: c235cc50074ea939b5190f5a9709624864375b3b
X-Git-Newrev: f8cb6e6bfede811fafccf74e6967b1d55130bbf3
X-Patchwork-Hint: ignore
Message-Id: <20211208083448.8073C81839@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/qdecoder: set
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8cb6e6bfede811fafccf74e6967b1d55130bbf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

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
