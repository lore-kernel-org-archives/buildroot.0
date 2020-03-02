From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon,  2 Mar 2020 09:49:14 -0800
Subject: [Buildroot] [PATCH/next 2/3] package/inadyn: bump version to 2.6
In-Reply-To: <20200302174915.6483-1-bluemrp9@gmail.com>
References: <20200302174915.6483-1-bluemrp9@gmail.com>
Message-ID: <20200302174915.6483-2-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://github.com/troglobit/inadyn/releases/tag/v2.6

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/inadyn/inadyn.hash | 9 +++++----
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 2691ba0ef9..52bd6abd38 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,6 @@
-# From https://github.com/troglobit/inadyn/releases/download/v2.5/inadyn-2.5.tar.xz.md5
-md5 8a864d5186e54d24de2d7554fc01b3ec  inadyn-2.5.tar.xz
+# From https://github.com/troglobit/inadyn/releases/download/v2.6/inadyn-2.6.tar.xz.md5
+md5  62ec986b73d24b1b755bf0ed3efe54f2  inadyn-2.6.tar.xz
+
 # Locally computed
-sha256 4a9ad208671f62912428413da0282450b2d2c4da38f3c95c4ac975d048c41fcd  inadyn-2.5.tar.xz
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  9f4198764abbd2798472b349d8867e86b4692c76ee304f1f9c607f67c9b582a4  inadyn-2.6.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 40a12e35cd..b1ebeeb2fe 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.5
+INADYN_VERSION = 2.6
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPL-2.0+
-- 
2.25.1
