From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Nov 2011 13:05:36 -0300
Subject: [Buildroot] [PATCH] radvd: security bump to version 1.8.3
Message-ID: <1320249936-22641-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/radvd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 5d07ff6..d4b9a73 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RADVD_VERSION = 1.8.2
+RADVD_VERSION = 1.8.3
 RADVD_SITE = http://www.litech.org/radvd/dist/
 RADVD_DEPENDENCIES = flex host-flex
 
-- 
1.7.3.4
