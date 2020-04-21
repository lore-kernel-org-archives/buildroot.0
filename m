From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 14:07:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbuffer: add hash for license file
Message-ID: <20200421120738.3322692-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file and update indentation (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbuffer/mbuffer.hash | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/mbuffer/mbuffer.hash b/package/mbuffer/mbuffer.hash
index 80b7b1f26c..105fe29fe7 100644
--- a/package/mbuffer/mbuffer.hash
+++ b/package/mbuffer/mbuffer.hash
@@ -1,5 +1,8 @@
 # From http://www.maier-komor.de/mbuffer.html
-md5 e4acaa1e6a9a879e7394f04e02e1ae83  mbuffer-20191016.tgz
+md5  e4acaa1e6a9a879e7394f04e02e1ae83  mbuffer-20191016.tgz
 
 # Locally computed after checking signature upstream
-sha256 8dc210454765c18901074bc16e126c655135a486e73d69855caf74a157ddbe17  mbuffer-20191016.tgz
+sha256  8dc210454765c18901074bc16e126c655135a486e73d69855caf74a157ddbe17  mbuffer-20191016.tgz
+
+# Hash for license file
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
-- 
2.25.1
