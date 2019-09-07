From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Sep 2019 22:09:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/augeas: bump to version 1.12.0
In-Reply-To: <20190907200913.26642-1-fontaine.fabrice@gmail.com>
References: <20190907200913.26642-1-fontaine.fabrice@gmail.com>
Message-ID: <20190907200913.26642-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/augeas/augeas.hash | 4 ++--
 package/augeas/augeas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/augeas/augeas.hash b/package/augeas/augeas.hash
index d69ef8577e..03b71349ac 100644
--- a/package/augeas/augeas.hash
+++ b/package/augeas/augeas.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
-# http://download.augeas.net/augeas-1.11.0.tar.gz.sig
-sha256  393ce8f4055af89cd4c20bf903eacbbd909cf427891f41b56dc2ba66243ea0b0  augeas-1.11.0.tar.gz
+# http://download.augeas.net/augeas-1.12.0.tar.gz.sig
+sha256  321942c9cc32185e2e9cb72d0a70eea106635b50269075aca6714e3ec282cb87  augeas-1.12.0.tar.gz
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING
diff --git a/package/augeas/augeas.mk b/package/augeas/augeas.mk
index 7897d8f493..cf369d6910 100644
--- a/package/augeas/augeas.mk
+++ b/package/augeas/augeas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUGEAS_VERSION = 1.11.0
+AUGEAS_VERSION = 1.12.0
 AUGEAS_SITE = http://download.augeas.net
 AUGEAS_INSTALL_STAGING = YES
 AUGEAS_LICENSE = LGPL-2.1+
-- 
2.23.0.rc1
