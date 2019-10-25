From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 25 Oct 2019 21:54:46 +0300
Subject: [Buildroot] [PATCH 1/1] package/scons: bump to version 3.1.0
In-Reply-To: <20191025185448.32633-1-asafka7@gmail.com>
References: <20191025185448.32633-1-asafka7@gmail.com>
Message-ID: <20191025185448.32633-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/scons/scons.hash | 2 +-
 package/scons/scons.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index ed31301562..14be1250de 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  df676f23dc6d4bfa384fc389d95dcd21ab907e6349d4c848958ba4befb73c73e  scons-3.0.5.tar.gz
+sha256  f3f548d738d4a2179123ecd744271ec413b2d55735ea7625a59b1b59e6cd132f  scons-3.1.0.tar.gz
 sha256  c4248451b6a4cd09870de4fb82a857feb9f98174167b07500c19ed0263fd4db7  LICENSE.txt
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 6533811db7..d7cc427add 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCONS_VERSION = 3.0.5
+SCONS_VERSION = 3.1.0
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
