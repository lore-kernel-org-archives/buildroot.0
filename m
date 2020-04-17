From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 21:42:02 +0200
Subject: [Buildroot] [git commit] package/python-psycopg2: bump to version
 2.8.5
Message-ID: <20200417192946.88ED98EEBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfc1bebd03701e4c485f93deeb52b65db24a5ead
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psycopg2/python-psycopg2.hash | 6 +++---
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index 5f98e359be..bf73f8ad25 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5	dbb5a67dd57cfa905de37ab9678a92f6  psycopg2-2.8.4.tar.gz
-sha256	f898e5cc0a662a9e12bde6f931263a1bbd350cfb18e1d5336a12927851825bb6  psycopg2-2.8.4.tar.gz
+md5  c232ff3e3bfee35e1a0e15bc089cb294  psycopg2-2.8.5.tar.gz
+sha256  f7d46240f7a1ae1dd95aab38bd74f7428d46531f69219954266d669da60c0818  psycopg2-2.8.5.tar.gz
 # Locally computed sha256 checksums
-sha256	9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
+sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index a32099e3b9..b6f1f6ab70 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.8.4
+PYTHON_PSYCOPG2_VERSION = 2.8.5
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/84/d7/6a93c99b5ba4d4d22daa3928b983cec66df4536ca50b22ce5dcac65e4e71
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/a8/8f/1c5690eebf148d1d1554fc00ccf9101e134636553dbb75bdfef4f85d7647
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
