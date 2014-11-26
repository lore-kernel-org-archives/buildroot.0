From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 21:51:41 +0100
Subject: [Buildroot] [git commit] libunistring: host-libunistring is needed
	by guile
Message-ID: <20141201104838.8EED180000@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=319e7ffbe8fa4a1ff7733c40ff87123bbc495f82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libunistring/libunistring.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index 3234ddc..fd77d12 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -17,3 +17,4 @@ LIBUNISTRING_CONF_OPTS += --disable-threads
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
