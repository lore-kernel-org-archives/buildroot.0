Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AC7C4167B
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 17:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2A9F41BA2;
	Fri,  9 Dec 2022 17:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2A9F41BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KyArRMiE6dxY; Fri,  9 Dec 2022 17:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F1EE41B90;
	Fri,  9 Dec 2022 17:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F1EE41B90
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 694871BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA8E44102F
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA8E44102F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8AC8Ox265lU for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 17:01:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 365FC4103A
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 365FC4103A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3476885E9E; Fri,  9 Dec 2022 17:01:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:36:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b1ff446fb74b910ff9005b8725e962a626ef11a
X-Git-Newrev: d77345d05169d2fe8df1afc3714c2b373e273ef9
X-Patchwork-Hint: ignore
Message-Id: <20221209170105.3476885E9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xorgproto: bump version to
 2022.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d77345d05169d2fe8df1afc3714c2b373e273ef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2022-August/003197.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xorgproto/xorgproto.hash | 6 +++---
 package/x11r7/xorgproto/xorgproto.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index bd9cae2510..cc52013e11 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003160.html
-sha256  1d2dcc66963f234d2c1e1f8d98a0d3e8725149cdac0a263df4097593c48bc2a6  xorgproto-2022.1.tar.bz2
-sha512  add275a9c0d005053f31fdca6da009142792a3c7e2cd4b56da93eed3a397adf52d91c441ff6455959b87559f402eb9f46fdd8932e951c7d2d96623975391202a  xorgproto-2022.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-August/003197.html
+sha256  5d13dbf2be08f95323985de53352c4f352713860457b95ccaf894a647ac06b9e  xorgproto-2022.2.tar.xz
+sha512  8e6108110600d076a94cc6d0e465b2e9adfbbe8d7e6b75fae9c5262d99dc6074ab1ed561a74d6d451f00f5b7af9f507a6317be9c0770efeed9e60b64beb7a1c9  xorgproto-2022.2.tar.xz
 
 # Locally computed
 sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 89cc248386..c707bdafc0 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2022.1
-XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.bz2
+XORGPROTO_VERSION = 2022.2
+XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.xz
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
 XORGPROTO_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
