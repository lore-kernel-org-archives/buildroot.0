From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 17:05:47 +0200
Subject: [Buildroot] [git commit] package/python-websockets: bump to version
 8.0.2
Message-ID: <20191005150350.B96AE7FD96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fc96c404e93cf5d50642f5f8908ca5e6731bcfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update license hash (changed with a year bump).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-websockets/python-websockets.hash | 6 +++---
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 024b83d908..ec387c9ab7 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5	e3b5f2e257de0371e7b4d0b6ef7bc29e  websockets-7.0.tar.gz
-sha256	08e3c3e0535befa4f0c4443824496c03ecc25062debbcf895874f8a0b4c97c9f  websockets-7.0.tar.gz
+md5	a37f0e22c3aa5f1cf12a6a3ae22b36ca  websockets-8.0.2.tar.gz
+sha256	882a7266fa867a2ebb2c0baaa0f9159cabf131cf18c1b4270d79ad42f9208dc5  websockets-8.0.2.tar.gz
 # Locally computed sha256 checksums
-sha256	2cd4d416e432ca7fda2c103b38b852f8d3cb327d70c3db44410b9fe97e6c4d73  LICENSE
+sha256	8a88960c0d6aa8b38faa6ee614597dbf18e0ea22ba20884ef3dd31d34b2a6d09  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 30c35d3baa..013881f95a 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 7.0
+PYTHON_WEBSOCKETS_VERSION = 8.0.2
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/ba/60/59844a5cef2428cb752bd4f446b72095b1edee404a58c27e87cd12a141e2
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/79/78/17e97a159dc55308b1468a638c7267f19765281f6205ec9c15253c154022
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
