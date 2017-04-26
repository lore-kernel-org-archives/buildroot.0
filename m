From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:00:19 +0200
Subject: [Buildroot] [git commit] python-pyopenssl: bump version to 17.0.0
Message-ID: <20170426072112.F0043801E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab0a4e94377f010b5302f14cbed8cbcdd3e53fd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index 894c4f8..74fa4e5 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pyopenssl/json, sha256 locally computed
-md5     6635503758c65ea6f70d18d1b18e46d5  pyOpenSSL-16.2.0.tar.gz
-sha256  7779a3bbb74e79db234af6a08775568c6769b5821faecf6e2f4143edb227516e  pyOpenSSL-16.2.0.tar.gz
+md5 0704ca95106960375cfe78259453094a  pyOpenSSL-17.0.0.tar.gz
+sha256 48abfe9d2bb8eb8d8947c8452b0223b7b1be2383b332f3b4f248fe59ef0bafdd  pyOpenSSL-17.0.0.tar.gz
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index a5312a0..3fbaf8d 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 16.2.0
+PYTHON_PYOPENSSL_VERSION = 17.0.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://pypi.python.org/packages/0c/d6/b1fe519846a21614fa4f8233361574eddb223e0bc36b182140d916acfb3b
+PYTHON_PYOPENSSL_SITE = https://pypi.python.org/packages/9f/32/80fe4fddeb731b7766cd09fe0b2032a91b43dae655e216792af2a6ae3190
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_SETUP_TYPE = setuptools
