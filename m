From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 30 Jul 2019 20:41:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/pwgen: bump to version 2.08
Message-ID: <1564512087-12005-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file

Fixes:

$: make pwgen-legal-info
>>> pwgen 2.08 Collecting legal info
 ERROR: No hash found for debian/copyright

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/pwgen/pwgen.hash | 8 +++++---
 package/pwgen/pwgen.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/pwgen/pwgen.hash b/package/pwgen/pwgen.hash
index 2997ed3..6dca636 100644
--- a/package/pwgen/pwgen.hash
+++ b/package/pwgen/pwgen.hash
@@ -1,3 +1,5 @@
-# From http://sourceforge.net/projects/pwgen/files/pwgen/2.07/
-md5	910b1008cdd86445e9e01305d21ee4c5	pwgen-2.07.tar.gz
-sha1	51180f9cd5530d79eea18b2443780dec4ec5ea43	pwgen-2.07.tar.gz
+# From http://sourceforge.net/projects/pwgen/files/pwgen/2.08/
+md5	6cfba450ac6ff72d11e88a6b0b049165	pwgen-2.08.tar.gz
+sha1	6406deba61297784888c2ec0c14e3c735a85a2b6	pwgen-2.08.tar.gz
+# Locally computed:
+sha256 5d3e49e01ef782be5841d5d1f7fb64d290cd86459598a913818584a46a2f81a1 debian/copyright
diff --git a/package/pwgen/pwgen.mk b/package/pwgen/pwgen.mk
index 653adb8..ad9465b 100644
--- a/package/pwgen/pwgen.mk
+++ b/package/pwgen/pwgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PWGEN_VERSION = 2.07
+PWGEN_VERSION = 2.08
 PWGEN_SITE = http://downloads.sourceforge.net/project/pwgen/pwgen/$(PWGEN_VERSION)
 PWGEN_LICENSE = GPL-2.0
 PWGEN_LICENSE_FILES = debian/copyright
-- 
2.7.4
