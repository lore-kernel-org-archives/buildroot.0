Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC12C63797
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3531E81424;
	Tue, 17 Jan 2023 09:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3531E81424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DO5v1d5Ge3H7; Tue, 17 Jan 2023 09:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FDC58138F;
	Tue, 17 Jan 2023 09:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FDC58138F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D92E1BF95F
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDA6D813BE
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDA6D813BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hpC_46z0EpYM for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 152778138B
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 152778138B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03E8087C3D; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 15:44:32 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 8fb5d033329f51e8a07ff252a25daa7239d80c6a
X-Git-Newrev: b1eb1e7d92b57637df04e5ecc233175abd40d17e
X-Patchwork-Hint: ignore
Message-Id: <20230117094050.03E8087C3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/lpeg: add missing
 LPEG_LICENSE_FILES
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1eb1e7d92b57637df04e5ecc233175abd40d17e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

The lpeg.html file declares the licensing terms at its bottom, so it
should work as a license file.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
[yann.morin.1998@free.fr: use LPEG_SUBDIR]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 52afc0b3b504c9616b3875dcdf67ab7be41455f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lpeg/lpeg.hash | 2 ++
 package/lpeg/lpeg.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/lpeg/lpeg.hash b/package/lpeg/lpeg.hash
index 1ccaf242c4..cb995bde2c 100644
--- a/package/lpeg/lpeg.hash
+++ b/package/lpeg/lpeg.hash
@@ -1,2 +1,4 @@
 # computed by luarocks/buildroot
 sha256  e0d0d687897f06588558168eeb1902ac41a11edd1b58f1aa61b99d0ea0abbfbc  lpeg-1.0.2-1.src.rock
+# computed locally
+sha256  2b80a8cce793e008ba433e5e0184f20aca4a67ec741439fafd86a874a6a91c49  lpeg-1.0.2/lpeg.html
diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
index cdb2e81a5f..7326e59e01 100644
--- a/package/lpeg/lpeg.mk
+++ b/package/lpeg/lpeg.mk
@@ -6,5 +6,6 @@
 
 LPEG_VERSION = 1.0.2-1
 LPEG_LICENSE = MIT
+LPEG_LICENSE_FILES = $(LPEG_SUBDIR)/lpeg.html
 
 $(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
