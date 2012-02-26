From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Feb 2012 20:52:26 +0100
Subject: [Buildroot] [git commit] customize: deprecate package
Message-ID: <20120226202430.3E2BE90B2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a19eea3ec5e4fe9324033958132b93c179d8349
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described in the buildroot dev day report, using a post-build script
is nowadays the preferred way of adding stuff to the rootfs.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/customize/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/customize/Config.in b/package/customize/Config.in
index 97f8646..8f8aaa2 100644
--- a/package/customize/Config.in
+++ b/package/customize/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CUSTOMIZE
 	bool "customize"
+	depends on BR2_DEPRECATED
 	help
 	  Add custom stuff to your buildroot.
 
