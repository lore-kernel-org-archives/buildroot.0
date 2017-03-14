From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 21:58:17 +0100
Subject: [Buildroot] [git commit] zmqpp: update license
Message-ID: <20170314205826.896988222D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87e9391e69cae06836723dcc5525e07d89c14acb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 4.1.2, zmqpp is provided under MPLv2.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zmqpp/zmqpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 18da709..3e35fd7 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -8,7 +8,7 @@ ZMQPP_VERSION = 4.1.2
 ZMQPP_SITE = $(call github,zeromq,zmqpp,$(ZMQPP_VERSION))
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
-ZMQPP_LICENSE = MIT
+ZMQPP_LICENSE = MPLv2.0
 ZMQPP_LICENSE_FILES = LICENSE
 ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
