From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 14 Jul 2012 22:32:02 +0200
Subject: [Buildroot] [PATCH 4/6] libcap: remove redundant
	HOST_LIBCAP_DEPENDENCIES
In-Reply-To: <1342297879-9881-1-git-send-email-arnout@mind.be>
References: <1342297879-9881-1-git-send-email-arnout@mind.be>
Message-ID: <1342297922-11306-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/libcap/libcap.mk |    1 -
 1 file changed, 1 deletion(-)

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
-- 
tg: (a19af6a..) t/host-no-circular-dep-4-libcap (depends on: t/host-no-circular-dep-3-icu)
