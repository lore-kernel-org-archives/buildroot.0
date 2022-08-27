Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB443ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32CFA81A2B;
	Sat, 27 Aug 2022 07:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32CFA81A2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QpeFaQNI1rpv; Sat, 27 Aug 2022 07:59:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4170F81A12;
	Sat, 27 Aug 2022 07:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4170F81A12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 178C41BF267
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E258C81A6F
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E258C81A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iYwkMru9AlFO for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:59:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30744819F6
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30744819F6
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0848087D5C; Sat, 27 Aug 2022 07:44:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:58:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3ef301f0c2d339eade3188e2a80ff8841ea935f
X-Git-Newrev: 1edb9d691dec2ad248ce62e30034fded52a77d64
X-Patchwork-Hint: ignore
Message-Id: <20220827074409.0848087D5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/v4l2loopback: add
 V4L2LOOPBACK_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=1edb9d691dec2ad248ce62e30034fded52a77d64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:o:v4l2loopback_project:v4l2loopback is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Ao%3Av4l2loopback_project%3Av4l2loopback

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/v4l2loopback/v4l2loopback.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index d9f065a49d..6ee4b69ef9 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -8,6 +8,8 @@ V4L2LOOPBACK_VERSION = 0.12.5
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
+V4L2LOOPBACK_CPE_ID_VENDOR = v4l2loopback_project
+V4L2LOOPBACK_CPE_ID_PREFIX = cpe:2.3:o
 
 ifeq ($(BR2_PACKAGE_V4L2LOOPBACK_UTILS),y)
 define V4L2LOOPBACK_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
