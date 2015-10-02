From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 12:10:35 +0200
Subject: [Buildroot] [git commit] lpeg: bump to version 1.0.0
Message-ID: <20151002101106.9692081E0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0a15c05ba0647895999ca09de3f28479ac79068
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lpeg/lpeg.hash |    2 +-
 package/lpeg/lpeg.mk   |    2 +-
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
