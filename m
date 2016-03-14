From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Mar 2016 23:43:48 +0100
Subject: [Buildroot] [git commit] taskd: remove redundant _SOURCE definition
Message-ID: <20160314224357.79CB57FA57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1031bf6a36e3c41328ebb9f9216a34b158fdb1e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

.tar.gz is the default.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/taskd/taskd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/taskd/taskd.mk b/package/taskd/taskd.mk
index 0bdf81d..65713d2 100644
--- a/package/taskd/taskd.mk
+++ b/package/taskd/taskd.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 TASKD_VERSION = 1.1.0
-TASKD_SOURCE = taskd-$(TASKD_VERSION).tar.gz
 TASKD_SITE = http://taskwarrior.org/download
 TASKD_LICENSE = MIT
 TASKD_LICENSE_FILES = COPYING LICENSE
