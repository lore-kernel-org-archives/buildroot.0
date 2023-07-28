Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F73EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 110C8421F7;
	Fri, 28 Jul 2023 20:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 110C8421F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZZEHcJ4X29Y; Fri, 28 Jul 2023 20:29:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F03A9421F1;
	Fri, 28 Jul 2023 20:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F03A9421F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24DC21BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F269C84539
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F269C84539
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lwgf1YvOuayF for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:29:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3867D84537
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3867D84537
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26C3A839D4; Fri, 28 Jul 2023 20:29:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:27:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c4f02e76ea6df25456e4cccedd04d47c44add18
X-Git-Newrev: 45ede24a529ed6375d0af742f2e7422269cf36a0
X-Patchwork-Hint: ignore
Message-Id: <20230728202930.26C3A839D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8822cs: bump driver version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=45ede24a529ed6375d0af742f2e7422269cf36a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

 sparc http://autobuild.buildroot.net/results/1773c307641fc7a04f1095325c7bfd44d58d3180
 sparc64 http://autobuild.buildroot.net/results/5bcb9d334add7d80f23f0585e67010d27aa8ef1f

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8822cs/rtl8822cs.hash | 2 +-
 package/rtl8822cs/rtl8822cs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8822cs/rtl8822cs.hash b/package/rtl8822cs/rtl8822cs.hash
index c1ff470b27..aa3c86ce80 100644
--- a/package/rtl8822cs/rtl8822cs.hash
+++ b/package/rtl8822cs/rtl8822cs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8ac5bc4d3fcec98eb06276552ffab020dd799a58bce6629cf55127c2ee1a89e6  rtl8822cs-b51ab22fffdbe4a8cbb88fcc04b00aa2ca87d0f3.tar.gz
+sha256  666b5312c372664b115d29fc2b2974244b0512db27ffa1c810fae30d1c714063  rtl8822cs-758d861bfa4d18d39e4297c550fd684c9817eb0d.tar.gz
diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs.mk
index 8c6c34ccbc..2db769aa69 100644
--- a/package/rtl8822cs/rtl8822cs.mk
+++ b/package/rtl8822cs/rtl8822cs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8822CS_VERSION = b51ab22fffdbe4a8cbb88fcc04b00aa2ca87d0f3
+RTL8822CS_VERSION = 758d861bfa4d18d39e4297c550fd684c9817eb0d
 RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
 RTL8822CS_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
