From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 18:02:25 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/python-rpi-ws281x: set proper license
Message-ID: <20210320164027.4F6038379D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=074b76495a9217096d86e42fd9d414fd72c993b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The license is BSD-2-Clause, not MIT.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[yann.morin.1998 at free.fr: split off into its own commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7b5d624bb66f29a20c96fcfc85741cdd61154eef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-rpi-ws281x/python-rpi-ws281x.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index 899ad3d1e3..0852f30772 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -8,7 +8,7 @@ PYTHON_RPI_WS281X_VERSION = 4.2.3
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
 PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/03/6c/46fad1bace9d5917190fd76e1550ec6727010cff6d3e5818b8c3a5405ba3
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
-PYTHON_RPI_WS281X_LICENSE = MIT
+PYTHON_RPI_WS281X_LICENSE = BSD-2-Clause
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
 
 $(eval $(python-package))
