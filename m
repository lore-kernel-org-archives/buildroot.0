From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:13 -0300
Subject: [Buildroot] [PATCH 45/53] rt-test: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-45-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rt-tests/rt-tests.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index e6455d5..e7dabdb 100644
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
+RT_TESTS_LICENSE_FILEs = COPYING
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 RT_TESTS_DEPENDENCIES = python
-- 
1.8.5.5
