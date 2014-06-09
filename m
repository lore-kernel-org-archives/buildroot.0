From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:51:44 +0200
Subject: [Buildroot] [git commit] cloog: fix license details
Message-ID: <20140609095206.057E79CF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ed9a57180a12dd13f207b104c5c928b221efd70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License is in fact LGPLv2.1+, and there is no LICENSE file around.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cloog/cloog.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
index eb2aa10..1e2e88c 100644
--- a/package/cloog/cloog.mk
+++ b/package/cloog/cloog.mk
@@ -7,8 +7,7 @@
 CLOOG_VERSION = 0.18.2
 CLOOG_SITE = http://www.bastoul.net/cloog/pages/download/
 CLOOG_INSTALL_STAGING = YES
-CLOOG_LICENSE = LGPLv2.1
-CLOOG_LICENSE_FILES = LICENSE
+CLOOG_LICENSE = LGPLv2.1+
 CLOOG_DEPENDENCIES = gmp isl
 # Our libtool patch doesn't apply, and since this package is only
 # built for the host, we don't really care about it.
