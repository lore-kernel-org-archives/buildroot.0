From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 May 2018 00:23:06 +0200
Subject: [Buildroot] [PATCH 1/1] liblogging: bump to version 1.0.6
Message-ID: <20180503222306.18200-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liblogging/liblogging.hash | 5 ++++-
 package/liblogging/liblogging.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/liblogging/liblogging.hash b/package/liblogging/liblogging.hash
index f5674a1c6d..618689b49b 100644
--- a/package/liblogging/liblogging.hash
+++ b/package/liblogging/liblogging.hash
@@ -1,2 +1,5 @@
 # From http://www.liblogging.org/
-sha256	310dc1691279b7a669d383581fe4b0babdc7bf75c9b54a24e51e60428624890b	liblogging-1.0.5.tar.gz
+sha256	338c6174e5c8652eaa34f956be3451f7491a4416ab489aef63151f802b00bf93	liblogging-1.0.6.tar.gz
+
+# Hash for license file:
+sha256	a5626f700d3ee92513673b5f43733af5b651d9e7a9157d4bd81ceb9c89ec04b0	COPYING
diff --git a/package/liblogging/liblogging.mk b/package/liblogging/liblogging.mk
index ec57a0ac35..c756891a86 100644
--- a/package/liblogging/liblogging.mk
+++ b/package/liblogging/liblogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLOGGING_VERSION = 1.0.5
+LIBLOGGING_VERSION = 1.0.6
 LIBLOGGING_SITE = http://download.rsyslog.com/liblogging
 LIBLOGGING_LICENSE = BSD-2-Clause
 LIBLOGGING_LICENSE_FILES = COPYING
-- 
2.14.1
