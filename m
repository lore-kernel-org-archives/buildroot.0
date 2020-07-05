From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:26:14 +0200
Subject: [Buildroot] [git commit] package/execline: bump version to 2.6.1.0
Message-ID: <20200705135158.1D26D861A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58fa2386562fb353c19dfb07f8990d7a7b4b3ed5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also change the hash file to separate the fields by two spaces and
change the hash of the license (copyright year changed from 2019 to
2020).

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/execline/execline.hash | 4 ++--
 package/execline/execline.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index cef4959bda..ac6239e86d 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 05205c6869ae65a51c63d0e805572573806f6474aa21e12c49dd5654d3ceed33  execline-2.5.3.0.tar.gz
-sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
+sha256  a24c76f097ff44fe50b63b89bcde5d6ba9a481aecddbe88ee01b0e5a7b314556  execline-2.6.1.0.tar.gz
+sha256  5443ac67e8d74ac614ced7bc64211ce90ccedb7778a68bfe9e68a8b234c9503e  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 74ad91e4a8..e2423e9536 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.5.3.0
+EXECLINE_VERSION = 2.6.1.0
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
