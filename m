Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79537C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 016EA409A3;
	Mon,  6 Nov 2023 21:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 016EA409A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5c7OoH-W_AVg; Mon,  6 Nov 2023 21:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AFEE40935;
	Mon,  6 Nov 2023 21:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AFEE40935
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6313C1BF3A4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 471CE414FA
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 471CE414FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7W4CwsROF1OP for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:00:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09E4340103
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09E4340103
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8EFD869AA; Mon,  6 Nov 2023 21:00:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:45:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49db37ae5aa5dff53aeea74803970d758a8a0daa
X-Git-Newrev: 798d917b8e91f65ae84172673bc304aea3895ee2
X-Patchwork-Hint: ignore
Message-Id: <20231106210009.E8EFD869AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/microchip-hss-payload-generator:
 bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=798d917b8e91f65ae84172673bc304aea3895ee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump package version to latest release.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../microchip-hss-payload-generator.hash                                | 2 +-
 .../microchip-hss-payload-generator/microchip-hss-payload-generator.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
index 69e05e18af..b9015fc961 100644
--- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f6f69412caf886e88abbf26de0dee1db790c790b89571f2f0def1e2f3620f057  microchip-hss-payload-generator-2023.06.tar.gz
+sha256  447771d4219176acc69c6d945ff40a0f3d0c5cbe63619927bc61b9e52ab05136  microchip-hss-payload-generator-2023.09.tar.gz
 sha256  0b67b1d44bcad078580fc5d8e9580a48a9466b769db58aeb1631d4c5ef97e08a  tools/hss-payload-generator/LICENSE.md
diff --git a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
index 63ae22ed60..4c3ca93dfe 100644
--- a/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
+++ b/package/microchip-hss-payload-generator/microchip-hss-payload-generator.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.06
+HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION = 2023.09
 HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_SITE = $(call github,polarfire-soc,hart-software-services,v$(HOST_MICROCHIP_HSS_PAYLOAD_GENERATOR_VERSION))
 # Some parts of the repository are under different licenses, but we
 # are only building/installing the code in
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
