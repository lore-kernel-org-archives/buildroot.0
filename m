Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC36C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 339D2405D6;
	Sat,  4 Dec 2021 21:41:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5MxDq8cE9jF; Sat,  4 Dec 2021 21:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 782C9410AB;
	Sat,  4 Dec 2021 21:41:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE3191BF95C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DEF860659
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCE514EuEDai for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:40:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F3A60622
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:40:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id CA61793543; Sat,  4 Dec 2021 21:35:55 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:39:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba9ca16b33e2e3a6893a95842711d34cfe47c52b
X-Git-Newrev: 764176324e4805d5e5b90e210199e216d65d82ef
X-Patchwork-Hint: ignore
Message-Id: <20211204213555.CA61793543@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unixodbc: add
 UNIXODBC_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=764176324e4805d5e5b90e210199e216d65d82ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:unixodbc:unixodbc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aunixodbc%3Aunixodbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/unixodbc/unixodbc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index cdc4e69a7e..b447cf5ff0 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -10,6 +10,7 @@ UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
 UNIXODBC_INSTALL_STAGING = YES
 UNIXODBC_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
+UNIXODBC_CPE_ID_VENDOR = unixodbc
 
 UNIXODBC_CONF_OPTS = --enable-drivers --enable-driver-conf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
