Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE2BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 22:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54BB60F09;
	Sun, 12 Dec 2021 22:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5FiRr8IjFRSW; Sun, 12 Dec 2021 22:26:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DA1260EE4;
	Sun, 12 Dec 2021 22:26:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF8D1BF337
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD50C402B5
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 22:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69j7Ht0k4XbT for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 756C4402B8
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 22:23:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CC0A4836B8; Sun, 12 Dec 2021 22:18:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 23:21:04 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 87d7818be9e2eed9720281659d3abd6b106915c8
X-Git-Newrev: 2733e755099d6c1c2b430e5ecaa32aa711ceb69c
X-Patchwork-Hint: ignore
Message-Id: <20211212221808.CC0A4836B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libgee: add
 LIBGEE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=2733e755099d6c1c2b430e5ecaa32aa711ceb69c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:gnome:libgee is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Alibgee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d2089a4aadc7f1bc689ac452f52209205c71a5d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgee/libgee.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 1dc8cb569d..bd6ca4bde5 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -12,6 +12,7 @@ LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
 LIBGEE_INSTALL_STAGING = YES
 LIBGEE_LICENSE = LGPL-2.1+
 LIBGEE_LICENSE_FILES = COPYING
+LIBGEE_CPE_ID_VENDOR = gnome
 # We're patching gee/Makefile.am
 LIBGEE_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
