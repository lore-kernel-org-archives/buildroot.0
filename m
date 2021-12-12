Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E4DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C3086070B;
	Sun, 12 Dec 2021 22:28:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7mU6SLU91nka; Sun, 12 Dec 2021 22:28:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCC8606F6;
	Sun, 12 Dec 2021 22:28:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27D751BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECA2D6071E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RbuYZiGegN9W for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 429DE6077D
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A74108374D; Sun, 12 Dec 2021 22:18:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:20:17 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 11e3477fe5bea84140787e860bea0a22bf1ad794
X-Git-Newrev: 1065ac009c2a749a6322f967c9b0d59b6758453a
X-Patchwork-Hint: ignore
Message-Id: <20211212221828.A74108374D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/speex: add
 SPEEX_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=1065ac009c2a749a6322f967c9b0d59b6758453a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

cpe:2.3:a:xiph:speex is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axiph%3Aspeex

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c84cd8b1d1fec2b56d44c747bddc70a240433694)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/speex/speex.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 522f8cc09c..674be78ff8 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -8,6 +8,7 @@ SPEEX_VERSION = 1.2.0
 SPEEX_SITE = https://downloads.xiph.org/releases/speex
 SPEEX_LICENSE = BSD-3-Clause
 SPEEX_LICENSE_FILES = COPYING
+SPEEX_CPE_ID_VENDOR = xiph
 SPEEX_INSTALL_STAGING = YES
 SPEEX_DEPENDENCIES = host-pkgconf libogg
 SPEEX_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
