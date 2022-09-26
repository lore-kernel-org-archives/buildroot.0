Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2951C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5936A40BF1;
	Mon, 26 Sep 2022 12:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5936A40BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78narNWkDama; Mon, 26 Sep 2022 12:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1BD8740BEA;
	Mon, 26 Sep 2022 12:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BD8740BEA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 549351BF3B0
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DF9540BF1
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DF9540BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ae6ozkIc_OlS for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:05:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89DB640BEA
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89DB640BEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 797208634F; Mon, 26 Sep 2022 12:05:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 14:04:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e213543fd0dc94205c9b25a08df42eb02128dc99
X-Git-Newrev: 01c2a049b10b2e56b61f5a40814bfe0256fe20eb
X-Patchwork-Hint: ignore
Message-Id: <20220926120542.797208634F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-visualisation-waveform: bump
 version to 19.0.3-Matrix
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

commit: https://git.buildroot.net/buildroot/commit/?id=01c2a049b10b2e56b61f5a40814bfe0256fe20eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash | 2 +-
 package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index efd8eddc66..3265477050 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a6180038f43d9344678952d29b6479e24194e6038518f9064e80781bf303ae70  kodi-visualisation-waveform-19.0.2-Matrix.tar.gz
+sha256  a89b7d82afaa3bb279ecf32a2c04e6c7653f536b0df6fee2b7389c15340a01c7  kodi-visualisation-waveform-19.0.3-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 71acd733a0..9d75f79a87 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 19.0.2-Matrix
+KODI_VISUALISATION_WAVEFORM_VERSION = 19.0.3-Matrix
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
