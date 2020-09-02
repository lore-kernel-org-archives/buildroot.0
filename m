From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:36 -0000
Subject: [Buildroot] [git commit] package/exfatprogs: bump to version 1.0.4
Message-ID: <20200902161635.3450485EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51a8edc99c17d07e3063bd09a27db500f0d6f97a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exfatprogs/exfatprogs.hash | 2 +-
 package/exfatprogs/exfatprogs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 6beb2777c2..d251bce5e6 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e73863d2f27901834e0dae678ecbb3d899e206d6036cca27d9b24b9479487f65  exfatprogs-1.0.3.tar.gz
+sha256  982883f208a694962dff0654f4421a1a726d7d71068a0c84b93a10688179a186  exfatprogs-1.0.4.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index a78cde3373..56db82cd8a 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.0.3
+EXFATPROGS_VERSION = 1.0.4
 EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
 EXFATPROGS_LICENSE = GPL-2.0+
 EXFATPROGS_LICENSE_FILES = COPYING
