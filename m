From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Thu, 21 Nov 2013 13:48:04 -0600
Subject: [Buildroot] [PATCH 1/1] xerces: add host
Message-ID: <1385063284-31586-1-git-send-email-mlweber1@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
---
 package/xerces/xerces.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 7bd7070..2e4c512 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -25,3 +25,4 @@ XERCES_CONF_OPT += --disable-network
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.1
