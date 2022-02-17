Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F422C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 13:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0585A41832;
	Thu, 17 Feb 2022 13:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbRJju9VM6QB; Thu, 17 Feb 2022 13:56:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B7F44182F;
	Thu, 17 Feb 2022 13:56:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A731B1BF3C6
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A45384182F
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYPJorNbV3yX for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 13:56:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07A754182E
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A5FBF8377B; Thu, 17 Feb 2022 13:48:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 14:48:00 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 1a9431d52d43461fb8b844fd2e7d426624cb85c8
X-Git-Newrev: f7d2453564c7aff2b9eefe91b7d188d888a8d03e
X-Patchwork-Hint: ignore
Message-Id: <20220217134828.A5FBF8377B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/cgilua: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7d2453564c7aff2b9eefe91b7d188d888a8d03e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
index 7471be3da0..8061eaf3a6 100644
--- a/package/cgilua/cgilua.mk
+++ b/package/cgilua/cgilua.mk
@@ -8,5 +8,6 @@ CGILUA_VERSION = 6.0.2-0
 CGILUA_SUBDIR = cgilua
 CGILUA_LICENSE = MIT
 CGILUA_LICENSE_FILES = $(CGILUA_SUBDIR)/doc/us/license.html
+CGILUA_CPE_ID_VENDOR = keplerproject
 
 $(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
