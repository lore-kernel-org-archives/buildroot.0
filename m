From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Sat, 1 Jul 2017 20:00:27 +0200
Subject: [Buildroot] [PATCH 1/1] utils/readme.txt: fix typos for
	size-stats-compare
Message-ID: <20170701180027.GY29444@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A few typos sneaked into the new utils readme...

Additionally, I formulated the list of use cases a bit differently.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 utils/readme.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/readme.txt b/utils/readme.txt
index a90805fb0..fd20e8ee6 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -28,10 +28,10 @@ scanpypi
     a script to create a Buildroot package by scanning a PyPI package
     description.
 
-size-stat-compare
-    a script to compare the rootfs size between two differnt Buildroot
+size-stats-compare
+    a script to compare the rootfs size between two different Buildroot
     configurations. This can be used to identify the size impact of
-    a specific option, or of a set of specific options, or an update
+    a specific option, of a set of specific options, or of an update
     to a newer Buildroot version...
 
 test-pkg
-- 
2.13.0
