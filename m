From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Dec 2015 17:53:32 +0100
Subject: [Buildroot] [git commit] expedite: use a tar.bz2 tarball to save
	bandwitdh and disk space
Message-ID: <20151214165403.29E6D81952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3490e53eb9404750f338a1382e857eb52c34324d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/expedite/expedite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 9b232f8..27b4c44 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 EXPEDITE_VERSION = 1.7.10
+EXPEDITE_SOURCE = expedite-$(EXPEDITE_VERSION).tar.bz2
 EXPEDITE_SITE = http://download.enlightenment.org/releases
 EXPEDITE_LICENSE = BSD-2c
 EXPEDITE_LICENSE_FILES = COPYING
