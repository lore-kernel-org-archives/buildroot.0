From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:18:09 +0200
Subject: [Buildroot] [git commit] package/xmlstarlet: bump version to 1.6.1
Message-ID: <20160618211846.B1C5E81D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f885bded731bb51c73bee1f84776c0687de6f12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xmlstarlet/xmlstarlet.hash | 5 +++--
 package/xmlstarlet/xmlstarlet.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/xmlstarlet/xmlstarlet.hash b/package/xmlstarlet/xmlstarlet.hash
index 2d6558f..ca9aecf 100644
--- a/package/xmlstarlet/xmlstarlet.hash
+++ b/package/xmlstarlet/xmlstarlet.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  47b4ed042ea2909257f2a386001af49fceb303f84da7214779ccf99fffc6bbba  xmlstarlet-1.5.0.tar.gz
+# From https://sourceforge.net/projects/xmlstar/files/xmlstarlet/1.6.1/
+sha1	87bb104f546caca71b9540807c5b2738944cb219	xmlstarlet-1.6.1.tar.gz
+md5	f3c5dfa3b1a2ee06cd57c255cc8b70a0		xmlstarlet-1.6.1.tar.gz
diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index e0abf04..7039d77 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMLSTARLET_VERSION = 1.5.0
+XMLSTARLET_VERSION = 1.6.1
 XMLSTARLET_SITE = http://downloads.sourceforge.net/project/xmlstar/xmlstarlet/$(XMLSTARLET_VERSION)
 XMLSTARLET_LICENSE = MIT
 XMLSTARLET_LICENSE_FILES = COPYING
