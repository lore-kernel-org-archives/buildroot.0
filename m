From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 23:22:27 +0100
Subject: [Buildroot] [git commit] python-pyusb: bump version
Message-ID: <20141029222440.502E59D319@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8deb76797f61b78a8afe8a6f46801ad81b54f3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyusb/python-pyusb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pyusb/python-pyusb.mk b/package/python-pyusb/python-pyusb.mk
index dee6561..ae69026 100644
--- a/package/python-pyusb/python-pyusb.mk
+++ b/package/python-pyusb/python-pyusb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYUSB_VERSION = 0546cad8980783c39f96db717005a550059b730f
+PYTHON_PYUSB_VERSION = 1.0.0b2
 PYTHON_PYUSB_SITE = $(call github,walac,pyusb,$(PYTHON_PYUSB_VERSION))
 PYTHON_PYUSB_LICENSE = BSD-3c
 PYTHON_PYUSB_LICENSE_FILES = LICENSE
