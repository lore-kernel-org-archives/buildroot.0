Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E50C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A3C60E7E;
	Sun, 12 Dec 2021 14:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id myOBkiVMSpqF; Sun, 12 Dec 2021 14:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 314D761CE4;
	Sun, 12 Dec 2021 14:55:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2B01BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 312D24014E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1tiKpfpLSuw for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39C5140610
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:53:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 482D683465; Sun, 12 Dec 2021 14:48:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:48:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 474f35eb544b6ffe64fb5f2c1e086fcd2f1a431b
X-Git-Newrev: 7b0e3da8a47ecfb455c7f4cfd4a98626a061349c
X-Patchwork-Hint: ignore
Message-Id: <20211212144823.482D683465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups-pk-helper: add
 CUPS_PK_HELPER_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b0e3da8a47ecfb455c7f4cfd4a98626a061349c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:cups-pk-helper_project:cups-pk-helper is a valid CPE
identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acups-pk-helper_project%3Acups-pk-helper

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cups-pk-helper/cups-pk-helper.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cups-pk-helper/cups-pk-helper.mk b/package/cups-pk-helper/cups-pk-helper.mk
index c90b94da14..c688743160 100644
--- a/package/cups-pk-helper/cups-pk-helper.mk
+++ b/package/cups-pk-helper/cups-pk-helper.mk
@@ -9,6 +9,7 @@ CUPS_PK_HELPER_SITE = https://www.freedesktop.org/software/cups-pk-helper/releas
 CUPS_PK_HELPER_SOURCE = cups-pk-helper-$(CUPS_PK_HELPER_VERSION).tar.xz
 CUPS_PK_HELPER_LICENSE = GPL-2.0+
 CUPS_PK_HELPER_LICENSE_FILES = COPYING
+CUPS_PK_HELPER_CPE_ID_VENDOR = cups-pk-helper_project
 CUPS_PK_HELPER_DEPENDENCIES = cups libglib2 polkit
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
