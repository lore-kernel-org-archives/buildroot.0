Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921D5FA3741
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 06:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CD2A40923;
	Thu, 27 Oct 2022 06:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD2A40923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_hCEzeoedKk; Thu, 27 Oct 2022 06:55:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AC0740920;
	Thu, 27 Oct 2022 06:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AC0740920
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5E81BF47E
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 369358135C
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 06:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 369358135C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlEDV8eBexNV for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 06:55:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82A7781358
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 06:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82A7781358
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F80187312; Thu, 27 Oct 2022 06:55:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Oct 2022 08:51:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 810c0eecf1fb81de43c67d602290e911d6a3a486
X-Git-Newrev: 777f8fbec575397e638d5775336cf645a7ad80cf
X-Patchwork-Hint: ignore
Message-Id: <20221027065529.6F80187312@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tealdeer: bump version to 1.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=777f8fbec575397e638d5775336cf645a7ad80cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tealdeer/tealdeer.hash | 2 +-
 package/tealdeer/tealdeer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tealdeer/tealdeer.hash b/package/tealdeer/tealdeer.hash
index 0e53174841..1d9eb7bf25 100644
--- a/package/tealdeer/tealdeer.hash
+++ b/package/tealdeer/tealdeer.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  42febf9ee84721b9230077d62e2fc51201fd59624d3c776ccc1a634788768a60  tealdeer-1.5.0.tar.gz
+sha256  90690d3a6e2f6c7444c281865bd5b0787e0afa599f06b52b4283bea4541e1e77  tealdeer-1.6.1.tar.gz
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT
diff --git a/package/tealdeer/tealdeer.mk b/package/tealdeer/tealdeer.mk
index c396225098..aabfe2983c 100644
--- a/package/tealdeer/tealdeer.mk
+++ b/package/tealdeer/tealdeer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TEALDEER_VERSION = 1.5.0
+TEALDEER_VERSION = 1.6.1
 TEALDEER_SITE = $(call github,dbrgn,tealdeer,v$(TEALDEER_VERSION))
 TEALDEER_LICENSE = Apache-2.0 or MIT
 TEALDEER_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
