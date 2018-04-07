From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Apr 2018 18:49:37 +0200
Subject: [Buildroot] [PATCH 1/1] libcap: add license hash
Message-ID: <20180407164937.22964-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap/libcap.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index a1dcd62b3c..2d3aee591d 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,2 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
 sha256	693c8ac51e983ee678205571ef272439d83afe62dd8e424ea14ad9790bc35162  libcap-2.25.tar.xz
+
+# Hash for license file:
+sha256	088cabde4662b4121258d298b0b2967bc1abffa134457ed9bc4a359685ab92bc  License
-- 
2.14.1
