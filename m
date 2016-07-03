From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:24:02 +0200
Subject: [Buildroot] [git commit] gawk: remove empty host dependencies
	definition
Message-ID: <20160703082409.737B6800F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf71879accf20ddb151d9ee3f4f9d092854d2235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gawk/gawk.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index da9be95..b5b0f8d 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -36,9 +36,6 @@ else
 GAWK_CONF_OPTS += --without-readline
 endif
 
-# We don't have a host-busybox, and we don't want to use readline or mpfr
-HOST_GAWK_DEPENDENCIES =
-
 HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
 
 define GAWK_CREATE_SYMLINK
