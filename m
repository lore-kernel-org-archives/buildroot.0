From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:42 -0000
Subject: [Buildroot] [git commit] package/4th: bump to version 3.62.5
Message-ID: <20190903133620.D1C538A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82dfe1a2f00763e7e4687dadfbca600df96acf62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/4th/4th.hash | 2 +-
 package/4th/4th.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.hash b/package/4th/4th.hash
index 97083da8f6..6e0eff16ad 100644
--- a/package/4th/4th.hash
+++ b/package/4th/4th.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  1c7adbb1a56dad4c4c781e6e023d77ac862842560c05246b691d07e9a4460ab2  4th-3.62.4-unix.tar.gz
+sha256  f822f7dd8cfb0b1744a62d653c6efe933578ae1789ec60a088509a38bca4b4fc  4th-3.62.5-unix.tar.gz
diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index f272e02808..aee59c463f 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-4TH_VERSION = 3.62.4
+4TH_VERSION = 3.62.5
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
 4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
 4TH_LICENSE = GPL-3.0+, LGPL-3.0+
