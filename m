From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:11 -0000
Subject: [Buildroot] [git commit branch/next] harfbuzz: update why we are
	using autoreconf
Message-ID: <20150808105641.124567FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5cb8201023e194000f2b631053f85e80dba5551a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Following the addition of a patch touching Makefile.am, let's update
the comment explaining why we use <pkg>_AUTORECONF = YES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/harfbuzz/harfbuzz.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 0adfb53..001405f 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -25,7 +25,7 @@ HOST_HARFBUZZ_CONF_OPTS = \
 	--with-freetype=yes \
 	--with-glib=yes
 
-# beta libtool version
+# beta libtool version and patching Makefile.am
 HARFBUZZ_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
