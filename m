From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:41:02 +0200
Subject: [Buildroot] [git commit] yajl: add license information
Message-ID: <20120821110312.2E16997206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d753161efb85e6c8f2f179656a24959e22a6a16a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/yajl/yajl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 6c4278e..9cebeb7 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -7,5 +7,7 @@
 YAJL_VERSION = 2.0.4
 YAJL_SITE = git://github.com/lloyd/yajl.git
 YAJL_INSTALL_STAGING = YES
+YAJL_LICENSE = ISC
+YAJL_LICENSE_FILES = COPYING
 
 $(eval $(cmake-package))
