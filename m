From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Aug 2012 21:46:12 +0200
Subject: [Buildroot] [git commit] nanocom: add license information
Message-ID: <20120802194713.B243096B71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71fd5f5b28ea889ccd9b371627c0c37aef214e92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/nanocom/nanocom.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index 1e46100..a88daeb 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -6,6 +6,8 @@
 NANOCOM_VERSION = 2.6.1
 NANOCOM_SOURCE = nanocom.tar.gz
 NANOCOM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/nanocom/nanocom/v1.0
+NANOCOM_LICENSE = GPLv2+
+NANOCOM_LICENSE_FILES = COPYING
 
 # N.B. Don't strip any path components during extraction.
 define NANOCOM_EXTRACT_CMDS
