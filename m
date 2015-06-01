From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2015 23:56:17 +0200
Subject: [Buildroot] [git commit] tcpdump: bump to version 4.7.4
Message-ID: <20150601220249.7EF8681D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76fae54638ccabe6ac4dfba4a548c243ac948e7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpdump/tcpdump.hash |    2 +-
 package/tcpdump/tcpdump.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 36e1c3b..5943347 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	1f87fb652ce996d41e7a06c601bc6ea29b13fee922945b23770c29490f1d8ace	tcpdump-4.7.3.tar.gz
+sha256	6be520269a89036f99c0b2126713a60965953eab921002b07608ccfc0c47d9af	tcpdump-4.7.4.tar.gz
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 71b844a..6a88305 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.7.3
+TCPDUMP_VERSION = 4.7.4
 TCPDUMP_SITE = http://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3c
 TCPDUMP_LICENSE_FILES = LICENSE
