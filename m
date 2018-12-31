From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:59:52 +0100
Subject: [Buildroot] [git commit] package/lua*: fix indentation of license
 file lists
Message-ID: <20181231165620.45944882A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42fa5bcbfb48f188c2c180854c0bbdefd98c32c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Luarocks addon does not properly indent with a tab, let's fix that
manually for the time being, to avoid check-package complaints.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/orbit/orbit.mk                 | 4 ++--
 package/wsapi-fcgi/wsapi-fcgi.mk       | 4 ++--
 package/wsapi-xavante/wsapi-xavante.mk | 4 ++--
 package/wsapi/wsapi.mk                 | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index 77549a28c1..5cf7ac643a 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -8,7 +8,7 @@ ORBIT_VERSION = 2.2.4-1
 ORBIT_SUBDIR = orbit
 ORBIT_LICENSE = MIT
 ORBIT_LICENSE_FILES = \
-    $(ORBIT_SUBDIR)/doc/us/license.html \
-    $(ORBIT_SUBDIR)/doc/us/license.md
+	$(ORBIT_SUBDIR)/doc/us/license.html \
+	$(ORBIT_SUBDIR)/doc/us/license.md
 
 $(eval $(luarocks-package))
diff --git a/package/wsapi-fcgi/wsapi-fcgi.mk b/package/wsapi-fcgi/wsapi-fcgi.mk
index d94721e4e3..677bb774be 100644
--- a/package/wsapi-fcgi/wsapi-fcgi.mk
+++ b/package/wsapi-fcgi/wsapi-fcgi.mk
@@ -8,8 +8,8 @@ WSAPI_FCGI_VERSION = 1.7-1
 WSAPI_FCGI_SUBDIR = wsapi
 WSAPI_FCGI_LICENSE = MIT
 WSAPI_FCGI_LICENSE_FILES = \
-    $(WSAPI_FCGI_SUBDIR)/doc/us/license.html \
-    $(WSAPI_FCGI_SUBDIR)/doc/us/license.md
+	$(WSAPI_FCGI_SUBDIR)/doc/us/license.html \
+	$(WSAPI_FCGI_SUBDIR)/doc/us/license.md
 WSAPI_FCGI_DEPENDENCIES = libfcgi
 
 $(eval $(luarocks-package))
diff --git a/package/wsapi-xavante/wsapi-xavante.mk b/package/wsapi-xavante/wsapi-xavante.mk
index 46aa10651b..3a747e9b0b 100644
--- a/package/wsapi-xavante/wsapi-xavante.mk
+++ b/package/wsapi-xavante/wsapi-xavante.mk
@@ -8,7 +8,7 @@ WSAPI_XAVANTE_VERSION = 1.7-1
 WSAPI_XAVANTE_SUBDIR = wsapi
 WSAPI_XAVANTE_LICENSE = MIT
 WSAPI_XAVANTE_LICENSE_FILES = \
-    $(WSAPI_XAVANTE_SUBDIR)/doc/us/license.html \
-    $(WSAPI_XAVANTE_SUBDIR)/doc/us/license.md
+	$(WSAPI_XAVANTE_SUBDIR)/doc/us/license.html \
+	$(WSAPI_XAVANTE_SUBDIR)/doc/us/license.md
 
 $(eval $(luarocks-package))
diff --git a/package/wsapi/wsapi.mk b/package/wsapi/wsapi.mk
index ad62a05f5a..d67efd0e7b 100644
--- a/package/wsapi/wsapi.mk
+++ b/package/wsapi/wsapi.mk
@@ -8,7 +8,7 @@ WSAPI_VERSION = 1.7-1
 WSAPI_SUBDIR = wsapi
 WSAPI_LICENSE = MIT
 WSAPI_LICENSE_FILES = \
-    $(WSAPI_SUBDIR)/doc/us/license.html \
-    $(WSAPI_SUBDIR)/doc/us/license.md
+	$(WSAPI_SUBDIR)/doc/us/license.html \
+	$(WSAPI_SUBDIR)/doc/us/license.md
 
 $(eval $(luarocks-package))
