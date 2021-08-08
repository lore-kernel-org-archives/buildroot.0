Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244ACC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:36:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C06B760EB7
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C06B760EB7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9165160727;
	Sun,  8 Aug 2021 19:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1u6qGV7UlLz; Sun,  8 Aug 2021 19:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E25666070C;
	Sun,  8 Aug 2021 19:36:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4661BF3C3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D005882CA3
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09WniRiU_W6b for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:34:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 795F782CDD
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:34:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 331B48D27B; Sun,  8 Aug 2021 19:33:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:16:43 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 0175b49f0c341ad1129aab658f3f7cd5338db738
X-Git-Newrev: 82c0a9a248b932a11e0863863c4129b2b11f0c5b
X-Patchwork-Hint: ignore
Message-Id: <20210808193342.331B48D27B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/ltp-testsuite:
 renumber patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=82c0a9a248b932a11e0863863c4129b2b11f0c5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit 84968aa4954b308ed67adde305e0fc5c801edc9e forgot to renumber
remaining patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a9d585a41701d5ef1df7955faf0ee057132769e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...bc.patch => 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
similarity index 100%
rename from package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
rename to package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
