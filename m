Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DC8C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 10:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 720F1818A1;
	Sun,  7 May 2023 10:39:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 720F1818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0bGI3SUA1fX5; Sun,  7 May 2023 10:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B540821D0;
	Sun,  7 May 2023 10:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B540821D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1000B1BF307
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9829082077
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 10:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9829082077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UaiA__9orSSU for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 10:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE6FB820F1
 for <buildroot@buildroot.org>; Sun,  7 May 2023 10:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE6FB820F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA41785EE1; Sun,  7 May 2023 10:37:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 12:29:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06c7be82c061d883d50c9f025ee55e2bf1ec7949
X-Git-Newrev: 7f3762ae15793c3a123453434fa8299436db818a
X-Patchwork-Hint: ignore
Message-Id: <20230507103723.AA41785EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-*: mass version bump to
 Nexus
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f3762ae15793c3a123453434fa8299436db818a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash                          | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk                            | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash                          | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                            | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash                      | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                        | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash                            | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk                              | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash                      | 2 +-
 package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk                        | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.hash                                  | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk                                    | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash                    | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk                      | 2 +-
 .../kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash    | 2 +-
 package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk  | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash                            | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk                              | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash                          | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                            | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash                                | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                                  | 2 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.hash                          | 2 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk                            | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash                                | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                                  | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash                          | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk                            | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash                          | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk                            | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash                                | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                                  | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash                        | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                          | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                            | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                              | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash                              | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk                                | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                                  | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                                    | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash                            | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk                              | 2 +-
 42 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index 33de7d6ca0..e2f73c70c4 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  027e49b56c03d182fbf69ce71a84270dddb06e537814cd9ea209d4baca8d16fe  kodi-pvr-argustv-19.2.1-Matrix.tar.gz
