From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri,  3 Jul 2020 19:04:18 -0300
Subject: [Buildroot] [PATCH v2] package/execline: bump version to 2.6.1.0
Message-ID: <20200703220418.21396-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also change the hash file to separate the fields by two spaces and
change the hash of the license (copyright year changed from 2019 to
2020).

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

---
Changes v1 -> v2:
- change the hash file to separate the fields by two spaces
- change the hash of the license (copyright year changed from 2019
  to 2020).

---
 package/execline/execline.hash | 4 ++--
 package/execline/execline.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index cef4959bda93..ac6239e86d46 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 05205c6869ae65a51c63d0e805572573806f6474aa21e12c49dd5654d3ceed33  execline-2.5.3.0.tar.gz
-sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
+sha256  a24c76f097ff44fe50b63b89bcde5d6ba9a481aecddbe88ee01b0e5a7b314556  execline-2.6.1.0.tar.gz
+sha256  5443ac67e8d74ac614ced7bc64211ce90ccedb7778a68bfe9e68a8b234c9503e  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 74ad91e4a8a2..e2423e9536df 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.5.3.0
+EXECLINE_VERSION = 2.6.1.0
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
-- 
2.17.1
