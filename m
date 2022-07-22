Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887BEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 07:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A62141B73;
	Fri, 22 Jul 2022 07:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A62141B73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oBW8TuTsV-Nx; Fri, 22 Jul 2022 07:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11A7941BD1;
	Fri, 22 Jul 2022 07:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11A7941BD1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE1D41BF36D
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8193760E96
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 07:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8193760E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CyPbpfCgX3wR for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 07:09:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C36346066D
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 07:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C36346066D
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B8CB783E37; Fri, 22 Jul 2022 06:55:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 09:06:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 68de34c986546c54c30e1c8d8c62a8c8448b7e2f
X-Git-Newrev: 1f1b283c69cf6aa1b5cbac28a1f7349566b1921e
X-Patchwork-Hint: ignore
Message-Id: <20220722065547.B8CB783E37@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/darkhttpd: add
 DARKHTTPD_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f1b283c69cf6aa1b5cbac28a1f7349566b1921e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cpe:2.3:a:darkhttpd_project:darkhttpd is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adarkhttpd_project%3Adarkhttpd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b27b4adaa435fa559e2353db4150c2eea630f602)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/darkhttpd/darkhttpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/darkhttpd/darkhttpd.mk b/package/darkhttpd/darkhttpd.mk
index 56e5a6ecd6..bc68d43ef9 100644
--- a/package/darkhttpd/darkhttpd.mk
+++ b/package/darkhttpd/darkhttpd.mk
@@ -8,6 +8,7 @@ DARKHTTPD_VERSION = 1.13
 DARKHTTPD_SITE = $(call github,emikulic,darkhttpd,v$(DARKHTTPD_VERSION))
 DARKHTTPD_LICENSE = MIT
 DARKHTTPD_LICENSE_FILES = darkhttpd.c
+DARKHTTPD_CPE_ID_VENDOR = darkhttpd_project
 
 define DARKHTTPD_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