+sha256  c4b18a0abf4ba0a797509d79c4291c4e69589a6482c6ec85f5d9bdae63ea3f35  kodi-pvr-argustv-20.5.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 90d0a53002..fac90dfeb6 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 19.2.1-Matrix
+KODI_PVR_ARGUSTV_VERSION = 20.5.0-Nexus
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index de429ebf15..9d914fdbf2 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  77f425d3521332e06ff758cfd1c63eb26f73990391ddb04f0ea6f9f3f0d114cf  kodi-pvr-dvblink-19.0.1-Matrix.tar.gz
+sha256  71a9fa64bdf7d784afc28f8b686fcdc00d9fea536c2aad1464e76e3b7648ed41  kodi-pvr-dvblink-20.3.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index e58711cb11..8c0b178f75 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBLINK_VERSION = 19.0.1-Matrix
+KODI_PVR_DVBLINK_VERSION = 20.3.0-Nexus
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index e3ff5bd1c1..516366d7b2 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5ccb4fa952c8909169dddd0a4c8f393ef8c1e8d35b9df0332f66a5f6442d6e85  kodi-pvr-dvbviewer-19.1.0-Matrix.tar.gz
+sha256  dc79db0486c7ef75b4b23c4dfe94115cb12e1903c3700ef4eef04fc517fcd039  kodi-pvr-dvbviewer-20.4.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index e4b00c06b5..914de3c72d 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBVIEWER_VERSION = 19.1.0-Matrix
+KODI_PVR_DVBVIEWER_VERSION = 20.4.0-Nexus
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index ce6fb8f385..7a4d5d3364 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5853a69455847da87ed0aebad4121f47c7a1aeb80cda6dbe20f069d33a02720b  kodi-pvr-filmon-19.0.1-Matrix.tar.gz
+sha256  dfd2a7b64d2b647ba3f7bfba05676a593c3284e2298becfed68b82e441a69b33  kodi-pvr-filmon-20.3.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index c5705670f8..50dad3c47f 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 19.0.1-Matrix
+KODI_PVR_FILMON_VERSION = 20.3.0-Nexus
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index f177eabd53..3bcfa23593 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cfd2695f38b0c0e3c7e7490e17476c2b82e2bbf18f0993d8041c7f15f6640cdd  kodi-pvr-hdhomerun-19.1.0-Matrix.tar.gz
+sha256  3872265e00fc748ba327aaa91beece747936f55d16356051cdd04b0b70a353c0  kodi-pvr-hdhomerun-20.4.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index a4a448c51e..cc6e097efa 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HDHOMERUN_VERSION = 19.1.0-Matrix
+KODI_PVR_HDHOMERUN_VERSION = 20.4.0-Nexus
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 40cd8fd62f..7b55eb88fd 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  990e5fd0757d48b86675aa124b77629e7fb2de6b27dcfd6f6ccc7ce181d04aeb  kodi-pvr-hts-19.0.6-Matrix.tar.gz
+sha256  e77bd87f1f4d1abc06e32d0347a0bb635bc129bec43a07864cb8a9e6b0e4d374  kodi-pvr-hts-20.6.2-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index caa90b7af6..d32ce87388 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 19.0.6-Matrix
+KODI_PVR_HTS_VERSION = 20.6.2-Nexus
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index de71703c53..6be0623a5a 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  421a883054dd31ad512866236c364e5a564d7db9fa595dadc3e37b9169b7fe79  kodi-pvr-iptvsimple-19.3.0-Matrix.tar.gz
+sha256  91ed962a4f77a2aa5df820ce57cf744c2a8ea02a356dafc2da270cf813c2d669  kodi-pvr-iptvsimple-20.10.1-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index e5976a7d3a..1182ea517a 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 19.3.0-Matrix
+KODI_PVR_IPTVSIMPLE_VERSION = 20.10.1-Nexus
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 9f4bd97366..37489de7dc 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3e0ba7a111ee0f93b64d0a0cb640569b13e429b1c47c88ac737389083054d732  kodi-pvr-mediaportal-tvserver-19.0.2-Matrix.tar.gz
+sha256  a61efdadb56c65e081f8b2e99f2d5b32b3c932ca1954243548710be57c8b70b8  kodi-pvr-mediaportal-tvserver-20.3.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index 1db0dca618..dfc7c2873b 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 19.0.2-Matrix
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 20.3.0-Nexus
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 81270ca7d2..d0d6331364 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  27c2546bf512f87f230e8312abeccd61d6bbb52ec1fbd7751f19d8df3c3afd4e  kodi-pvr-mythtv-19.0.11-Matrix.tar.gz
+sha256  b1ad428bec882d3e852240cbef2378803635b530545a08421ff3baf0611a29e7  kodi-pvr-mythtv-20.3.2-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 8475249e51..f67457480c 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 19.0.11-Matrix
+KODI_PVR_MYTHTV_VERSION = 20.3.2-Nexus
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 17d9817053..b89320d9c0 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  45ad0def6bbdb50fc42dc0b8a997e0db758fda42421fa7eb7643466ea512134f  kodi-pvr-nextpvr-19.0.6-Matrix.tar.gz
+sha256  bad9e7dd4f67348015f8fc477e0c4c8447e00dbd38b9f6548d1ce04f0845b1fd  kodi-pvr-nextpvr-20.4.1-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 6b3590a6d6..7b11407954 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 19.0.6-Matrix
+KODI_PVR_NEXTPVR_VERSION = 20.4.1-Nexus
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index ec78e7c84a..bb7f4218cf 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5a6d31d1a74d8c053919f1c3c73eb9ada1e799d99f61dca171c3d8f0afa0a03  kodi-pvr-njoy-19.0.1-Matrix.tar.gz
+sha256  0e8dc8ddce7830878c816da0836bdf5558c0dd388c48019012735a518eeefb04  kodi-pvr-njoy-20.3.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index 4808974c31..d0cfc006d7 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NJOY_VERSION = 19.0.1-Matrix
+KODI_PVR_NJOY_VERSION = 20.3.0-Nexus
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.hash b/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
index 1dc9636e63..2342f0c836 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b95a4f1d7381ebee1c9be9fca582bb0b70144271a47223ba06fc046ea595aaa  kodi-pvr-octonet-19.0.0-Matrix.tar.gz
+sha256  cc83ada3b3d1dbf3d42fa41f2b221c640cdc9fd505a1c76e7b479f99fe1ec8c5  kodi-pvr-octonet-20.3.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
index e2699bc44d..84950d2514 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_OCTONET_VERSION = 19.0.0-Matrix
+KODI_PVR_OCTONET_VERSION = 20.3.0-Nexus
 KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
 KODI_PVR_OCTONET_LICENSE = GPL-2.0+
 KODI_PVR_OCTONET_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 04919af7d2..d0c340fe78 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cd267a5b9e98b3b1b1c00feac16e2a07962641cbe53ff4c05ccb72acd925e3f8  kodi-pvr-pctv-19.0.1-Matrix.tar.gz
