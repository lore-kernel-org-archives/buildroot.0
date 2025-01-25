Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49C1C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C6A08576F;
	Fri, 28 Feb 2025 17:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oi0WTteV_Dtu; Fri, 28 Feb 2025 17:04:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D7EA8576D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D7EA8576D;
	Fri, 28 Feb 2025 17:04:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0416A1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8F3649CA1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWGIBA3YagI2 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E6841A5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33E6841A5A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DA5E867B4; Fri, 28 Feb 2025 16:30:18 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 25 Jan 2025 12:58:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aca1a6aab9574e5b0ee0529e2bb137ccd59d9bc2
X-Git-Newrev: 6facb3ae87ec54e6db82ef49d880a327105a2a6e
X-Patchwork-Hint: ignore
Message-Id: <20250228163018.2DA5E867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kodi-pvr-*: mass
 version bump
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=6facb3ae87ec54e6db82ef49d880a327105a2a6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Translations updates from Weblate

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash                          | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                            | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash                                | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                                  | 2 +-
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
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                                  | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                                    | 2 +-
 34 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index e18c4995a6..a778272054 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8a4b7029ef620043c44ee2e863a6240573c817fa5d3a4f8498ad6381688c1ad0  kodi-pvr-argustv-21.1.0-Omega.tar.gz
+sha256  8ec41a956a4348ded0ee650aaa20eb5ec746102b77da46515dcdfd5fa724c157  kodi-pvr-argustv-21.1.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index a785694b47..71830f4413 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 21.1.0-Omega
+KODI_PVR_ARGUSTV_VERSION = 21.1.1-Omega
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index 286a30abc3..8ff9d652a3 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a532955c0993f0d30ce85a04c80e62e80312089435b32f7dd28e1882b52dbf33  kodi-pvr-dvblink-21.1.2-Omega.tar.gz
+sha256  7c436b7a9a4e991f99c01e1fbe69761a1792e4aa703ec95e29ecdb9b7f251ae6  kodi-pvr-dvblink-21.1.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 652052152e..8f1b4c71b2 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBLINK_VERSION = 21.1.2-Omega
+KODI_PVR_DVBLINK_VERSION = 21.1.3-Omega
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 8aadcfdbb5..18107198f8 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bde3ff8e2416d6b47478702ec0731a3a31392422f4cd0ec41669bb797277c31a  kodi-pvr-dvbviewer-21.1.2-Omega.tar.gz
+sha256  9e567eb074b885621266d2eb1e67e79a19f47ef503aad110d9bf92ba2bd75084  kodi-pvr-dvbviewer-21.1.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index a68bc23c2e..ec3cae5303 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBVIEWER_VERSION = 21.1.2-Omega
+KODI_PVR_DVBVIEWER_VERSION = 21.1.3-Omega
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index 058788d1af..ed2de1e5e0 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  62e7426d654e33c95c2c9940fce48f9549f73eae510258448fd6ed606499eac6  kodi-pvr-filmon-21.0.2-Omega.tar.gz
+sha256  323702037d65d2820dbe7c589f395d1d1321a4fec61738745dd104ae569088df  kodi-pvr-filmon-21.0.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index db7ca75214..7cb602a658 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 21.0.2-Omega
+KODI_PVR_FILMON_VERSION = 21.0.3-Omega
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
index c1635b5582..40eda0e280 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c59d1ca40846b733175ba0f5360b86ea676a64d1a162bdc0faf8e16a8f2dea0  kodi-pvr-hdhomerun-21.0.1-Omega.tar.gz
+sha256  0030e1d8a82d6fd5906dab45e2f4817fcdf9abcc13b3ae2fe2031e557a8bee91  kodi-pvr-hdhomerun-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
index 5f69f606ef..190c5e3663 100644
--- a/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
+++ b/package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HDHOMERUN_VERSION = 21.0.1-Omega
+KODI_PVR_HDHOMERUN_VERSION = 21.0.2-Omega
 KODI_PVR_HDHOMERUN_SITE = $(call github,kodi-pvr,pvr.hdhomerun,$(KODI_PVR_HDHOMERUN_VERSION))
 KODI_PVR_HDHOMERUN_LICENSE = GPL-2.0+
 KODI_PVR_HDHOMERUN_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 15b790c80c..db2c69e67f 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c54c249a4c91091e47245b406210224aa4e3c5468497eb9cdeb09cd336cab4b2  kodi-pvr-hts-21.2.5-Omega.tar.gz
