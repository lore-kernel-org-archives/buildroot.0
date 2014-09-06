From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Sep 2014 22:08:04 +0200
Subject: [Buildroot] [git commit] jq: bump to version 1.4
Message-ID: <20140906202004.3E8619D61A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea73983591043b0e86b0a169af2eaae6c67789fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 1.4.  Addtionally, released tarballs no longer
require flex or bison to build.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jq/jq.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index cc7c99e..6a9dfc8 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-JQ_VERSION = 1.3
+JQ_VERSION = 1.4
 JQ_SITE = http://stedolan.github.io/jq/download/source
-JQ_DEPENDENCIES = host-flex host-bison
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
 
