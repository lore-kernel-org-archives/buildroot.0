From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 27 Oct 2016 11:44:23 +0100
Subject: [Buildroot] [PATCH] ser2net: bump version to 3.0
Message-ID: <20161027104423.27760-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ser2net/ser2net.hash | 2 +-
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index a02a981..3e62f1c 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  cee4ad8fb3531281e8761751694dfab39d681022b2363b1edeba764d397c3c99  ser2net-2.10.1.tar.gz
+sha256 e8aaf6c629c78bbc424e8a6810758061f9c68a4ffea0faf7c5031de26ce1c3e1  ser2net-3.0.tar.gz
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 85b23ae..01aee95 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 2.10.1
+SER2NET_VERSION = 3.0
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.10.1
