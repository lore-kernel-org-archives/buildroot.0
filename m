From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 22:24:17 +0100
Subject: [Buildroot] [git commit] protobuf: fix legal-info
Message-ID: <20151104212427.7AAA481E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f700463c66376283ab4bffc391209bf20c63088d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The file changed from COPYING.txt to LICENSE, fixes:
http://autobuild.buildroot.net/results/c40/c40e9b6030584a4fd8b3e46f78f6d0702d1dc11e/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/protobuf/protobuf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 144e5fb..3eeadfc 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 PROTOBUF_VERSION = v2.6.1
 PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 PROTOBUF_LICENSE = BSD-3c
-PROTOBUF_LICENSE_FILES = COPYING.txt
+PROTOBUF_LICENSE_FILES = LICENSE
 # no configure script
 PROTOBUF_AUTORECONF = YES
 
