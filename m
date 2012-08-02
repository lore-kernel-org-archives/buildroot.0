From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:52 -0000
Subject: [Buildroot] [git commit branch/next] libcap: remove redundant
	HOST_LIBCAP_DEPENDENCIES
Message-ID: <20120802195249.B242596EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8db1cb467eda44a9269d2a60ced90b064b5431ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap/libcap.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 4683121..9d6acf2 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -10,7 +10,6 @@ LIBCAP_VERSION = 2.22
 LIBCAP_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libc/libcap2
 LIBCAP_SOURCE = libcap2_$(LIBCAP_VERSION).orig.tar.gz
 LIBCAP_DEPENDENCIES = host-libcap
-HOST_LIBCAP_DEPENDENCIES =
 LIBCAP_INSTALL_STAGING = YES
 
 define LIBCAP_BUILD_CMDS
