From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:17:24 +0200
Subject: [Buildroot] [git commit] package/jitterentropy-library: drop
 consecutive empty lines
Message-ID: <20191025181206.A518388102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d8615d383be43900c1f671b6bcd819bdfb9da25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/jitterentropy-library/jitterentropy-library.mk:24: consecutive empty lines

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jitterentropy-library/jitterentropy-library.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 70af24e5db..75c770f538 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -21,7 +21,6 @@ JITTERENTROPY_LIBRARY_BUILD_TARGETS += jitterentropy
 JITTERENTROPY_LIBRARY_INSTALL_TARGETS += install-shared
 endif
 
-
 define JITTERENTROPY_LIBRARY_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 		$(JITTERENTROPY_LIBRARY_BUILD_TARGETS)
