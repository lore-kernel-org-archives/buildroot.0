From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 21:18:49 +0200
Subject: [Buildroot] [git commit] gutenprint: disable (doxygen)
	documentation generation
Message-ID: <20130511192253.CAD699A094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2e8bb3580bb9b3b93adae0521eea27861d4c6f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just wastes build time, so disable it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gutenprint/gutenprint.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index a598ea9..b469843 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -23,6 +23,7 @@ GUTENPRINT_DEPENDENCIES += host-gutenprint
 
 GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
                       --disable-samples \
+                      --without-doc \
                       --without-gimp2 \
                       --without-foomatic \
                       --without-foomatic3 \
