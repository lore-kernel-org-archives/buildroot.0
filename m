From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 14 Jul 2016 21:01:07 +0200
Subject: [Buildroot] [PATCH 1/3] package/rt-tests: switch to the upstream
	repository
Message-ID: <1468522869-3887-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rt-tests is not maintained from Clark Williams's repository anymore.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
We missed some rt-tests release (v0.90 to v1.0).
Since v0.92 a release tarball is available at
https://www.kernel.org/pub/linux/utils/rt-tests so we
no longer need to clone the git repository.
---
 package/rt-tests/rt-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 74d7c6d..380bacf 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RT_TESTS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/clrkwllms/rt-tests.git
+RT_TESTS_SITE = git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git
 RT_TESTS_VERSION = v0.89
 RT_TESTS_LICENSE = GPLv2+
 RT_TESTS_LICENSE_FILES = COPYING
-- 
2.5.5
