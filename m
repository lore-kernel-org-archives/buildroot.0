Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA14C63797
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E0A81E91;
	Tue, 17 Jan 2023 09:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E0A81E91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpWqR8--7gkr; Tue, 17 Jan 2023 09:35:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D0D81A30;
	Tue, 17 Jan 2023 09:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0D0D81A30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8AC31BF95E
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFE3D812F5
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFE3D812F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1elpkajxibCt for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4483881301
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4483881301
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32FC987C1A; Tue, 17 Jan 2023 09:34:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 15:42:11 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 71bb1b27ea3bc53138a5fcf1ae08409759f1790f
X-Git-Newrev: 87d8b2e07bd9d675c22bac0e73fd1b97f1e757d7
X-Patchwork-Hint: ignore
Message-Id: <20230117093419.32FC987C1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lpeg: add missing
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

commit: https://git.buildroot.net/buildroot/commit/?id=87d8b2e07bd9d675c22bac0e73fd1b97f1e757d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
