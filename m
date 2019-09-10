From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 18:53:43 +0200
Subject: [Buildroot] [git commit] package/uhubctl: bump to version 2.1.0
Message-ID: <20190910164917.C987C8DB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5215d5cdcb4b1878c1c600529022bc082799105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license file hash: copyright year update.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uhubctl/uhubctl.hash | 4 ++--
 package/uhubctl/uhubctl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
index 613414af46..255f7aa111 100644
--- a/package/uhubctl/uhubctl.hash
+++ b/package/uhubctl/uhubctl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e uhubctl-2.0.0.tar.gz
-sha256 3260a6cd23e2677be1fa0815785cd5fa499d363a033f58cc299e12220662d486 LICENSE
+sha256 227fdd541067b84eaa0e15cdc171458a56de7591f7a1deaff3e6d42d2809450b uhubctl-2.1.0.tar.gz
+sha256 05d376f74b3b539e2758d2b8a4bef5b15e567350d19c8581b5344bf4ce84414a LICENSE
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
index a4f3160e6c..da217a7bd7 100644
--- a/package/uhubctl/uhubctl.mk
+++ b/package/uhubctl/uhubctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHUBCTL_VERSION = 2.0.0
+UHUBCTL_VERSION = 2.1.0
 UHUBCTL_SITE = $(call github,mvp,uhubctl,v$(UHUBCTL_VERSION))
 UHUBCTL_LICENSE = GPL-2.0
 UHUBCTL_LICENSE_FILES = LICENSE
