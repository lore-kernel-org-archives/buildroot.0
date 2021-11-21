Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60167C433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1A6D403A7;
	Sun, 21 Nov 2021 20:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c78H144GWth6; Sun, 21 Nov 2021 20:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0331A401B9;
	Sun, 21 Nov 2021 20:37:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD801BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77DC74045F
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQtQPvYE-xy9 for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:37:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D86124045D
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:37:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BB89D8DC36; Sun, 21 Nov 2021 20:32:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:37:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df729d9c250845dd23235ae3014a0bf2791b4bb6
X-Git-Newrev: eaaa756bbe0cfaf572ff74372f418e0a8fe47912
X-Patchwork-Hint: ignore
Message-Id: <20211121203250.BB89D8DC36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qdecoder: set license to
 BSD-2-Clause
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

commit: https://git.buildroot.net/buildroot/commit/?id=eaaa756bbe0cfaf572ff74372f418e0a8fe47912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set license to BSD-2-Clause instead of BSD-2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
