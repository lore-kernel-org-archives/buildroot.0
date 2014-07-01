From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:37:07 +0200
Subject: [Buildroot] [git commit] rt-test: add license information
Message-ID: <20140701224922.6125F9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=076375eb2df2073a33a3e98bf37789e57e99d48c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter; fix variable name typo]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rt-tests/rt-tests.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index e6455d5..bee4782 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-RT_TESTS_SITE    = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests/
+RT_TESTS_SITE = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests/
 RT_TESTS_VERSION = 0.83
-RT_TESTS_SOURCE  = rt-tests_$(RT_TESTS_VERSION).orig.tar.gz
+RT_TESTS_SOURCE = rt-tests_$(RT_TESTS_VERSION).orig.tar.gz
+RT_TESTS_LICENSE = GPLv2+
+RT_TESTS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 RT_TESTS_DEPENDENCIES = python
