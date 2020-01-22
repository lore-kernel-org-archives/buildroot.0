From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2020 20:32:45 +0100
Subject: [Buildroot] [git commit] package/libnftnl: bump version to 1.1.5
Message-ID: <20200122194111.EEEDD836E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b084bea37fbc5ee26165bb6d61564afadb96c05a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnftnl/libnftnl.hash | 2 +-
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index 315e2e1522..4d2eb0ef08 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256	c8c7988347adf261efac5bba59f8e5f995ffb65f247a88cc144e69620573ed20	libnftnl-1.1.4.tar.bz2
+sha256	66de4d05227c0a1a731c369b193010d18a05b1185c2735211e0ecf658eeb14f3	libnftnl-1.1.5.tar.bz2
 sha256	98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24	COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index a4e9b4b940..ac780bd8d3 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.1.4
+LIBNFTNL_VERSION = 1.1.5
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
