From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 23:06:27 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/mutt: bump
 version to 1.14.6
Message-ID: <20201224083312.3178B8889B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1ac38480afa3bfc52dba6a6a7a797100c2d2ee5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b9f31a32ecfd4daabf50df7088de12028fe4afb9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 972d1433df..e3007370a4 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ca8e56f8210b4fffa91ea08958b62b811cce552fe4fd7d726111cf53079ed3c3  mutt-1.14.4.tar.gz
+sha256  47972a0152b81b9f67ff322a0a6682b914c15545bfdeac6bcc2f2c0bf9361844  mutt-1.14.6.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index b8a116aab0..6c85202fc0 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.14.4
+MUTT_VERSION = 1.14.6
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
