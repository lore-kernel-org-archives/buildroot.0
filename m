From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 10:43:11 +0200
Subject: [Buildroot] [git commit] package/expedite: bump version for efl
	1.19 support
Message-ID: <20170415084524.AD2BA7FF6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a7b184c6bf0a5134498960d1bf61f80b805ceb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required due to eo api changes.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/expedite/expedite.hash | 2 +-
 package/expedite/expedite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/expedite/expedite.hash b/package/expedite/expedite.hash
index 85c4444..2d1db59 100644
--- a/package/expedite/expedite.hash
+++ b/package/expedite/expedite.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 a8690a714c16d6b67e7fd6d70973e9805c3569a9131900b1feaf183220496831  expedite-ffa005ea3de26b4219f32c285cb1665bb1366163.tar.gz
+sha256 007e382861555f1023b679e21ff44122b0622c514ce8ef9d7c390b9ac1511009 expedite-0529ce56b6fb01e9651e76461e9608e15a040fb3.tar.gz
diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index c18d32b..d49e87a 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPEDITE_VERSION = ffa005ea3de26b4219f32c285cb1665bb1366163
+EXPEDITE_VERSION = 0529ce56b6fb01e9651e76461e9608e15a040fb3
 EXPEDITE_SITE = http://git.enlightenment.org/tools/expedite.git
 EXPEDITE_SITE_METHOD = git
 EXPEDITE_LICENSE = BSD-2-Clause
