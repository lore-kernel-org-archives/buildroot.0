Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25701C4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C435F4148A;
	Wed,  8 Nov 2023 13:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C435F4148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uXUsZFLTqln9; Wed,  8 Nov 2023 13:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0F8C4146F;
	Wed,  8 Nov 2023 13:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0F8C4146F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32B2C1BF3DE
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B485610B0
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B485610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rw0Kz7ScIidg for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 13:47:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 287ED61046
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 13:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 287ED61046
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D54886CF3; Wed,  8 Nov 2023 13:47:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Nov 2023 14:30:33 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: d41ff469b5a9bdf136ba72dc631ee7a4ffab0b9a
X-Git-Newrev: cb8fed92a8a17b9e4a7abe2d37b5d9e3f7288824
X-Patchwork-Hint: ignore
Message-Id: <20231108134734.0D54886CF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/opusfile: add
 OPUSFILE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb8fed92a8a17b9e4a7abe2d37b5d9e3f7288824
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

cpe:2.3:a:xiph:opusfile is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/BB1B035B-FCF0-4854-AB18-0FD1181B0CC3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 522f25ed42006c5d7e68ef4431fab538ac0ddc17)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opusfile/opusfile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 63553a81e7..efd38c542c 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -9,6 +9,7 @@ OPUSFILE_SITE = https://downloads.xiph.org/releases/opus
 OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
 OPUSFILE_LICENSE = BSD-3-Clause
 OPUSFILE_LICENSE_FILES = COPYING
+OPUSFILE_CPE_ID_VENDOR = xiph
 OPUSFILE_INSTALL_STAGING = YES
 
 # 0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
