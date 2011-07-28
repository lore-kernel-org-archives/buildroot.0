From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jul 2011 17:58:50 +0200
Subject: [Buildroot] [git commit] e2fsprogs: configure needs pkg-config
Message-ID: <20110728160116.770478B557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c2b730f4471a005981a96e2b1902a2577fcb5a7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/e2fsprogs.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 6381d05..e4ae86a 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -19,6 +19,8 @@ E2FSPROGS_CONF_OPT = \
 	--disable-e2initrd-helper \
 	--disable-testio-debug
 
+E2FSPROGS_DEPENDENCIES = host-pkg-config
+
 E2FSPROGS_MAKE_OPT = \
 	LDCONFIG=true
 
-- 
1.7.3.4
