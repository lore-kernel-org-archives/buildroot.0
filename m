Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7103CC43334
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 06:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B63D82849;
	Sat, 25 Jun 2022 06:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B63D82849
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JL7Z5MPk5TxR; Sat, 25 Jun 2022 06:48:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 333ED82779;
	Sat, 25 Jun 2022 06:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 333ED82779
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31CE51BF962
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84CED42641
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 06:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84CED42641
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHs5Pzp63Fl5 for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F6AF4263A
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 06:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F6AF4263A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 508D287556; Sat, 25 Jun 2022 06:34:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 08:43:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48d8b00a3c032d7bb1237c65bce1da97ccbc49d5
X-Git-Newrev: e51d503bcd9fabba539f3adb7df4000248b10400
X-Patchwork-Hint: ignore
Message-Id: <20220625063418.508D287556@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flatcc: bump to version 0.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e51d503bcd9fabba539f3adb7df4000248b10400
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/dvidelabs/flatcc/releases/tag/v0.6.1
https://github.com/dvidelabs/flatcc/blob/v0.6.1/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flatcc/flatcc.hash | 4 ++--
 package/flatcc/flatcc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flatcc/flatcc.hash b/package/flatcc/flatcc.hash
index 11d9d9803a..4c6b2fc8db 100644
--- a/package/flatcc/flatcc.hash
+++ b/package/flatcc/flatcc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	a92da3566d11e19bb807a83554b1a2c644a5bd91c9d9b088514456bb56e1c666  flatcc-0.6.0.tar.gz
-sha256	c8f0d9c1f92c658d87ebd854ee7447a3d3912d2c3a5c78c117787be5d5da8af3  LICENSE
+sha256  2533c2f1061498499f15acc7e0937dcf35bc68e685d237325124ae0d6c600c2b  flatcc-0.6.1.tar.gz
+sha256  c8f0d9c1f92c658d87ebd854ee7447a3d3912d2c3a5c78c117787be5d5da8af3  LICENSE
diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
index fcace691c0..06be1a1338 100644
--- a/package/flatcc/flatcc.mk
+++ b/package/flatcc/flatcc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLATCC_VERSION = 0.6.0
+FLATCC_VERSION = 0.6.1
 FLATCC_SITE = $(call github,dvidelabs,flatcc,v$(FLATCC_VERSION))
 FLATCC_LICENSE = Apache-2.0
 FLATCC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
