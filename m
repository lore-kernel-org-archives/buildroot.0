From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Apr 2013 08:50:52 -0300
Subject: [Buildroot] [PATCH 2/2] radvd: needs host-bison
In-Reply-To: <1365335452-29872-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365335452-29872-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365335452-29872-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/849c48029ba77789f33ff726c5a33cd959200e38/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/radvd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 2a60729..95bfe07 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -6,7 +6,7 @@
 
 RADVD_VERSION = 1.9.2
 RADVD_SITE = http://www.litech.org/radvd/dist
-RADVD_DEPENDENCIES = flex libdaemon host-flex host-pkgconf
+RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
 RADVD_AUTORECONF = YES
 
 define RADVD_INSTALL_INITSCRIPT
-- 
1.8.1.5
