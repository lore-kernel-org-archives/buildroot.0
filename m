From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 May 2017 23:18:31 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/cgic: bump version to 2.07
In-Reply-To: <20170523211831.30719-1-bernd.kuhls@t-online.de>
References: <20170523211831.30719-1-bernd.kuhls@t-online.de>
Message-ID: <20170523211831.30719-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/cgic/cgic.hash | 2 +-
 package/cgic/cgic.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cgic/cgic.hash b/package/cgic/cgic.hash
index 6137875b6..fa1d0bc95 100644
--- a/package/cgic/cgic.hash
+++ b/package/cgic/cgic.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9562e0b6af59ebc2090107eab5946ce0788a1de36146ad181970cf53e9be7a33  cgic206.tar.gz
+sha256 1e8834642a4b89528bb7bde2f287e133c6b07e210e68681a34137c436d59d320  cgic207.tar.gz
diff --git a/package/cgic/cgic.mk b/package/cgic/cgic.mk
index f07c62e97..cd0841302 100644
--- a/package/cgic/cgic.mk
+++ b/package/cgic/cgic.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CGIC_VERSION = 2.06
-CGIC_SOURCE = cgic206.tar.gz
+CGIC_VERSION = 2.07
+CGIC_SOURCE = cgic207.tar.gz
 CGIC_SITE = http://boutell.com/cgic
 CGIC_LICENSE = Custom
 CGIC_LICENSE_FILES = license.txt
-- 
2.11.0
