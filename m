From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Dec 2019 21:03:14 +0100
Subject: [Buildroot] [git commit] package/samba4: remove trailing space in
 samba4.mk
Message-ID: <20191223195415.6ABA08E052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0aaea94d6059bf8b2e8210ff304de754a765c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following warning from `make check-package`:
    package/samba4/samba4.mk:34: line contains trailing whitespace

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 955de8f764..c5d2d6c6ea 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -31,7 +31,7 @@ SAMBA4_PYTHON = \
 	PYTHON_CONFIG="$(STAGING_DIR)/usr/bin/python3-config"
 SAMBA4_DEPENDENCIES += host-python3 python3
 else
-SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python2" 
+SAMBA4_PYTHON = PYTHON="$(HOST_DIR)/bin/python2"
 SAMBA4_DEPENDENCIES += host-python
 SAMBA4_CONF_OPTS += --disable-python
 endif
