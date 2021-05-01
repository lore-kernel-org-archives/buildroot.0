From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 16:47:02 +0200
Subject: [Buildroot] [git commit] package/s6-rc: bump to version 0.5.2.2
Message-ID: <20210501144021.29240868FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dac412acfd41add9aa67059fa0cfb12fb7605a97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change hash file indentation to 2 spaces.

https://www.mail-archive.com/skaware at list.skarnet.org/msg01579.html

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/s6-rc/s6-rc.hash | 4 ++--
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index 3648bec20a..8978d68ba6 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 2842fa55e2bddb65573d78d2c475c4a2f2b26b9258a18b457f8a0342e2fafa0a  s6-rc-0.5.2.1.tar.gz
-sha256 4a5e44a69d649f0c37b29d7f6e5df1bb292b09898247be07f0c97814dac4b15d  COPYING
+sha256  2a8d1cd455c05c8502b34517cfe79841aa46d08ad969076b37a15d3910617f89  s6-rc-0.5.2.2.tar.gz
+sha256  4a5e44a69d649f0c37b29d7f6e5df1bb292b09898247be07f0c97814dac4b15d  COPYING
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 4e0ef57d7a..f85c8ac5e4 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.5.2.1
+S6_RC_VERSION = 0.5.2.2
 S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
