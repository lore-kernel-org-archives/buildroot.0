From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 18:54:05 +0200
Subject: [Buildroot] [git commit] package/zmqpp: fix legal-info
Message-ID: <20150405171514.6008E7F8D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f82eda71ad29f5ef824a6fdfaaffb6242e8738f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license is in fact MIT.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zmqpp/zmqpp.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 7efd04b..03c6475 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -8,8 +8,8 @@ ZMQPP_VERSION = 3.2.0
 ZMQPP_SITE = $(call github,zeromq,zmqpp,$(ZMQPP_VERSION))
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
-ZMQPP_LICENSE = LGPLv3+ with exceptions
-ZMQPP_LICENSE_FILES = COPYING COPYING.LESSER
+ZMQPP_LICENSE = MIT
+ZMQPP_LICENSE_FILES = LICENSE
 
 ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
