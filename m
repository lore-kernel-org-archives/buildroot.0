From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Oct 2020 15:07:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiawatha: bump to version 10.11
Message-ID: <20201004130755.519924-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Default value of MinTLSversion set to 1.2.
- mbed TLS updated to 2.23.0.
- Small bugfixes.

- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/hiawatha.hash | 4 ++--
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index 359a435420..2fba5600a2 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b5e46f5757fa647e77d21d24f7eea912d59f26a75558cba780b45c1c3a33a4d9  hiawatha-10.10.tar.gz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
+sha256  79d85d165d68dd7043bbd337f5bc7dd10d8632d68ba61d0e557f84bd687c9727  hiawatha-10.11.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 01b9292035..126cb71105 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.10
+HIAWATHA_VERSION = 10.11
 HIAWATHA_SITE = https://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPL-2.0
-- 
2.28.0
