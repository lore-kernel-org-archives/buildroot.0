Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A42C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC60C60C21;
	Sun,  6 Feb 2022 10:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zVsjpxc8SBa; Sun,  6 Feb 2022 10:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D8D60BE4;
	Sun,  6 Feb 2022 10:41:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E754F1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAE0F60BE4
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IKxnQdmhRo7 for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:41:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1770460B6A
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:41:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DA8FA82BBB; Sun,  6 Feb 2022 10:34:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 11:40:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6647ee8ee6e35a17f9154ece4903b09fb5a3014c
X-Git-Newrev: 755116460b8de88cb833ab4bf37649a7fb26728d
X-Patchwork-Hint: ignore
Message-Id: <20220206103431.DA8FA82BBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cgilua: add CGILUA_CPE_ID_VENDOR
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=755116460b8de88cb833ab4bf37649a7fb26728d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:keplerproject:cgilua is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akeplerproject%3Acgilua

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
