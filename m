From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 13:22:27 +0100
Subject: [Buildroot] [git commit] lzo: adjust libtool comment
Message-ID: <20141221122244.3357B80427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=056e558fef591d4f4e56186a285c6abd00186256
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzo/lzo.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 9f0729a..a94b5f5 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -9,7 +9,7 @@ LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
 LZO_LICENSE = GPLv2+
 LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
-# Our libtool patch does not apply to bundled ltmain.sh since it's too new.
+# Ships a beta libtool version hence our patch doesn't apply.
 # Run autoreconf to regenerate ltmain.sh.
 LZO_AUTORECONF = YES
 
