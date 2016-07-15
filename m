From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 14:59:03 +0200
Subject: [Buildroot] [git commit] package/rt-tests: switch to the upstream
	repository
Message-ID: <20160715130315.D5E4A82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96bc05ec3791d9333b965780c0f815b836fb06ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rt-tests is not maintained from Clark Williams's repository anymore.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
