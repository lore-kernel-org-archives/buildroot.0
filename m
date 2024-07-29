Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A304C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 20:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0832581210;
	Mon, 29 Jul 2024 20:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5Q0eLpJiTmB; Mon, 29 Jul 2024 20:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1E381119
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D1E381119;
	Mon, 29 Jul 2024 20:52:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 336561BF427
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 210B4403BE
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZByopPlO8lF for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 20:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A22B40242
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A22B40242
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 20:52:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 925BB83573; Mon, 29 Jul 2024 20:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 22:46:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ce97fd550d64189a74e813772f05cac82541e6b
X-Git-Newrev: 52e537c6a5dc6a046e5272e7ba7738c6e8f3865d
X-Patchwork-Hint: ignore
Message-Id: <20240729205248.925BB83573@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/microchip-hss-payload-generator:
 bump to version 2024.06
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

commit: https://git.buildroot.net/buildroot/commit/?id=52e537c6a5dc6a046e5272e7ba7738c6e8f3865d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump this package to latest available version v2024.06.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../microchip-hss-payload-generator.hash                                | 2 +-
 .../microchip-hss-payload-generator/microchip-hss-payload-generator.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
index b9015fc961..006e3f4a7c 100644
--- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  447771d4219176acc69c6d945ff40a0f3d0c5cbe63619927bc61b9e52ab05136  microchip-hss-payload-generator-2023.09.tar.gz
+sha256  667138e1b2376dcad8fb43b925bc9f24ba1ab59049550e276821c3b2f07ec6e6  microchip-hss-payload-generator-2024.06.tar.gz
 sha256  0b67b1d44bcad078580fc5d8e9580a48a9466b769db58aeb1631d4c5ef97e08a  tools/hss-payload-generator/LICENSE.md
diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
index 4c3ca93dfe..af1faa8aec 100644
--- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.09
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2024.06
 HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
 # Some parts of the repository are under different licenses, but we
 # are only building/installing the code in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
