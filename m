From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:45 +0100
Subject: [Buildroot] [PATCH v3 32/38] package/kodi-visualisation-waveforhue:
	bump version
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-33-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed upstream repo as per:
https://github.com/notspiff/visualization.waveforhue/pull/3#issuecomment-221105720

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.hash  | 2 +-
 .../kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.hash b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.hash
index 5f49daae9..e7e97f1d8 100644
--- a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.hash
+++ b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2590ce4ee1816ffdf59fe33580a36fba49fbd1f60f4c9022b3315e04debc9c73 kodi-visualisation-waveforhue-e87d5c7d7e7504036b80af8bc89f4cf6489085fe.tar.gz
+sha256 80c466c55aee97d01442892135d4785070333e39f45942da17b65239758e5ae9  kodi-visualisation-waveforhue-b1805dbdba07e5e5b62115490c703aca43e9065c.tar.gz
diff --git a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
index 28eeb4d88..21840f18b 100644
--- a/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
+++ b/package/kodi-visualisation-waveforhue/kodi-visualisation-waveforhue.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORHUE_VERSION = e87d5c7d7e7504036b80af8bc89f4cf6489085fe
-KODI_VISUALISATION_WAVEFORHUE_SITE = $(call github,notspiff,visualization.waveforhue,$(KODI_VISUALISATION_WAVEFORHUE_VERSION))
+KODI_VISUALISATION_WAVEFORHUE_VERSION = b1805dbdba07e5e5b62115490c703aca43e9065c
+KODI_VISUALISATION_WAVEFORHUE_SITE = $(call github,hardyt,visualization.waveforhue,$(KODI_VISUALISATION_WAVEFORHUE_VERSION))
 KODI_VISUALISATION_WAVEFORHUE_LICENSE = GPLv2+
 KODI_VISUALISATION_WAVEFORHUE_LICENSE_FILES = COPYING
 KODI_VISUALISATION_WAVEFORHUE_DEPENDENCIES = kodi
-- 
2.11.0
