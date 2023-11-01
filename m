Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCDBC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 22:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 470A0432A0;
	Wed,  1 Nov 2023 22:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 470A0432A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLxctxrvcLoo; Wed,  1 Nov 2023 22:01:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30926432AB;
	Wed,  1 Nov 2023 22:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30926432AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD75A1BF44A
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9553861002
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 22:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9553861002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VyMBbfgB_CLG for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 22:00:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C15860B7C
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 22:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C15860B7C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53E15864D1; Wed,  1 Nov 2023 22:00:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 22:55:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2476faa2adfea9d77cd872e30445cab365efafea
X-Git-Newrev: d952b970a1897b5e01d32127a426cd6864e7a409
X-Patchwork-Hint: ignore
Message-Id: <20231101220059.53E15864D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libspdm: bump version to 3.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d952b970a1897b5e01d32127a426cd6864e7a409
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libspdm/libspdm.hash | 2 +-
 package/libspdm/libspdm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 3280ebfb88..23faba1c4b 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  73e0d7df3c91beeb9f61a50eaa0a44c8e32b7a62ce32ed3cab1f0fab406ed5b8  libspdm-3.1.0.tar.gz
+sha256  84d4a755f57b17775c63b5c8be646d518ce34d5d1b85994b6150ebce9d31b183  libspdm-3.1.1.tar.gz
 sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index b216d98093..34dbb457c4 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.1.0
+LIBSPDM_VERSION = 3.1.1
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
