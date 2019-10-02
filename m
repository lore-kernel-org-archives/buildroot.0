From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 23:04:54 +0200
Subject: [Buildroot] [git commit] package/libpfm4: bump to version 4.10.1
Message-ID: <20191002210033.90BDE8074E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7295b8418a6af16a87d207fa48bcf9335380194
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpfm4/libpfm4.hash | 6 +++---
 package/libpfm4/libpfm4.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
index 20671fb6e0..2c1442dd11 100644
--- a/package/libpfm4/libpfm4.hash
+++ b/package/libpfm4/libpfm4.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/perfmon2/files/libpfm4/:
-sha1  3a7b556e0778fd76e9e7abb06e5d4d2599ffbefc  libpfm-4.9.0.tar.gz
-md5  42ad4a2e5b8e1f015310db8535739c73  libpfm-4.9.0.tar.gz
+sha1  78599e1668142f48c24afb1f79ca00a89df51b65  libpfm-4.10.1.tar.gz
+md5  d8f66cb9bfa7e1434434e0de6409db5b  libpfm-4.10.1.tar.gz
 # Locally calculated
-sha256  db0fbe8ee28fd9beeb5d3e80b7cb3b104debcf6a9fcf5cb8b882f0662c79e4e2  libpfm-4.9.0.tar.gz
+sha256  c61c575378b5c17ccfc5806761e4038828610de76e2e34fac9f7fa73ba844b49  libpfm-4.10.1.tar.gz
 sha256  beef323d68fc5db9c67b20e8e9de7ccde371d20cdbcdd686804055b18b926d90  COPYING
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 88632f478b..cc89d4422b 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPFM4_VERSION = 4.9.0
+LIBPFM4_VERSION = 4.10.1
 LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
 LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4
 LIBPFM4_LICENSE = libpfm4 license
