From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Jul 2017 13:47:29 +0200
Subject: [Buildroot] [git commit] util-linux: remove leftover comment
Message-ID: <20170708114430.B5C3B81F67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22dc1c2e555945c9bc8b668cc20c38aa736cd4f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer have automatic derivation of DEPENDENCIES for host
packages, so the comment that we don't want a host-busybox dependency
is no longer valid.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4c2b1f6..99cc77f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -33,7 +33,6 @@ UTIL_LINUX_CONF_OPTS += \
 	--without-systemd \
 	--with-systemdsystemunitdir=no
 
-# We don't want the host-busybox dependency to be added automatically
 HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
