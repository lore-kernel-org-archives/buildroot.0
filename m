Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A4EC433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 11:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B552B828F8;
	Sun,  2 Oct 2022 11:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B552B828F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REZMlXkacsfT; Sun,  2 Oct 2022 11:37:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E73828BA;
	Sun,  2 Oct 2022 11:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29E73828BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A4B4E1BF3FD
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 11:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8063060B44
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 11:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8063060B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eahTwdxUa3qf for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 11:37:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63FD860B3D
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 11:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63FD860B3D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B6648677D; Sun,  2 Oct 2022 11:37:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 2 Oct 2022 13:35:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d395f49acf5222558601eb6d8300248bf7931051
X-Git-Newrev: ebc9beaa6af0bc27da8b9def4da758ac1bfbbf70
X-Patchwork-Hint: ignore
Message-Id: <20221002113701.4B6648677D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/volk: license list is
 comma-separated
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebc9beaa6af0bc27da8b9def4da758ac1bfbbf70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/volk/volk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index 5e2e50ae73..af5bd4306b 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -9,7 +9,7 @@ VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
 VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
 # See https://github.com/gnuradio/volk/tree/v2.5.1#license for some
 # details on the licensing.
-VOLK_LICENSE = GPL-3.0+ LGPL-3.0+
+VOLK_LICENSE = GPL-3.0+, LGPL-3.0+
 VOLK_LICENSE_FILES = COPYING COPYING-LGPL
 
 VOLK_SUPPORTS_IN_SOURCE_BUILD = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
