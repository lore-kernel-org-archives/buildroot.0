From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 20:53:37 +0200
Subject: [Buildroot] [git commit] package/minissdpd: bump to version
 1.5.20200928
Message-ID: <20201006184308.C62208D69F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a2a028e4c5ab60fb60405149a029fa09e04b010
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

http://miniupnp.free.fr/files/changelog.php?file=minissdpd-1.5.20200928.tar.gz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minissdpd/minissdpd.hash | 4 ++--
 package/minissdpd/minissdpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minissdpd/minissdpd.hash b/package/minissdpd/minissdpd.hash
index 695f652b32..385a5a0c2a 100644
--- a/package/minissdpd/minissdpd.hash
+++ b/package/minissdpd/minissdpd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	07feea19dfa7d79d144e0f4a19a859a21cdb58445b77dc2d6222f2434e0ac92c	minissdpd-1.5.20190824.tar.gz
-sha256	00c8368dd1574b025df65f24f61c32d1297ff9b6dc695fda964b1b1efc7a53d3	LICENSE
+sha256  177ab1907cc0fd20c8cafd13ca8674c7ec1828aa6101da9bb066408ccada7350  minissdpd-1.5.20200928.tar.gz
+sha256  00c8368dd1574b025df65f24f61c32d1297ff9b6dc695fda964b1b1efc7a53d3  LICENSE
diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index 55973752c0..4560919baa 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINISSDPD_VERSION = 1.5.20190824
+MINISSDPD_VERSION = 1.5.20200928
 MINISSDPD_SITE = http://miniupnp.free.fr/files
 MINISSDPD_LICENSE = BSD-3-Clause
 MINISSDPD_LICENSE_FILES = LICENSE
