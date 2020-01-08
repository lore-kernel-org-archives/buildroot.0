From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  8 Jan 2020 22:50:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/pugixml: bump to version 1.10
Message-ID: <20200108215039.3584499-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash of license file (update in year and version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pugixml/pugixml.hash | 4 ++--
 package/pugixml/pugixml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pugixml/pugixml.hash b/package/pugixml/pugixml.hash
index fb6566dabf..79ae75e83b 100644
--- a/package/pugixml/pugixml.hash
+++ b/package/pugixml/pugixml.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d156d35b83f680e40fd6412c4455fdd03544339779134617b9b28d19e11fdba6  pugixml-1.9.tar.gz
-sha256  5f2318fdea73711b4761fd395462a51dc7d4626088ebaa41732b598821ac935a  readme.txt
+sha256  55f399fbb470942410d348584dc953bcaec926415d3462f471ef350f29b5870a  pugixml-1.10.tar.gz
+sha256  16582559c91ecf831d6289d472a903032e7d7994a86521c5c39513568d6ad208  readme.txt
diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 368f958920..800a3836ce 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUGIXML_VERSION = 1.9
+PUGIXML_VERSION = 1.10
 PUGIXML_SITE = http://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = readme.txt
-- 
2.24.1