+sha256  c99d3ef085c4900e0c03e5e37047dc136efced78ed245d07bc286468a31e8a65  kodi-pvr-pctv-20.4.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 6f8dca4b23..4ae7bd0bc6 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = 19.0.1-Matrix
+KODI_PVR_PCTV_VERSION = 20.4.0-Nexus
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 4673bbbf88..36a9dd4187 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  79e753d7329a4e61e56618c0e821cdd5dccb81c3659838a9de2df407a5bd7c10  kodi-pvr-plutotv-19.0.3-Matrix.tar.gz
+sha256  d38a6bf4debc442849d01faedadcccb1b07debe850cd3c9a5789508233d22256  kodi-pvr-plutotv-20.3.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index a9ac03a007..b05c452854 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 19.0.3-Matrix
+KODI_PVR_PLUTOTV_VERSION = 20.3.0-Nexus
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index 167905f637..ed8668b2c9 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  191b2bd2dcbe15de29c1b867c127668784991e43817b00947cf955e569cf148e  kodi-pvr-stalker-19.0.4-Matrix.tar.gz
+sha256  8fdd4ab4cf28d7255550b4c351a397b7ce8eb1aa1f12e93bce7d61a951fbd6f3  kodi-pvr-stalker-20.3.1-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index f306c3a51b..763f7054ad 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = 19.0.4-Matrix
+KODI_PVR_STALKER_VERSION = 20.3.1-Nexus
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index ce3397fad5..1aff2dd985 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a87926702c51e52043e595ceae530a9101761cc15e8e3cadec85ac8cc9ba8f2b  kodi-pvr-vbox-19.0.0-Matrix.tar.gz
+sha256  04c50eba71426f062339491e7567545ec8c910b17c7055b28285eab14f26ca6f  kodi-pvr-vbox-20.4.2-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index fd83ffef37..60a8a819b0 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VBOX_VERSION = 19.0.0-Matrix
+KODI_PVR_VBOX_VERSION = 20.4.2-Nexus
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index 3e17fd553d..64ecb17b14 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  521add432b7fe38b6019f99547a440b1a2927d10f1420d518235c1c6d2e95b6b  kodi-pvr-vdr-vnsi-19.0.5-Matrix.tar.gz
+sha256  f26e2a9f1e9d83c5b44a8875b1f9cd37a0dbe59faf08002f083a4db95c9f84e0  kodi-pvr-vdr-vnsi-20.4.1-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index ebb5f117b8..02a2e2e456 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VDR_VNSI_VERSION = 19.0.5-Matrix
+KODI_PVR_VDR_VNSI_VERSION = 20.4.1-Nexus
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index b2a4031bd3..7f051071f1 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cd5658c5e40d42bc02e5c99b47c28cb24bdda4b6dd49029131ff147405d4c8a8  kodi-pvr-vuplus-19.0.1-Matrix.tar.gz
+sha256  467363d7015d426f05fac3f514222d7ec03aa4b61a0935fd7f00e95e9c443514  kodi-pvr-vuplus-20.5.1-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 81159e05f3..80b57f2510 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 19.0.1-Matrix
+KODI_PVR_VUPLUS_VERSION = 20.5.1-Nexus
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index b80ca10ae5..cdcaeeff9d 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  67ae49e516dfe4328587ea36439b3f48b099d1784dd57acebe1e49e137d75b56  kodi-pvr-waipu-19.3.1-Matrix.tar.gz
+sha256  5dfe9f891edefd5334c7a45593651634b43e1fdbea5a1b396131a45f5928f4aa  kodi-pvr-waipu-20.8.1-Nexus.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index b20f1c6414..41f9e82814 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 19.3.1-Matrix
+KODI_PVR_WAIPU_VERSION = 20.8.1-Nexus
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index 4a04c07ac8..232750db33 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d5addd39f64f97beb6e14090561583de47f0acdc70bedb39b3037613430cc71a  kodi-pvr-wmc-19.0.2-Matrix.tar.gz
+sha256  f045d871789ef3d36e1a7c7361ea35be4e14a395e75446519e937be70d2433b4  kodi-pvr-wmc-20.3.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 3bf21b3440..fd96731764 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = 19.0.2-Matrix
+KODI_PVR_WMC_VERSION = 20.3.0-Nexus
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index c1d3b476b9..1af86d4de0 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ac09db721e51b47f1ca7f4c2201833dbcd69040fd19b09c194fa7491ff4dad41  kodi-pvr-zattoo-19.7.16-Matrix.tar.gz
+sha256  c75ba4710d7e85cf516005ee3eca6d677e2fc018abaf490c881bc6552eb32929  kodi-pvr-zattoo-20.3.7-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 49b33916ee..fa5e116fa0 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 19.7.16-Matrix
+KODI_PVR_ZATTOO_VERSION = 20.3.7-Nexus
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
