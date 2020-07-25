From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 22:37:35 +0200
Subject: [Buildroot] [git commit] package/debianutils: bump version to 4.11
Message-ID: <20200725203718.1DF8386D0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b5b39ce29ae24b082bdefbb446143ee6d5ae1d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

+ updated copyright hash

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/debianutils/debianutils.hash | 6 +++---
 package/debianutils/debianutils.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
index e07f405ee9..16a45d4ea1 100644
--- a/package/debianutils/debianutils.hash
+++ b/package/debianutils/debianutils.hash
@@ -1,4 +1,4 @@
-# From http://snapshot.debian.org/archive/debian/20190828T161440Z/pool/main/d/debianutils/debianutils_4.8.6.3.dsc
-sha256 2cc7de3afc6df1cf6d00af9938efac7ee8f739228e548e512ddc186b6a7be221 debianutils_4.8.6.3.tar.xz
+# From http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils/debianutils_4.11.dsc
+sha256 bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151 debianutils_4.11.tar.xz
 # Locally calculated
-sha256 a8698f078cd21fc501e66d070e12cf2f23ec1eaf5841bbc87629de76858ef7a7 debian/copyright
+sha256 3c8b5112cb8f74ba959233291908d73f527afa6f1d96f93649aeb912b5884567 debian/copyright
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
index a91383c17a..d2c41130fb 100644
--- a/package/debianutils/debianutils.mk
+++ b/package/debianutils/debianutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DEBIANUTILS_VERSION = 4.8.6.3
+DEBIANUTILS_VERSION = 4.11
 DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
-DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20190828T161440Z/pool/main/d/debianutils
+DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20200525T145753Z/pool/main/d/debianutils
 DEBIANUTILS_CONF_OPTS = --exec-prefix=/
 DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
 DEBIANUTILS_LICENSE_FILES = debian/copyright
