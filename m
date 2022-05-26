Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A24CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C76304253F;
	Thu, 26 May 2022 08:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99fdYIpP01x4; Thu, 26 May 2022 08:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A068B424C6;
	Thu, 26 May 2022 08:47:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80E771BF9AD
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 518EB41187
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGVe2lS1jRAT for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:46:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 425F241182
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B1CFC86533; Thu, 26 May 2022 08:35:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 10:45:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3f31bc2b1cc0a4e064fb6acd876204efb7f9b4e0
X-Git-Newrev: b49f39e16c4a4e20910efca4ffdea95ccf82aba1
X-Patchwork-Hint: ignore
Message-Id: <20220526083517.B1CFC86533@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/zlog: add
 ZLOG_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=b49f39e16c4a4e20910efca4ffdea95ccf82aba1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

cpe:2.3:a:zlog_project:zlog is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azlog_project%3Azlog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 01427de27dbe4062ae1ee4d11114a2b6eda0c26f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlog/zlog.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index e2410d3665..c7b7035c1f 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -8,6 +8,7 @@ ZLOG_VERSION = 1.2.15
 ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
 ZLOG_LICENSE = LGPL-2.1
 ZLOG_LICENSE_FILES = COPYING
+ZLOG_CPE_ID_VENDOR = zlog_project
 ZLOG_INSTALL_STAGING = YES
 
 define ZLOG_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
