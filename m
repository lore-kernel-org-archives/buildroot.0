From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  2 May 2018 21:53:02 +0200
Subject: [Buildroot] [PATCH 1/1] libksba: add hash for license files
Message-ID: <20180502195302.24907-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libksba/libksba.hash | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index f0a38f3de3..8ab7e6efe8 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,2 +1,9 @@
 # Locally calculated after checking pgp signature
 sha256	41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340	libksba-1.3.5.tar.bz2
+
+# Hash for license files:
+sha256	240908e1356ffeb5d0730227b6198dcc8e878375d28632fd813e0ed75b35ccc2	AUTHORS
+sha256	6197b98c6bf69838c624809c509d84333de1bc847155168c0e84527446a27076	COPYING
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING.GPLv2
+sha256	0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf	COPYING.GPLv3
+sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LGPLv3
-- 
2.14.1
