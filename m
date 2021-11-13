Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BCCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:39:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D79461154
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D79461154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BE9860637;
	Sat, 13 Nov 2021 14:39:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzQ_CjuLdyCo; Sat, 13 Nov 2021 14:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F8C1605D0;
	Sat, 13 Nov 2021 14:39:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B3411BF23C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B29140413
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbXFg4KLlsWU for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:38:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC6A140157
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:38:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9A77E8C9EC; Sat, 13 Nov 2021 14:34:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 15:30:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4c44bf34ad706e36c779085ba35211bda7288240
X-Git-Newrev: 98e37c8c46e3c53d7d394dd1cc74a90e63fbacca
X-Patchwork-Hint: ignore
Message-Id: <20211113143454.9A77E8C9EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xorgproto: bump
 version to 2021.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=98e37c8c46e3c53d7d394dd1cc74a90e63fbacca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg-announce/2021-September/003108.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xorgproto/xorgproto.hash | 6 +++---
 package/x11r7/xorgproto/xorgproto.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xorgproto/xorgproto.hash b/package/x11r7/xorgproto/xorgproto.hash
index a88c129dd0..802217ce77 100644
--- a/package/x11r7/xorgproto/xorgproto.hash
+++ b/package/x11r7/xorgproto/xorgproto.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-April/003085.html
-sha256  0f5157030162844b398e7ce69b8bb967c2edb8064b0a9c9bb5517eb621459fbf  xorgproto-2021.4.tar.bz2
-sha512  0d905e5f135daf7005e23371cbdc41a62d99567e0a20784e71ead0092ffd1e7582733819f7198add1d97edcc9aa80012ae01d2be8367280d69b41d0c25349367  xorgproto-2021.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-September/date.html
+sha256  aa2f663b8dbd632960b24f7477aa07d901210057f6ab1a1db5158732569ca015  xorgproto-2021.5.tar.bz2
+sha512  0f5c4ee4fd56cd46f4d5850bcf3e04c92d2e98de54d0113987cb49fc83cf1f4d0e50e976333179c72fe2178cfa15ec6c1bfc4e76fc3bc2a4be80616ce079da87  xorgproto-2021.5.tar.bz2
 
 # Locally computed
 sha256  aacd931f191b610902aee1e526090c2858aabc07969441fa2537ffd3e7049555  COPYING-applewmproto
diff --git a/package/x11r7/xorgproto/xorgproto.mk b/package/x11r7/xorgproto/xorgproto.mk
index 59f0640241..1d5cd4caa8 100644
--- a/package/x11r7/xorgproto/xorgproto.mk
+++ b/package/x11r7/xorgproto/xorgproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORGPROTO_VERSION = 2021.4
+XORGPROTO_VERSION = 2021.5
 XORGPROTO_SOURCE = xorgproto-$(XORGPROTO_VERSION).tar.bz2
 XORGPROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XORGPROTO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
