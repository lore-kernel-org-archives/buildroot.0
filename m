From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 17:48:22 +0200
Subject: [Buildroot] [git commit] package/x264: bump version
Message-ID: <20171022154106.5CE0681189@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc61f5571c7e89ceda2a8302aa4f4e116a4e8a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index ebc1585..f0e9f1b 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 aefebcf4fa547c6a26e1311b5701e6b94030bae23eb9d14df1211dd5bcb7d4d5  x264-df79067c0cf33da712d344b5f8869be7eaf326f3.tar.gz
+sha256 986863122b0b3ac2c1fa27c6e3932c3490b84287335fa162bca020aa815aa695  x264-ba24899b0bf23345921da022f7a51e0c57dbe73d.tar.gz
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index db9cc1c..e14077a 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = df79067c0cf33da712d344b5f8869be7eaf326f3
+X264_VERSION = ba24899b0bf23345921da022f7a51e0c57dbe73d
 X264_SITE = git://git.videolan.org/x264.git
 X264_LICENSE = GPL-2.0+
 X264_DEPENDENCIES = host-pkgconf
