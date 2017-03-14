From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 23:04:31 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] zmqpp: update license
Message-ID: <20170314232238.66D1582556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14dc993718941fb0d1194fc2eedcab0b5fe33260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Since version 4.1.2, zmqpp is provided under MPLv2.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 87e9391e69cae06836723dcc5525e07d89c14acb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
