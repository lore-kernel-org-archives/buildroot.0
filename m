From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 21:45:15 +0200
Subject: [Buildroot] [git commit] protobuf: add license information
Message-ID: <20120731194553.4BCE196F91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c457a3321c6fc7de8068903cc7e93f0443d7447
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/protobuf/protobuf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 6e49dd3..5032d70 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -6,6 +6,8 @@
 PROTOBUF_VERSION = 2.4.1
 PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = http://protobuf.googlecode.com/files/
+PROTOBUF_LICENSE = BSD-3c
+PROTOBUF_LICENSE_FILES = COPYING.txt
 
 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
