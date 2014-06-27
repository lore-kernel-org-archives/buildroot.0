From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jun 2014 08:54:45 +0200
Subject: [Buildroot] [git commit] protobuf-c: update license information
Message-ID: <20140627070642.79A2D9D0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc33ee97c65fc666a4a867f47337f8a1c08b81ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is BSD-2c]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf-c/protobuf-c.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index da0b139..5795598 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -11,7 +11,8 @@ HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
 PROTOBUF_C_MAKE = $(MAKE1)
 PROTOBUF_C_CONF_OPT = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
-PROTOBUF_C_LICENSE = BSD-3c
+PROTOBUF_C_LICENSE = BSD-2c
+PROTOBUF_C_LICENSE_FILES = LICENSE
 PROTOBUF_C_AUTORECONF = YES
 HOST_PROTOBUF_C_AUTORECONF = YES
 
