Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8635C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D3A881E66;
	Sat, 14 Jan 2023 20:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D3A881E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YftD8varFdpe; Sat, 14 Jan 2023 20:03:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8988881DE2;
	Sat, 14 Jan 2023 20:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8988881DE2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA4F1BF3D8
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC66981E3C
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC66981E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJBuIATWaD51 for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:03:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2045981DE2
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2045981DE2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EB1D87B20; Sat, 14 Jan 2023 20:03:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 21:02:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9259635564f799ff4b0e63b1baff62505571938
X-Git-Newrev: 113e3a8fed6c89e947bea2f44672c47338d08c96
X-Patchwork-Hint: ignore
Message-Id: <20230114200308.0EB1D87B20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetconf2: bump version 2.2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=113e3a8fed6c89e947bea2f44672c47338d08c96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysrepo/sysrepo.hash | 2 +-
 package/sysrepo/sysrepo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index 1db33df626..a90d8259bf 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  357a50851e4cc052b484b924ed0a5808c29159a7c9d48d9b1b8c42784c4b6917  sysrepo-2.1.64.tar.gz
+sha256  1bc866f13e41ba5e7e4acd52b5c3d42b1a2a1e032775e0a9b094f3265844cd25  sysrepo-2.2.12.tar.gz
 sha256  88f1b7e5c64d2c113e07105aa9c0fb80639b40287565be1c2afd0949df83d826  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 0ed27e3cfb..9da8c22ca2 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 2.1.64
+SYSREPO_VERSION = 2.2.12
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
