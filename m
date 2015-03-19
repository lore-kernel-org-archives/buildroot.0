From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 13:37:30 +0100
Subject: [Buildroot] [git commit] trinity: bump version to v1.5
Message-ID: <20150319123820.117AB8189E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0e9e311e8a6c8e8e0961a38a5dc46c1d213315d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trinity/trinity.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 5f8a707..ecd82f8 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRINITY_VERSION = c8c41f99500b5854c2061a08962b8908c872d852
+TRINITY_VERSION = v1.5
 TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
 TRINITY_LICENSE = GPLv2
 TRINITY_LICENSE_FILES = COPYING
