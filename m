From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 08:04:46 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/jq: bump version
 to a17dd32
Message-ID: <20200721064041.9344F7FBE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6302d13742ce177981f916c014faec29cbfa4c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Bump jq package to latest to fix seg fault errors reported at
https://github.com/stedolan/jq/issues/2003

Signed-off-by: Lyle Franklin <lylejfranklin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c94794175fab58823fde539eac83ec0234768f36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jq/jq.hash | 2 +-
 package/jq/jq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jq/jq.hash b/package/jq/jq.hash
index 2cddda32c6..e9f15afa78 100644
--- a/package/jq/jq.hash
+++ b/package/jq/jq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3002cf80d871728562989b4a47d90a7301fe049a4e1d69836b99108f198dac06  jq-a97638713ad30653d424f136018098c4b0e5c71b.tar.gz
+sha256  20249104d4df2247253df6df4a980b8be1f5232f03fef7cd41bacb7e6eab04fd  jq-a17dd3248a666d01be75f6b16be37e80e20b0954.tar.gz
 sha256  111136aebcbfa68b6b0084e582b30e981da76adcff84eab6f9be32a1f38c5bf1  COPYING
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index 3d22306537..297a608b12 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQ_VERSION = a97638713ad30653d424f136018098c4b0e5c71b
+JQ_VERSION = a17dd3248a666d01be75f6b16be37e80e20b0954
 JQ_SITE = $(call github,stedolan,jq,$(JQ_VERSION))
 JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
 JQ_LICENSE_FILES = COPYING
