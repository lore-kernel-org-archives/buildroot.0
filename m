From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2015 20:06:33 +0100
Subject: [Buildroot] [git commit] libv4l: bump version to 1.8.1
Message-ID: <20151029190717.A7AB47FD31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cadddd0a85abdad5de799359f4ff9849d4731f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libv4l/libv4l.hash |    2 +-
 package/libv4l/libv4l.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index 1395eda..d79ccbc 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 50c7be033636d878e902dad0a207fc9f6d831bec27f1b410f1102acddaa5565e  v4l-utils-1.8.0.tar.bz2
+sha256 2f6219b03f19ea07c100e860238d5cdbfcbcfe440a14477e75137cc073431b33  v4l-utils-1.8.1.tar.bz2
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 89d1d00..ceb1666 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.8.0
+LIBV4L_VERSION = 1.8.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
