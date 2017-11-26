From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 09:18:37 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] apr: bump version to 1.6.2
Message-ID: <20171126184721.7AA878110A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f0eeb2dddf7d92695c859c04a26a336e2d36faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d56868011b521df802cd171b4f39e56120585396)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apr/apr.hash | 4 ++--
 package/apr/apr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/apr/apr.hash b/package/apr/apr.hash
index 917ce56..7a5969e 100644
--- a/package/apr/apr.hash
+++ b/package/apr/apr.hash
@@ -1,2 +1,2 @@
-# From http://archive.apache.org/dist/apr/apr-1.5.2.tar.bz2.sha1
-sha1 6d757fcf7c687fc300c1066076f2e8380ff8cbc0  apr-1.5.2.tar.bz2
+# From http://archive.apache.org/dist/apr/apr-1.6.2.tar.bz2.sha1
+sha1 01b0d4faa0194825e8e525b9ac7ccfb832471d50  apr-1.6.2.tar.bz2
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 4a97f7e..ffb3099 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-APR_VERSION = 1.5.2
+APR_VERSION = 1.6.2
 APR_SOURCE = apr-$(APR_VERSION).tar.bz2
 APR_SITE = http://archive.apache.org/dist/apr
 APR_LICENSE = Apache-2.0
