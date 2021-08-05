Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A784C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:21:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2358860D07
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2358860D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C0840478;
	Thu,  5 Aug 2021 19:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgUA4XbxuRy7; Thu,  5 Aug 2021 19:21:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45B0440578;
	Thu,  5 Aug 2021 19:21:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E11471C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D50AA60A46
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZFodp-hrF-p for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:21:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CC49606E3
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:21:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E630581446; Thu,  5 Aug 2021 19:21:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:07:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96865f02d4d770da40d33ebc6421e15721bf3f94
X-Git-Newrev: 1d64fe9d58e5d34795afc15d84b961c93ed8f3c1
X-Patchwork-Hint: ignore
Message-Id: <20210805192129.E630581446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: renumber second patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d64fe9d58e5d34795afc15d84b961c93ed8f3c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix mistake in second patch number added by commit
d7d23710facd789c8986de055e30792af2591f2c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...002-Bug-703366-Fix-double-free-of-object-during-linearization.patch} | 0
 package/mupdf/mupdf.mk                                                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch b/package/mupdf/0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
similarity index 100%
rename from package/mupdf/0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
rename to package/mupdf/0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 294cd8a61b..d3d9d3b101 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -22,7 +22,7 @@ MUPDF_DEPENDENCIES = \
 	xlib_libX11 \
 	zlib
 
-# 0001-Bug-703366-Fix-double-free-of-object-during-linearization.patch
+# 0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
 MUPDF_IGNORE_CVES += CVE-2021-3407
 
 # The pkg-config name for gumbo-parser is `gumbo`.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
