From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 09:44:16 +0200
Subject: [Buildroot] [git commit] package/tzdata: bump version, add hash
Message-ID: <20150419074553.ABDDC7FB27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a5f65bc2f06832f0cf2879bb65370ee69a955f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tzdata/tzdata.hash |    2 ++
 package/tzdata/tzdata.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
new file mode 100644
index 0000000..d02829a
--- /dev/null
+++ b/package/tzdata/tzdata.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  860fac5f5f57f7a2dfc1ba682dbd1f5c0f0b597f761571277b6ed6561e22365a  tzdata2015c.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 454ac29..d8512a3 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2015a
+TZDATA_VERSION = 2015c
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_DEPENDENCIES = host-tzdata
