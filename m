Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE718C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B1C44242B;
	Sun, 12 Dec 2021 17:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IoC633t5yB3N; Sun, 12 Dec 2021 17:40:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0EC642400;
	Sun, 12 Dec 2021 17:40:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 16F5A1BF31D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC8FF40637
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjzHp60oSkeI for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62B8B40194
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 33F9983655; Sun, 12 Dec 2021 17:30:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:29:22 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 1de5bcd1c88acc4a5bd77a7bc9163114129048bf
X-Git-Newrev: 23e66a3ffc3a652e7d77d2c6bc3f3dbac9cf5389
X-Patchwork-Hint: ignore
Message-Id: <20211212173024.33F9983655@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libffi: add
 LIBFFI_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=23e66a3ffc3a652e7d77d2c6bc3f3dbac9cf5389
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

cpe:2.3:a:libffi_project:libffi is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibffi_project%3Alibffi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 72125334bae1c3a5b4d03d778ff90bc114cb92cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libffi/libffi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 85b4ab5b84..093256a629 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -9,6 +9,7 @@ LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
+LIBFFI_CPE_ID_VENDOR = libffi_project
 LIBFFI_INSTALL_STAGING = YES
 # We're patching Makefile.am
 LIBFFI_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
