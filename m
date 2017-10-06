From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Oct 2017 18:43:16 +0200
Subject: [Buildroot] [git commit] mosh: bump to version 1.3.2
Message-ID: <20171006163929.162D380F47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e897285bfa7b06de1e63a35bcd66711a3f6b082
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add hashes for the license files while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mosh/mosh.hash | 7 +++++--
 package/mosh/mosh.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
index 4dae51d..baffe1f 100644
--- a/package/mosh/mosh.hash
+++ b/package/mosh/mosh.hash
@@ -1,2 +1,5 @@
-# From https://mailman.mit.edu/pipermail/mosh-users/2017-March/000340.html
-sha256 320e12f461e55d71566597976bd9440ba6c5265fa68fbf614c6f1c8401f93376 mosh-1.3.0.tar.gz
+# From https://mailman.mit.edu/pipermail/mosh-users/2017-July/000357.html
+sha256 da600573dfa827d88ce114e0fed30210689381bbdcff543c931e4d6a2e851216 mosh-1.3.2.tar.gz
+# Locally calculcated
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256 8042495ddc8d99b883335d53552554eccf825fc1f0ba487d0f8e6656baaa8199  COPYING.iOS
diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
index 06502f6..fa6ab17 100644
--- a/package/mosh/mosh.mk
+++ b/package/mosh/mosh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSH_VERSION = 1.3.0
+MOSH_VERSION = 1.3.2
 MOSH_SITE = https://mosh.org
 MOSH_DEPENDENCIES = zlib ncurses protobuf host-pkgconf
 MOSH_LICENSE = GPL-3.0+ with exception
