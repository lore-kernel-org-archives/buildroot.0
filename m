From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2020 22:52:39 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/python3: bump to
 version 3.8.6
Message-ID: <20201003204318.D2B9F8E4F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0f20de05ee4b4a3e72eaa96058fc356cba350c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Contains a number of bugfixes. For details, see the changelog:

https://docs.python.org/release/3.8.6/whatsnew/changelog.html#changelog

Update the license hash for the addition of a note stating that the examples
and documentation is now dual licensed under the PSF and a Zero-Clause BSD
license since:

https://github.com/python/cpython/commit/9fef7c54a0adfade5ec94259d97f22e05fe9e3e3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3469e6e46bac858f826c33f9a637402e9d76c27a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/python3.hash | 8 ++++----
 package/python3/python3.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 0a08d04b3f..4c03293dd1 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-385/
-md5  35b5a3d0254c1c59be9736373d429db7  Python-3.8.5.tar.xz
+# From https://www.python.org/downloads/release/python-386/
+md5  69e73c49eeb1a853cefd26d18c9d069d  Python-3.8.6.tar.xz
 # Locally computed
-sha256  e3003ed57db17e617acb382b0cade29a248c6026b1bd8aad1f976e9af66a83b0  Python-3.8.5.tar.xz
-sha256  de4d1f2d2ad5ad0cfd1657a106476b31cb5db5ef9d1ff842b237c0c81f0c8a23  LICENSE
+sha256  a9e0b79d27aa056eb9cce8d63a427b5f9bab1465dee3f942dcfdb25a82f4ab8a  Python-3.8.6.tar.xz
+sha256  1dceef1677a39befa8bf0285ab2db441ba117520bb2de839547ace006a17750d  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index c8491322c5..1a2edc6471 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.8
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
