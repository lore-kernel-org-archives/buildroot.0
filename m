From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 16 Nov 2016 12:58:37 +0000
Subject: [Buildroot] [PATCH] gnuchess: bump version to 6.2.4 (security)
Message-ID: <20161116125837.48840-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

oss-security reference:
  http://www.openwall.com/lists/oss-security/2016/11/13/2

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gnuchess/gnuchess.hash | 2 +-
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index 26342bc..064a845 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256	17caab725539447bcb17a14b17905242cbf287087e53a6777524feb7bbaeed06	gnuchess-6.2.1.tar.gz
+sha256 3c425c0264f253fc5cc2ba969abe667d77703c728770bd4b23c456cbe5e082ef  gnuchess-6.2.4.tar.gz
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 0555cb1..e066b01 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUCHESS_VERSION = 6.2.1
+GNUCHESS_VERSION = 6.2.4
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPLv2+
 GNUCHESS_LICENSE_FILES = COPYING
-- 
2.10.1
