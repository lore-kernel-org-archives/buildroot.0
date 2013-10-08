From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Oct 2013 16:58:54 +0200
Subject: [Buildroot] [git commit] fmtools: add license information
Message-ID: <20131008150944.2FC309B98C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7da96859fc82f9b685669390f0717c4479bcb95a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fmtools/fmtools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fmtools/fmtools.mk b/package/fmtools/fmtools.mk
index 407b702..5f305b9 100644
--- a/package/fmtools/fmtools.mk
+++ b/package/fmtools/fmtools.mk
@@ -6,6 +6,8 @@
 
 FMTOOLS_VERSION = 1.0.2
 FMTOOLS_SITE = http://www.stanford.edu/~blp/fmtools/
+FMTOOLS_LICENSE = GPLv2+
+FMTOOLS_LICENSE_FILES = COPYING
 
 define FMTOOLS_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
