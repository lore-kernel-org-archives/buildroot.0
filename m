From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  2 Oct 2015 10:14:29 +0200
Subject: [Buildroot] [PATCH] lpeg: bump to version 1.0.0
Message-ID: <1443773669-15351-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lpeg/lpeg.hash | 2 +-
 package/lpeg/lpeg.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lpeg/lpeg.hash b/package/lpeg/lpeg.hash
index 1d4e3f4..50e66d1 100644
--- a/package/lpeg/lpeg.hash
+++ b/package/lpeg/lpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	5df2f09d0cbb67e46176c925e434c0f299ec89060ee97beccfa90375a6f8d3a7  lpeg-0.12.2-1.src.rock
+sha256	e70c7cf8d7b8feddd8a41235d0ebb27bb60fbe7f31c8364ad23ee30a7f0cc26e  lpeg-1.0.0-1.src.rock
diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
index 76e75f7..0754f00 100644
--- a/package/lpeg/lpeg.mk
+++ b/package/lpeg/lpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LPEG_VERSION = 0.12.2-1
+LPEG_VERSION = 1.0.0-1
 LPEG_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
2.1.4
