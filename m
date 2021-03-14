From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 14:00:10 +0100
Subject: [Buildroot] [git commit] package/python-rpi-ws281x: set proper
 license
Message-ID: <20210314123646.398648670E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b5d624bb66f29a20c96fcfc85741cdd61154eef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license is BSD-2-Clause, not MIT.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
[yann.morin.1998 at free.fr: split off into its own commit]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-rpi-ws281x/python-rpi-ws281x.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-rpi-ws281x/python-rpi-ws281x.mk b/package/python-rpi-ws281x/python-rpi-ws281x.mk
index 4af1d268af..1da2a77462 100644
--- a/package/python-rpi-ws281x/python-rpi-ws281x.mk
+++ b/package/python-rpi-ws281x/python-rpi-ws281x.mk
@@ -8,7 +8,7 @@ PYTHON_RPI_WS281X_VERSION = 4.2.4
 PYTHON_RPI_WS281X_SOURCE = rpi_ws281x-$(PYTHON_RPI_WS281X_VERSION).tar.gz
 PYTHON_RPI_WS281X_SITE = https://files.pythonhosted.org/packages/3b/99/0f74f2d303e03432d10b11dab240cb15afad1bc6ab9a1449c9bc08af2ee4
 PYTHON_RPI_WS281X_SETUP_TYPE = setuptools
-PYTHON_RPI_WS281X_LICENSE = MIT
+PYTHON_RPI_WS281X_LICENSE = BSD-2-Clause
 PYTHON_RPI_WS281X_LICENSE_FILES = LICENSE lib/LICENSE
 
 $(eval $(python-package))
