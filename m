From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2015 23:58:42 +0100
Subject: [Buildroot] [git commit] flashrom: fix typos in patch descriptions
Message-ID: <20151028225904.E42487FF2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6a68408a8f42c94e75494fdf972f61dde186fb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/0001-spi.patch      |    2 +-
 package/flashrom/0002-sys-io.h.patch |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flashrom/0001-spi.patch b/package/flashrom/0001-spi.patch
index d28cb46..22ffcb5 100644
--- a/package/flashrom/0001-spi.patch
+++ b/package/flashrom/0001-spi.patch
@@ -5,7 +5,7 @@ so it must be included before it is used, by SPI_IOC_MESSAGE
 from linux/spi/spidev.h
 
 Fixes build errors with the musl C library, as seen in these
-Buidlroot autobuilder failures:
+Buildroot autobuilder failures:
 
     http://autobuild.buildroot.org/results/2a3/2a3744007c630c267575a638ebcd83a4b97644f5/build-end.log
     http://autobuild.buildroot.org/results/3de/3de936d9be79e151e66af15193084d82a0f2c04a/build-end.log
diff --git a/package/flashrom/0002-sys-io.h.patch b/package/flashrom/0002-sys-io.h.patch
index ddb2b4c..8d990c6 100644
--- a/package/flashrom/0002-sys-io.h.patch
+++ b/package/flashrom/0002-sys-io.h.patch
@@ -5,7 +5,7 @@ However, its inclusion is conditional to the _GLIBC_ define. This is
 usually OK under Linux, since both glibc and uClibc define it (uclibc
 fakes being glibc).
 
-But the mus lC library does not impersonate glibc, so we're missing
+But the musl C library does not impersonate glibc, so we're missing
 including sys/io.h in this case.
 
 Change the include from checking _GLIBC_ to checking whether this is
