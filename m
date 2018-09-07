From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:44 -0000
Subject: [Buildroot] [git commit] e2fsprogs: group disable and enable
 together
Message-ID: <20180907111551.BAF187FCAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9613674df42eb8f124fd38dde6f80409a295a667
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Yann E. Morin, it is more readable when all disable
options are grouped together, and all enable options are grouped
together. Fix this in e2fsprogs.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/e2fsprogs/e2fsprogs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 65f9774afb..fecef118ac 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -26,8 +26,8 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--disable-fuse2fs \
 	--disable-libblkid \
 	--disable-libuuid \
-	--enable-symlink-install \
 	--disable-testio-debug \
+	--enable-symlink-install \
 	--enable-elf-shlibs
 
 # Set the binary directories to "/bin" and "/sbin", as busybox does,
