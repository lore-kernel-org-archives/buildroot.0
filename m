From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  9 Sep 2017 12:34:15 +0200
Subject: [Buildroot] [PATCH 3/9] s6: bump version to 2.6.1.0
In-Reply-To: <20170909103421.30675-1-eric.le.bihan.dev@free.fr>
References: <20170909103421.30675-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170909103421.30675-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6/s6.hash | 2 +-
 package/s6/s6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 1d35c4e94d..41f3dff0c4 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 146dd54086063c6ffb6f554c3e92b8b12a24165fdfab24839de811f79dcf9a40  s6-2.6.0.0.tar.gz
+sha256 f0de303791134302f2630b9fe76a936b064e1e3aa772c8ae1b891155a6ea2c79  s6-2.6.1.0.tar.gz
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 4daf1e7ecd..da9917cb8c 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.6.0.0
+S6_VERSION = 2.6.1.0
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
-- 
2.13.5
