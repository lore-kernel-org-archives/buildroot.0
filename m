From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:29:32 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-hts: bump version
Message-ID: <20160305203005.33B7481801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d69db6c1a99c09d90d71edd3148cfb60a34ca17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 56ff4ab..369e6c0 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5f2996839d9ec3b5e0d6619e56df2d3bcf1741f07e4cfa467b1d690425047199 kodi-pvr-hts-7f75b70527922aef953123ff97ebaa22d9fb7cb4.tar.gz
+sha256 004dee4455d5d539b5e42d663659d4886d9a8650847ad614fa2179bbaace3783 kodi-pvr-hts-3c673b5b29fc26c203c79f7df58680af50a1afa7.tar.gz
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 0709197..4ca5a31 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_HTS_VERSION = 7f75b70527922aef953123ff97ebaa22d9fb7cb4
+KODI_PVR_HTS_VERSION = 3c673b5b29fc26c203c79f7df58680af50a1afa7
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPLv2+
 KODI_PVR_HTS_LICENSE_FILES = src/client.h
