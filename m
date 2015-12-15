From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:02:24 +0100
Subject: [Buildroot] [git commit] omniorb: comma separate licenses
Message-ID: <20151215210843.E470E80409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f42f50e50780b115a16e83d524b4a169dd1be021
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omniorb/omniorb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index bf5ba47..aaf3bf3 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -8,7 +8,7 @@ OMNIORB_VERSION = 4.2.0
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
-OMNIORB_LICENSE = GPL2+ LGPLv2.1+
+OMNIORB_LICENSE = GPL2+, LGPLv2.1+
 OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
 OMNIORB_DEPENDENCIES = host-omniorb
 HOST_OMNIORB_DEPENDENCIES = host-python
