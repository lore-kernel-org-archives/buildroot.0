From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:21:29 +0100
Subject: [Buildroot] [git commit] swupdate: bump to version 2017.01
Message-ID: <20170310212146.89C7180DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd8e5b819ff31c96dbc7ad94c28a5ad2eb838631
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 1ba10f6..d4e8833 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  840d6287a41f7a42e08a74045ee40b7c2f82c1ecfedf8c915e3935d4f0084376  swupdate-2016.10.tar.gz
+sha256  ce28348e98aa5657154d2eacc2e8a9b114ba50a937531b010872c8eb6fd72b23  swupdate-2017.01.tar.gz
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 688f4ee..7f2cb0a 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2016.10
+SWUPDATE_VERSION = 2017.01
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPLv2+, MIT, Public Domain
 SWUPDATE_LICENSE_FILES = COPYING
