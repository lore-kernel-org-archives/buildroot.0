From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  5 Jan 2021 19:23:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/stellarium: bump version to 0.20.4
Message-ID: <20210105182333.814712-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
http://stellarium.org/release/2020/12/28/stellarium-0.20.4.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/stellarium/stellarium.hash | 4 ++--
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 4f0ee7e12f..fb6d464222 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha1  a3de40d74b2dcf8c9a7c6220de3d9e951e5b06c8    stellarium-0.20.3.tar.gz
-sha256 2781a364d14c203c21a11ef528d541559ed749e1b6c3dbc1187410a6c23ab97c  stellarium-0.20.3.tar.gz
+sha1  c399f9c785f6a33d04f1a1c4f2db3309ce4781dc  stellarium-0.20.4.tar.gz
+sha256  63033bb6ad01b5f021689766b2a09a99bcabcfec57a710e46a93c40a32fda388  stellarium-0.20.4.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index d9ba29c8b5..ac0bd47725 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.20.3
+STELLARIUM_VERSION = 0.20.4
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
-- 
2.29.2
