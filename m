From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  4 Mar 2017 22:19:30 +0100
Subject: [Buildroot] [PATCH] lpeg: bump to version 1.0.1
Message-ID: <20170304211930.29155-1-francois.perrad@gadz.org>
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
index 50e66d1..9261674 100644
--- a/package/lpeg/lpeg.hash
+++ b/package/lpeg/lpeg.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e70c7cf8d7b8feddd8a41235d0ebb27bb60fbe7f31c8364ad23ee30a7f0cc26e  lpeg-1.0.0-1.src.rock
+sha256	149be31e0155c4694f77ea7264d9b398dd134eca0d00ff03358d91a6cfb2ea9d  lpeg-1.0.1-1.src.rock
diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
index 0754f00..1541f33 100644
--- a/package/lpeg/lpeg.mk
+++ b/package/lpeg/lpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LPEG_VERSION = 1.0.0-1
+LPEG_VERSION = 1.0.1-1
 LPEG_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
2.9.3
