From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Jan 2014 14:40:21 +0100
Subject: [Buildroot] [git commit] tinymembench: bump to version 0.3
Message-ID: <20140114135453.F16939C4C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0209905c36113b127db4178cfb074164e9ba93c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinymembench/tinymembench.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
index 8bb01d5..ab479d6 100644
--- a/package/tinymembench/tinymembench.mk
+++ b/package/tinymembench/tinymembench.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYMEMBENCH_VERSION = v0.2
+TINYMEMBENCH_VERSION = v0.3
 TINYMEMBENCH_SITE = $(call github,ssvb,tinymembench,$(TINYMEMBENCH_VERSION))
 TINYMEMBENCH_LICENSE = MIT
 TINYMEMBENCH_LICENSE_FILES = main.c
