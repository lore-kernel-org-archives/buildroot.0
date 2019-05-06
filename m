From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 May 2019 11:57:54 +0200
Subject: [Buildroot] [git commit] package/coreutils: install base64 under
 /bin iso /usr/bin to match busybox
Message-ID: <20190506100539.69ECC814AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=873fa4f01fa7cdd61450f46c4f51ddcec258b230
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #11816

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coreutils/coreutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 3e8efbf047..8e5518f638 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -55,7 +55,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	MAKEINFO=true \
 	INSTALL_PROGRAM=$(INSTALL)
 
-COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false \
+COREUTILS_BIN_PROGS = base64 cat chgrp chmod chown cp date dd df dir echo false \
 	kill link ln ls mkdir mknod mktemp mv nice printenv pwd rm rmdir \
 	vdir sleep stty sync touch true uname join
 
