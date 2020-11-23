From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2020 20:20:16 -0700
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-remotes: bump to
 version 1.0.0
Message-ID: <20201123032016.2045121-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License hash changed due to year update.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-remotes/python-aiohttp-remotes.hash | 6 +++---
 package/python-aiohttp-remotes/python-aiohttp-remotes.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
index 069cdeda1f..a9a6cad2df 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-remotes/json
-md5	70213413433ece4e2110ae90a070d279  aiohttp_remotes-0.1.2.tar.gz
-sha256	43c3f7e1c5ba27f29fb4dbde5d43b900b5b5fc7e37bf7e35e6eaedabaec4a3fc  aiohttp_remotes-0.1.2.tar.gz
+md5  e90fad4b7aa088207f831698fddd9eea  aiohttp_remotes-1.0.0.tar.gz
+sha256  caec1681de70bac82daa676078d9b125758fb3952fdaa893a6b42bdd995562ef  aiohttp_remotes-1.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	5240758b8a5c34a46c166294eaae7dc7034ec45c727fce889c9abf7ef5afc158  LICENSE
+sha256  4e7d0edf250abe2a28027788b8c55a53d1b5c9ff961b8a00643c76aed637ba13  LICENSE
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
index 5b38ae9112..f04cecd89d 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_REMOTES_VERSION = 0.1.2
+PYTHON_AIOHTTP_REMOTES_VERSION = 1.0.0
 PYTHON_AIOHTTP_REMOTES_SOURCE = aiohttp_remotes-$(PYTHON_AIOHTTP_REMOTES_VERSION).tar.gz
-PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/cd/2f/93e9198a01485f588d12e19c87cd277542dc28d8b31dc8e1c09fa1c75548
+PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/40/b6/1178bd1e26e88f9f29b7d1bbfae7b38d39ec9cf787d4685f83ade2e7aa7f
 PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = distutils
 PYTHON_AIOHTTP_REMOTES_LICENSE = MIT
 PYTHON_AIOHTTP_REMOTES_LICENSE_FILES = LICENSE
-- 
2.25.1
