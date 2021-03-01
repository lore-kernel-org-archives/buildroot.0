From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Mar 2021 23:56:06 +0100
Subject: [Buildroot] [git commit] package/librelp: bump to version 1.10.0
Message-ID: <20210308072137.0DFA381607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e07dc4ed2ccd791c607fa2fae3547b45227cc54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/librelp/librelp.hash | 2 +-
 package/librelp/librelp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/librelp/librelp.hash b/package/librelp/librelp.hash
index 88665bcf2a..23ce8c15f8 100644
--- a/package/librelp/librelp.hash
+++ b/package/librelp/librelp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  24ee9e843960d1400a44ffaedb0b1ec91463df8f8acca869cc027ed25ee6bf33  librelp-1.9.0.tar.gz
+sha256  148db4e4d1a23e8136e9ec08810929a55faf5d45e24c2e3186d5ab34355dab31  librelp-1.10.0.tar.gz
 sha256  1ed76f935566e93e3c3c0d9f8fad22eb6d8bbe406e2eb8470a4a2764d9fd9685  COPYING
diff --git a/package/librelp/librelp.mk b/package/librelp/librelp.mk
index 2b8a53e833..0b2f5a20c9 100644
--- a/package/librelp/librelp.mk
+++ b/package/librelp/librelp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRELP_VERSION = 1.9.0
+LIBRELP_VERSION = 1.10.0
 LIBRELP_SITE = http://download.rsyslog.com/librelp
 LIBRELP_LICENSE = GPL-3.0+
 LIBRELP_LICENSE_FILES = COPYING
