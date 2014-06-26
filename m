From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 13:51:34 +0200
Subject: [Buildroot] [git commit] musl: bump to version 1.1.3
Message-ID: <20140626115219.6276D9CF05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=911f5d6abe70c893ba375edf88627dc973d3265f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/musl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 7b59377..2278799 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.2
+MUSL_VERSION = 1.1.3
 MUSL_SITE = http://www.musl-libc.org/releases/
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
