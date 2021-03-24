From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 24 Mar 2021 13:36:04 +0100
Subject: [Buildroot] [PATCH 1/2] package/gensio: bump version to 2.2.4
Message-ID: <20210324123605.24228-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index 77963abe40..03bd85cd0f 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  3feb9b586f41cdda4025eeac11000127  gensio-2.2.3.tar.gz
-sha1  85eb2f063e906868672e08c8f7e282272904631c  gensio-2.2.3.tar.gz
+md5  3d1135a7bd7a3aca48493997fed1f1a0  gensio-2.2.4.tar.gz
+sha1  3c59d94e48c0a8ec5ed57ebb4ea95f3709d108ac  gensio-2.2.4.tar.gz
 # Locally computed:
-sha256  ffc849be3349ba15cd6f92d109a54c7608c15d33d210a262c02ddcf00ea76262  gensio-2.2.3.tar.gz
+sha256  36cadbc790e03e4150a12bca14b20215afdff0a0f8deaf85c10434dca54d0493  gensio-2.2.4.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index e68e75e2ad..0b2bb63956 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.2.3
+GENSIO_VERSION = 2.2.4
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
-- 
2.30.0
