From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 14 Mar 2016 00:00:08 +0100
Subject: [Buildroot] [PATCH 4/4] taskd: include only one license file
In-Reply-To: <1457910008-19414-1-git-send-email-arnout@mind.be>
References: <1457910008-19414-1-git-send-email-arnout@mind.be>
Message-ID: <1457910008-19414-4-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

COPYING and LICENSE are identical, so no point including them both.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/taskd/taskd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/taskd/taskd.mk b/package/taskd/taskd.mk
index 65713d2..34a260e 100644
--- a/package/taskd/taskd.mk
+++ b/package/taskd/taskd.mk
@@ -7,7 +7,7 @@
 TASKD_VERSION = 1.1.0
 TASKD_SITE = http://taskwarrior.org/download
 TASKD_LICENSE = MIT
-TASKD_LICENSE_FILES = COPYING LICENSE
+TASKD_LICENSE_FILES = COPYING
 TASKD_DEPENDENCIES = gnutls util-linux
 
 $(eval $(cmake-package))
-- 
2.7.0
