Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857F4C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC8440A02;
	Sat, 14 Jan 2023 20:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EC8440A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1qA_rZZtFYVa; Sat, 14 Jan 2023 20:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3667D409AD;
	Sat, 14 Jan 2023 20:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3667D409AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF3091BF228
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A85EB60ECD
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85EB60ECD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zDiwnRXiJBTe for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:59:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A59D60BD4
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A59D60BD4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAF9D87B53; Sat, 14 Jan 2023 20:59:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 21:58:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c541df41806f0940128ab333d693fb7766e98da7
X-Git-Newrev: 52afc0b3b504c9616b3875dcdf67ab7be41455f5
X-Patchwork-Hint: ignore
Message-Id: <20230114205912.EAF9D87B53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lpeg: add missing
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
