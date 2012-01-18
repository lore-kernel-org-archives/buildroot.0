From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:55 +0100
Subject: [Buildroot] [git commit] libcap: unbreak host build after
	auto-host-deps change
Message-ID: <20120118150408.0BB7A90385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24c0ee47f0fe00483c89f74c87e5a53e7dae89f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcap/libcap.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 9d6acf2..4683121 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -10,6 +10,7 @@ LIBCAP_VERSION = 2.22
 LIBCAP_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libc/libcap2
 LIBCAP_SOURCE = libcap2_$(LIBCAP_VERSION).orig.tar.gz
 LIBCAP_DEPENDENCIES = host-libcap
+HOST_LIBCAP_DEPENDENCIES =
 LIBCAP_INSTALL_STAGING = YES
 
 define LIBCAP_BUILD_CMDS
