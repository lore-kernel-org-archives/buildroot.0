From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu, 21 Feb 2019 17:27:25 -0300
Subject: [Buildroot] [PATCH 1/2] package/snort: bump to version 2.9.12
In-Reply-To: <1550780846-7463-1-git-send-email-sergio.prado@e-labworks.com>
References: <1550780846-7463-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <1550780846-7463-2-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/snort/snort.hash | 2 +-
 package/snort/snort.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 211e862b7fc0..abe85920cf1e 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 9f6b3aeac5a109f55504bd370564ac431cb1773507929dc461626898f33f46cd  snort-2.9.11.1.tar.gz
+sha256 7b02e11987c6cb4f6d79d72799ca9ad2b4bd59cc1d96bb7d6c91549f990d99d0  snort-2.9.12.tar.gz
 
 # Hash for license files:
 sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 568393468bb6..30de02b3a8b1 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.11.1
+SNORT_VERSION = 2.9.12
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
-- 
2.7.4
