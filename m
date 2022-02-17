Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F26C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 13:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B705B6F6EA;
	Thu, 17 Feb 2022 13:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1GlQgIFmK5x; Thu, 17 Feb 2022 13:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EF4461B87;
	Thu, 17 Feb 2022 13:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA6B91BF3C6
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4E6E401B3
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhfFgCdz1NNU for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 13:49:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDB3A4017B
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:49:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6B4A983776; Thu, 17 Feb 2022 13:41:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 14:48:06 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 245a2838267334e2d6e2d62a749f6b386f82a1ba
X-Git-Newrev: 5b46038f99d4a8d0492c2b25b72ed15e0e24c206
X-Patchwork-Hint: ignore
Message-Id: <20220217134157.6B4A983776@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/cgilua: add
 CGILUA_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b46038f99d4a8d0492c2b25b72ed15e0e24c206
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:keplerproject:cgilua is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akeplerproject%3Acgilua

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 755116460b8de88cb833ab4bf37649a7fb26728d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cgilua/cgilua.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cgilua/cgilua.mk b/package/cgilua/cgilua.mk
index cd78841fdb..5994dfc838 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -7,5 +7,6 @@
 CGILUA_VERSION = 5.2.1-1
 CGILUA_LICENSE = MIT
 CGILUA_LICENSE_FILES = $(CGILUA_SUBDIR)/doc/us/license.html
+CGILUA_CPE_ID_VENDOR = keplerproject
 
 $(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
