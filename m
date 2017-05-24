From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 May 2017 15:59:44 +0200
Subject: [Buildroot] [git commit branch/next] package/cgic: bump version to
	2.07
Message-ID: <20170524135953.70EA380842@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46ff1eda54e6ba52073a5bfc2b9d9c1ac3bd51d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cgic/cgic.hash | 2 +-
 package/cgic/cgic.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cgic/cgic.hash b/package/cgic/cgic.hash
index 6137875..fa1d0bc 100644
--- a/package/cgic/cgic.hash
+++ b/package/cgic/cgic.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  9562e0b6af59ebc2090107eab5946ce0788a1de36146ad181970cf53e9be7a33  cgic206.tar.gz
+sha256 1e8834642a4b89528bb7bde2f287e133c6b07e210e68681a34137c436d59d320  cgic207.tar.gz
diff --git a/package/cgic/cgic.mk b/package/cgic/cgic.mk
index f07c62e..cd08413 100644
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
