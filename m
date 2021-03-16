From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 22:34:58 +0100
Subject: [Buildroot] [git commit] package/python-toml: add host variant
Message-ID: <20210316211112.6A62487511@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=052a7272e1303dd0f2daf54d66761af7d5b4f15f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed for the host-python-setuptools-rust package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-toml/python-toml.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-toml/python-toml.mk b/package/python-toml/python-toml.mk
index b4f9070f24..8a61be2f4f 100644
--- a/package/python-toml/python-toml.mk
+++ b/package/python-toml/python-toml.mk
@@ -12,3 +12,4 @@ PYTHON_TOML_LICENSE = MIT
 PYTHON_TOML_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
