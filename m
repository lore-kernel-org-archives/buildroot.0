From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 21:40:12 +0200
Subject: [Buildroot] [git commit] package/python-remi: Bump version to
 2021.3.2
Message-ID: <20210629190820.970FF8E509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4684efabbc7ffab04d14d0db94e24e56ab054cd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-remi/python-remi.hash | 2 +-
 package/python-remi/python-remi.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index 832bf915ab..4e1786a952 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,2 +1,2 @@
 # sha256 from https://pypi.org/pypi/remi/json
-sha256  2a32658146b63d33a88aff7362679873c9df9e42a9e651c9e6642da834b3cca1  remi-2020.11.20.tar.gz
+sha256  c8691f007dc30b91013131b6aded3521c17ef8ec9fdd152a0ad481b8cb793f14  remi-2021.3.2.tar.gz
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index 5666733986..609e127cf0 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = 2020.11.20
+PYTHON_REMI_VERSION = 2021.3.2
 PYTHON_REMI_SOURCE = remi-$(PYTHON_REMI_VERSION).tar.gz
-PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/47/45/3110334859199be84d9b230fd31e2333b4c69832e15facc0868bed2aa3f3
+PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/c0/99/94bd825cf8baee369b959f76c802a51ccc69d4d62ec113e26db4835f710c
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_SETUP_TYPE = setuptools
 
