Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA16C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 19:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69BAF404EF;
	Thu, 12 May 2022 19:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqAVNVUw6E9b; Thu, 12 May 2022 19:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE8FF404D0;
	Thu, 12 May 2022 19:56:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F04AF1BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 054FE40399
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 19:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q8Lif40P8OgC for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DE88403AE
 for <buildroot@buildroot.org>; Thu, 12 May 2022 19:51:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 60D5285C6F; Thu, 12 May 2022 19:41:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 21:50:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 720c3b3cac5f2c44afdc8c07ba4b4c131b1d9a85
X-Git-Newrev: 7b6865ab4d33f87da27c2d20669165b19434ba55
X-Patchwork-Hint: ignore
Message-Id: <20220512194101.60D5285C6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xorgproto: bump version to
 2022.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b6865ab4d33f87da27c2d20669165b19434ba55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2022-April/003160.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xorgproto/xorgproto.hash | 6 +++---
 package/x11r7/xorgproto/xorgproto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index 802217ce77..bd9cae2510 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-September/date.html
-sha256  aa2f663b8dbd632960b24f7477aa07d901210057f6ab1a1db5158732569ca015  xorgproto-2021.5.tar.bz2
-sha512  0f5c4ee4fd56cd46f4d5850bcf3e04c92d2e98de54d0113987cb49fc83cf1f4d0e50e976333179c72fe2178cfa15ec6c1bfc4e76fc3bc2a4be80616ce079da87  xorgproto-2021.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-April/003160.html
+sha256  1d2dcc66963f234d2c1e1f8d98a0d3e8725149cdac0a263df4097593c48bc2a6  xorgproto-2022.1.tar.bz2
+sha512  add275a9c0d005053f31fdca6da009142792a3c7e2cd4b56da93eed3a397adf52d91c441ff6455959b87559f402eb9f46fdd8932e951c7d2d96623975391202a  xorgproto-2022.1.tar.bz2
 
 # Locally computed
 sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 1d5cd4caa8..89cc248386 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2021.5
+XORGPROTO_VERSION = 2022.1
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.bz2
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
