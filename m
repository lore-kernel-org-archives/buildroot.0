From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:00:19 +0200
Subject: [Buildroot] [git commit] protobuf: add a comment about
	python-protobuf
Message-ID: <20161022140052.554BC819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d10d5b08261485b09a848609ec36720fae8055d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/protobuf/protobuf.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index b4a1947..dabbfb7 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -4,6 +4,9 @@
 #
 ################################################################################
 
+# When bumping this package, make sure to also verify if the
+# python-protobuf package still works, as they share the same
+# version/site variables.
 PROTOBUF_VERSION = v3.0.0
 PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 PROTOBUF_LICENSE = BSD-3c
