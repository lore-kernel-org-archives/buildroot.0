Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F3EC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 091D14F23D;
	Tue, 21 Feb 2023 00:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 091D14F23D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrE3HLcyZ9Zq; Tue, 21 Feb 2023 00:44:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAF1A498C4;
	Tue, 21 Feb 2023 00:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAF1A498C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D647E1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B37E6FB73
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B37E6FB73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YpJnBFxLVqdq for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFE8A6FB6E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFE8A6FB6E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B0CC8648F; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 21:58:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c541df41806f0940128ab333d693fb7766e98da7
X-Git-Newrev: 52afc0b3b504c9616b3875dcdf67ab7be41455f5
X-Patchwork-Hint: ignore
Message-Id: <20230220205232.9B0CC8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lpeg: add missing
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

commit: https://git.buildroot.net/buildroot/commit/?id=52afc0b3b504c9616b3875dcdf67ab7be41455f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The lpeg.html file declares the licensing terms at its bottom, so it
should work as a license file.

Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
[yann.morin.1998@free.fr: use LPEG_SUBDIR]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
