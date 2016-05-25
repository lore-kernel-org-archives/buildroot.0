From: Christian Stewart <christian@paral.in>
Date: Tue, 24 May 2016 17:35:01 -0700
Subject: [Buildroot] [PATCH 1/2] package/batctl: bump to 2016.1
In-Reply-To: <1464136502-302-1-git-send-email-christian@paral.in>
References: <1464136502-302-1-git-send-email-christian@paral.in>
Message-ID: <1464136502-302-2-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump batctl to the latest (2016.1) from 2015.1.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/batctl/batctl.hash | 6 +++---
 package/batctl/batctl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
index 1a045f4..5920ff0 100644
--- a/package/batctl/batctl.hash
+++ b/package/batctl/batctl.hash
@@ -1,4 +1,4 @@
-# http://downloads.open-mesh.org/batman/releases/batman-adv-2015.1/batctl-2015.1.tar.gz.sha1
-sha1	ae086f334ff912ab2a8116caedf0a2a1816acf1a	batctl-2015.1.tar.gz
+# http://downloads.open-mesh.org/batman/releases/batman-adv-2016.1/batctl-2016.1.tar.gz.sha1
+sha1 72b974bde707594e2cf0cc122d7d7da0f1f65160 batctl-2016.1.tar.gz
 # Locally calculated
-sha256	ea67ee22785e6fcd5149472bdf2df4e9f21716968e025e7dd41556a010a8d14a	batctl-2015.1.tar.gz
+sha256 c854397b2ddd2cb8d15d1e65839819380648ccb37507d0303e133011fe6f03c9  batctl-2016.1.tar.gz
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
index e91dff9..ed1b06c 100644
--- a/package/batctl/batctl.mk
+++ b/package/batctl/batctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATCTL_VERSION = 2015.1
+BATCTL_VERSION = 2016.1
 BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
 BATCTL_LICENSE = GPLv2
 BATCTL_DEPENDENCIES = libnl host-pkgconf
-- 
2.7.3
