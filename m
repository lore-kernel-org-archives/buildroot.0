From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 14 Mar 2016 00:00:07 +0100
Subject: [Buildroot] [PATCH 3/4] taskd: remove redundant _SOURCE definition
In-Reply-To: <1457910008-19414-1-git-send-email-arnout@mind.be>
References: <1457910008-19414-1-git-send-email-arnout@mind.be>
Message-ID: <1457910008-19414-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

.tar.gz is the default.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
-- 
2.7.0
