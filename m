From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2013 09:27:42 +0200
Subject: [Buildroot] [git commit] libcgroup: depends on host-bison
Message-ID: <20131025073058.20BC69BB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=45ff7712f390843b63e4899a476adfed759fa4a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/73d/73dddcc1aa68999ea496de148497f80bdb02c874

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcgroup/libcgroup.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index c2392e0..339deb3 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -9,7 +9,7 @@ LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
 LIBCGROUP_SITE = http://downloads.sourceforge.net/project/libcg/libcgroup/v.038
 LIBCGROUP_LICENSE = LGPLv2.1
 LIBCGROUP_LICENSE_FILES = COPYING
-
+LIBCGROUP_DEPENDENCIES = host-bison
 LIBCGROUP_INSTALL_STAGING = YES
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
