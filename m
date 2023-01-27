Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DC4C64EC4
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D85D96FAF8;
	Tue, 21 Feb 2023 01:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D85D96FAF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUTPVUm35X_A; Tue, 21 Feb 2023 01:14:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D4C56FAE8;
	Tue, 21 Feb 2023 01:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D4C56FAE8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9AFE1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F03696FBCC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F03696FBCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_O2T5ZEWgde for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D17066FB8C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D17066FB8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2D5A828C8; Mon, 20 Feb 2023 20:52:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 13:37:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11d7fb7013d0fbdb959897e00acc5955427a31de
X-Git-Newrev: ccd391bfd94fdcaed77a2fe31c577e428cefc0ee
X-Patchwork-Hint: ignore
Message-Id: <20230220205240.C2D5A828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openlayers: bump to
 version 7.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ccd391bfd94fdcaed77a2fe31c577e428cefc0ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 1b3f3cce51..7e33716f78 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  37a0e5fde4df3db6e6c11ed0ceb8e20608121afe5f8f7f91cf03990e89a919ca  v7.1.0-package.zip
+sha256  31b848cc55967c7de63fece8cd1699fc51152421d04653b859103c7391ad5bbe  v7.2.2-package.zip
 sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 7396e38fb9..852f5f1dcf 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 7.1.0
+OPENLAYERS_VERSION = 7.2.2
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
