From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Oct 2015 22:53:19 +0200
Subject: [Buildroot] [git commit] util-linux: fix last minute typo in the
	systemd handling
Message-ID: <20151022205409.BDF0B81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a77dfaa9848e1241b8bbf34eae41280d8d2935ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 39ba544..7b68c33 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -29,7 +29,7 @@ UTIL_LINUX_CONF_OPTS += \
 # system depends on util-linux so we enable systemd support
 # (which needs systemd to be installed)
 UTIL_LINUX_CONF_OPTS += \
-	--without-systed \
+	--without-systemd \
 	--with-systemdsystemunitdir=no
 
 # We don't want the host-busybox dependency to be added automatically
