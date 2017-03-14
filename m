From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Mar 2017 07:23:06 +0100
Subject: [Buildroot] [git commit] ser2net: bump version to 3.4
Message-ID: <20170314062357.E671582586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5faabab594dba8d5b57ad712e55de55929e5386a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ser2net/ser2net.hash | 2 +-
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index ae45e9c..6778235 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 3d1cef5f48df8291e57d4d7d4eac2fc809ae644a5524ffca4aebef0f4e4153dc  ser2net-3.3.tar.gz
+sha256 d846066e27c3072565990745d030357aa0c278f96b7d1d4f59023347c1db8824  ser2net-3.4.tar.gz
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index a786b1a..3d9002a 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 3.3
+SER2NET_VERSION = 3.4
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
