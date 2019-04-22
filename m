From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 22 Apr 2019 19:10:48 +0200
Subject: [Buildroot] [PATCH 2/3] package/libglew: bump to version 2.1.0
In-Reply-To: <20190422171049.22034-1-romain.naour@gmail.com>
References: <20190422171049.22034-1-romain.naour@gmail.com>
Message-ID: <20190422171049.22034-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See 2.1.0 Change Log:
http://glew.sourceforge.net/log.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
supertuxkart needs glew >= 2.1.0.
---
 package/libglew/libglew.hash | 9 +++++----
 package/libglew/libglew.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libglew/libglew.hash b/package/libglew/libglew.hash
index 44684ffc83..2e1b1f3c3c 100644
--- a/package/libglew/libglew.hash
+++ b/package/libglew/libglew.hash
@@ -1,5 +1,6 @@
-# From https://sourceforge.net/projects/glew/files/glew/2.0.0/
-sha1 6e15c84f7e1fad34cd3679f784a233744ddf048f  glew-2.0.0.tgz
-md5 2a2cd7c98f13854d2fcddae0d2b20411  glew-2.0.0.tgz
+# From https://sourceforge.net/projects/glew/files/glew/2.1.0/
+sha1 18eca05460d0b61709fc115e632b6fe320718b44  glew-2.1.0.tgz
+md5 b2ab12331033ddfaa50dc39345343980  glew-2.1.0.tgz
 # Locally computed:
-sha256 c572c30a4e64689c342ba1624130ac98936d7af90c3103f9ce12b8a0c5736764  glew-2.0.0.tgz
+sha256 04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95  glew-2.1.0.tgz
+sha256 8991cd11befec7c6a63662700f03c0cc42e864b6e77c7e70b80297c951a7f0ff  LICENSE.txt
diff --git a/package/libglew/libglew.mk b/package/libglew/libglew.mk
index 277a171b14..8a07170e99 100644
--- a/package/libglew/libglew.mk
+++ b/package/libglew/libglew.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGLEW_VERSION = 2.0.0
+LIBGLEW_VERSION = 2.1.0
 LIBGLEW_SOURCE = glew-$(LIBGLEW_VERSION).tgz
 LIBGLEW_SITE = http://sourceforge.net/projects/glew/files/glew/$(LIBGLEW_VERSION)
 LIBGLEW_LICENSE = BSD-3-Clause, MIT
-- 
2.14.5
