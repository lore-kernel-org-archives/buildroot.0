Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BD8ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4485A812A7;
	Sun, 30 Oct 2022 19:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4485A812A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id es54oIATbGHn; Sun, 30 Oct 2022 19:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69859812A3;
	Sun, 30 Oct 2022 19:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69859812A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B685E1BF2A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ED6B8128F
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ED6B8128F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VFPNOtdEOaKm for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:43:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D92CE81297
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D92CE81297
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4DA187605; Sun, 30 Oct 2022 19:43:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 20:40:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 28497102e1788df3628bd3324a3304a03c7942d0
X-Git-Newrev: 9597126a3d83ddf7871688ac4de5d2e065c508f0
X-Patchwork-Hint: ignore
Message-Id: <20221030194324.C4DA187605@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-plugins: bump version to
 1.2.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9597126a3d83ddf7871688ac4de5d2e065c508f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.7_v1.2.7.1#alsa-plugins

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/alsa-plugins/alsa-plugins.hash | 2 +-
 package/alsa-plugins/alsa-plugins.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-plugins/alsa-plugins.hash b/package/alsa-plugins/alsa-plugins.hash
index 2582a0d639..5d190e4d7b 100644
--- a/package/alsa-plugins/alsa-plugins.hash
+++ b/package/alsa-plugins/alsa-plugins.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  068818a4b55d8c029daa00015d853d45113f56b224b7c64e1e117988c825b2a0  alsa-plugins-1.2.6.tar.bz2
+sha256  8c337814954bb7c167456733a6046142a2931f12eccba3ec2a4ae618a3432511  alsa-plugins-1.2.7.1.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING.GPL
diff --git a/package/alsa-plugins/alsa-plugins.mk b/package/alsa-plugins/alsa-plugins.mk
index b8819151ef..5728ebfe37 100644
--- a/package/alsa-plugins/alsa-plugins.mk
+++ b/package/alsa-plugins/alsa-plugins.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_PLUGINS_VERSION = 1.2.6
+ALSA_PLUGINS_VERSION = 1.2.7.1
 ALSA_PLUGINS_SOURCE = alsa-plugins-$(ALSA_PLUGINS_VERSION).tar.bz2
 ALSA_PLUGINS_SITE = https://www.alsa-project.org/files/pub/plugins
 ALSA_PLUGINS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
