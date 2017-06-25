From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 25 Jun 2017 21:26:17 +0200
Subject: [Buildroot] [PATCH 5/9] s6: bump version to 2.6.0.0
In-Reply-To: <20170625192621.24188-1-eric.le.bihan.dev@free.fr>
References: <20170625192621.24188-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170625192621.24188-6-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6/s6.hash | 2 +-
 package/s6/s6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 36526de..1d35c4e 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 5e788d5935dbcce76ac9a99cfcf6ee46a2ffb84220c84225df7589e9a3585560 s6-2.4.0.0.tar.gz
+sha256 146dd54086063c6ffb6f554c3e92b8b12a24165fdfab24839de811f79dcf9a40  s6-2.6.0.0.tar.gz
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index de08f67..f0235da 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.4.0.0
+S6_VERSION = 2.6.0.0
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
-- 
2.9.4
