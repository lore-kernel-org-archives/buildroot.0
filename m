Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B78FECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3C8A416B9;
	Sat, 17 Sep 2022 15:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3C8A416B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0qip0mo3vPvp; Sat, 17 Sep 2022 15:50:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2145B40919;
	Sat, 17 Sep 2022 15:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2145B40919
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFCA91BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC8376111E
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:50:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC8376111E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZgBAdTEIPse for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:50:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D439660AF8
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D439660AF8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BFA9B84565; Sat, 17 Sep 2022 15:50:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:50:05 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3af8d3d32456bb1621c45c7b1085fae3fde8dcf5
X-Git-Newrev: f2e412f1a85219582ba767590420cc7b15455274
X-Patchwork-Hint: ignore
Message-Id: <20220917155046.BFA9B84565@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/v4l2loopback: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=f2e412f1a85219582ba767590420cc7b15455274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cpe:2.3:o:v4l2loopback_project:v4l2loopback is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Ao%3Av4l2loopback_project%3Av4l2loopback

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1edb9d691dec2ad248ce62e30034fded52a77d64)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
