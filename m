From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 22:30:49 +0200
Subject: [Buildroot] [git commit] protobuf: bump to version 2.5.0
Message-ID: <20140507204846.238AA9CB29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf37d83f5c1774faa8b3f1c588356c0d918aee1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf/protobuf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 3538aaa..ceb64df 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_VERSION = 2.4.1
+PROTOBUF_VERSION = 2.5.0
 PROTOBUF_SITE = http://protobuf.googlecode.com/files/
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
