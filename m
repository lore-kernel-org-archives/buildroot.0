From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 22:34:48 +0100
Subject: [Buildroot] [git commit branch/next] package/udftools: bump to
 version 2.3
Message-ID: <20210301211349.4FF8982DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7953bfa0f72a2971cdd35b93df10f530d0a3794
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update indentation in hash file (two spaces)

https://github.com/pali/udftools/releases/tag/2.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udftools/udftools.hash | 4 ++--
 package/udftools/udftools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/udftools/udftools.hash b/package/udftools/udftools.hash
index 630a3427eb..5b3f10d37d 100644
--- a/package/udftools/udftools.hash
+++ b/package/udftools/udftools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	d67ce203d71d828619d6d3791ab33eefab4bc506e0ee73355ab6c2f91d52448e	udftools-2.2.tar.gz
-sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
+sha256  750dcf5c797765eb42265e0a56d1a99f97f94b7f6f4534263a5410503f0caf59  udftools-2.3.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/udftools/udftools.mk b/package/udftools/udftools.mk
index db7c13cc77..7dc1c57eb2 100644
--- a/package/udftools/udftools.mk
+++ b/package/udftools/udftools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDFTOOLS_VERSION = 2.2
+UDFTOOLS_VERSION = 2.3
 UDFTOOLS_SITE = https://github.com/pali/udftools/releases/download/$(UDFTOOLS_VERSION)
 UDFTOOLS_LICENSE = GPL-2.0+
 UDFTOOLS_LICENSE_FILES = COPYING
