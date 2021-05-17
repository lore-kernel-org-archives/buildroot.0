Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F672C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:19:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A1C60F0F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15A1C60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0935605C8;
	Tue,  3 Aug 2021 21:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6sMRmQiV3BPE; Tue,  3 Aug 2021 21:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FD6C60868;
	Tue,  3 Aug 2021 21:19:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 211CD1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3676E40387
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLYGBrwcNd81 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D5EA4035F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E81BB8B43E; Tue,  3 Aug 2021 21:09:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 17 May 2021 21:18:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e87d5f643bee82a1907fef0316a1775059858dcf
X-Git-Newrev: dfb045af5b4fc4c55a5674945b90d670c5fee68c
X-Patchwork-Hint: ignore
Message-Id: <20210803210939.E81BB8B43E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d-headers: remove
 spurious empty line
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=dfb045af5b4fc4c55a5674945b90d670c5fee68c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Detected by check-package

Fixes: 7fa481437e71484aa7064398e69aa63cdabb86b2

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d-headers/mesa3d-headers.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index d86ad929f8..de245a4625 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -21,7 +21,6 @@ MESA3D_HEADERS_LICENSE_FILES = docs/license.rst
 MESA3D_HEADERS_CPE_ID_VENDOR = mesa3d
 MESA3D_HEADERS_CPE_ID_PRODUCT = mesa
 
-
 # Only installs header files
 MESA3D_HEADERS_INSTALL_STAGING = YES
 MESA3D_HEADERS_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