+sha256  c98e29433bf4a007662b20279748dccd95da7817ab73b7e78c0b45fbe31c22b1  kodi-pvr-hts-21.2.6-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 68c4d04bd0..0e34a4bb09 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 21.2.5-Omega
+KODI_PVR_HTS_VERSION = 21.2.6-Omega
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 60e1c4ece8..d46bbbb2b5 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  22a76504872b20703c5f77e5025dea4cecd777985c0584f2b6f5e0b64e268142  kodi-pvr-iptvsimple-21.10.0-Omega.tar.gz
+sha256  865f70cd4843dfc0b7d2765e507696f4affc57d4afd97ec4a9382fba3f798ff1  kodi-pvr-iptvsimple-21.10.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 7c63cf06ab..bfa9ef20a4 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 21.10.0-Omega
+KODI_PVR_IPTVSIMPLE_VERSION = 21.10.1-Omega
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 568ec564cd..6fb3ce9b0e 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8193889ef3033e2df471660bae77a02e7c12d519928eed19b19142c548070b1c  kodi-pvr-mediaportal-tvserver-21.0.4-Omega.tar.gz
+sha256  38727f8ea1ac350ced769b21919eb4b1409479f82ceeadf5140dbbdb7d5af415  kodi-pvr-mediaportal-tvserver-21.0.5-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index ec01821411..bdad9ec36a 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 21.0.4-Omega
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 21.0.5-Omega
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 976b774dd3..e01551fab6 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  72502b3a57cbc3cfbfef92104d97681d75cdfedb2a4173ac92a8e92fdc60d668  kodi-pvr-nextpvr-21.3.0-Omega.tar.gz
+sha256  6524671757b58d9eea3c9e7c56896cf7f0a0719236795a6cc3f59278e4d3d7c3  kodi-pvr-nextpvr-21.3.1-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 5d3c59dc13..f9e9d4b9cd 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 21.3.0-Omega
+KODI_PVR_NEXTPVR_VERSION = 21.3.1-Omega
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index c99e92bb9d..b5933657c4 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e9768f87857374476766ba8d791793b4e8d1e9d3239149b2142a7b5b3f24b439  kodi-pvr-njoy-21.0.1-Omega.tar.gz
+sha256  62d856e14b76aa6900c28d4679b13d79d891dc040c4ea87331b0eee373542644  kodi-pvr-njoy-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index ab0d371c21..da74a31de0 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NJOY_VERSION = 21.0.1-Omega
+KODI_PVR_NJOY_VERSION = 21.0.2-Omega
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index bc79a194de..2d9f739ad9 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d695032343a096c214a767f8c13d072035dc38cbda2a3305a91bc40ee7cb7770  kodi-pvr-pctv-21.0.1-Omega.tar.gz
+sha256  d3527b88d3956fecf8dda40928bc01bd340a22c25a6c38f758af8d6d85153354  kodi-pvr-pctv-21.0.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index d7b7b59b4c..52465471a4 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = 21.0.1-Omega
+KODI_PVR_PCTV_VERSION = 21.0.2-Omega
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 871d64c191..7381749ea2 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cacdae70fa5b35f2913b036bf6e1915c7aff45c6bfae782f27e184a5b9a77d5f  kodi-pvr-plutotv-21.3.2-Omega.tar.gz
+sha256  9b65a30f4a5c0cfbf1ab669f06a3afb0cc7b2732ed6d6d4e768d16fd10a0da02  kodi-pvr-plutotv-21.3.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index 1227e5910c..898b0aad0c 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 21.3.2-Omega
+KODI_PVR_PLUTOTV_VERSION = 21.3.3-Omega
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index 4232af0deb..0cf4b7d9b1 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dd461f59d37cd5e4a199ea2547aeef42861d9f7a57b5d92d3253f686164474a6  kodi-pvr-stalker-21.1.2-Omega.tar.gz
+sha256  567b0d8bc7d79a166a65e3c47ecb3f73e3aa57db840465ea2e6c70c74421c162  kodi-pvr-stalker-21.1.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index a703323cdc..cd910857a8 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = 21.1.2-Omega
+KODI_PVR_STALKER_VERSION = 21.1.3-Omega
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index e35d518baa..fb7ba291fd 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  241aad6926579835d5d0513ad588f39ee9e99de5858655c38a25454c69372746  kodi-pvr-vbox-21.1.4-Omega.tar.gz
+sha256  6550fa41f1d7312619dd9f4620a4b5b6c47240d71273df34a4300e580f617635  kodi-pvr-vbox-21.1.5-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 4b16c70ea8..f4e069933f 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VBOX_VERSION = 21.1.4-Omega
+KODI_PVR_VBOX_VERSION = 21.1.5-Omega
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index 79475062e8..5b139bedb2 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6c66868a97c4860442cf02acfeacedc929da372bf1b71971410700e8e9689a12  kodi-pvr-vdr-vnsi-21.1.2-Omega.tar.gz
+sha256  4608cfd2339cfc52470575f7caf153a97502cb360b44fcef2921c0623a931ef8  kodi-pvr-vdr-vnsi-21.1.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index c35594eba1..9ab5c9de03 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VDR_VNSI_VERSION = 21.1.2-Omega
+KODI_PVR_VDR_VNSI_VERSION = 21.1.3-Omega
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index 58d5316596..abbffd0f17 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6badfea5184aafe5808a0df2b8d668d04eb8b4eea2ef4586fd9d3a7d72514250  kodi-pvr-vuplus-21.3.1-Omega.tar.gz
+sha256  5d83bb04fdf6f41f3ebb63df19d9f5e21631de4726475df731fc665af789072c  kodi-pvr-vuplus-21.3.2-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index b3653a0d63..57798af420 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 21.3.1-Omega
+KODI_PVR_VUPLUS_VERSION = 21.3.2-Omega
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index f274aa92c2..ae4de33649 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  690de222455f4ec02480e3cc0eb524e64448ca95486394f562c48492a614e17c  kodi-pvr-wmc-21.0.2-Omega.tar.gz
+sha256  bee42bd2a55d00ab589db9ebcddfa75d9211571fda63d641ba484f5582934364  kodi-pvr-wmc-21.0.3-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index 04097ba151..f0284ab8a5 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = 21.0.2-Omega
+KODI_PVR_WMC_VERSION = 21.0.3-Omega
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
