From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:49:44 +0100
Subject: [Buildroot] [git commit] package/dt: remove 'v' prefix
Message-ID: <20191027104325.B345588FC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd86b2943e5ba8b536152a6eb7ad1319c2d776b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes version parsing for release-monitoring.org support.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dt/dt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dt/dt.mk b/package/dt/dt.mk
index 8ec7788883..1963a7ecc5 100644
--- a/package/dt/dt.mk
+++ b/package/dt/dt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DT_VERSION = v18.32
+DT_VERSION = 18.32
 DT_SITE = http://pkgs.fedoraproject.org/repo/pkgs/dt/$(DT_SOURCE)/3054aeaaba047a1dbe90c2132a382ee2
-DT_SOURCE = dt-source-$(DT_VERSION).tar.gz
+DT_SOURCE = dt-source-v$(DT_VERSION).tar.gz
 DT_STRIP_COMPONENTS = 2
 DT_LICENSE = ISC-like
 DT_LICENSE_FILES = LICENSE
