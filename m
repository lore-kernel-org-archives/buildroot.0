From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Apr 2015 18:48:24 +0200
Subject: [Buildroot] [PATCH 3/6] package/zmqpp: fix legal-info
In-Reply-To: <cover.1428252467.git.yann.morin.1998@free.fr>
References: <cover.1428252467.git.yann.morin.1998@free.fr>
Message-ID: <5ebf9db9a00075be809a376ee19e0828d3c4245a.1428252467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license is in fact MIT.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/zmqpp/zmqpp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.9.1
