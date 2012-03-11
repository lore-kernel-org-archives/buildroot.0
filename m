From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 18:47:54 -0300
Subject: [Buildroot] [PATCH 05/20] radvd: bump version to 1.8.5
In-Reply-To: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331502489-5036-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/radvd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index d4b9a73..e63e8e0 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-RADVD_VERSION = 1.8.3
-RADVD_SITE = http://www.litech.org/radvd/dist/
+RADVD_VERSION = 1.8.5
+RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = flex host-flex
 
 define RADVD_INSTALL_INITSCRIPT
-- 
1.7.3.4
