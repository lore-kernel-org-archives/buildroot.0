From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 16:59:17 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/python-validators: fix license
Message-ID: <20200716150405.E802F814ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a7c7e14a67915334492d73763c9bce853365d46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The LICENSE file is MIT, not BSD.  The confusion comes from the license info
in setup.py, which stated BSD until (post-0.14.2):

https://github.com/kvesteri/validators/commit/669129a3d3eb106e1b2d82bd9911faebb3287db6

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d682a3aeb9e3cc684e2dc6c2221a820bd4c08179)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-validators/python-validators.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index e24ce35fdd..594c1d26e5 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -8,7 +8,7 @@ PYTHON_VALIDATORS_VERSION = 0.14.2
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
 PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/4d/56/9b48c918ef118ea12b90f227c4498ed4703b418bdd8fb49479dfcbeae4ef
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
-PYTHON_VALIDATORS_LICENSE = BSD
+PYTHON_VALIDATORS_LICENSE = MIT
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
