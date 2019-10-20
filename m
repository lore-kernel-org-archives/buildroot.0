From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Oct 2019 15:38:27 +0200
Subject: [Buildroot] [git commit] package/python-psycopg2: bump to version
 2.8.4
Message-ID: <20191020133507.D715682DE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=553d2599d4785f251ee6ff41b23ca04ab04b02c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index d53977d059..5f98e359be 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5	bc00aa77595c03af7d68876ceb74ef77  psycopg2-2.8.3.tar.gz
-sha256	897a6e838319b4bf648a574afb6cabcb17d0488f8c7195100d48d872419f4457  psycopg2-2.8.3.tar.gz
+md5	dbb5a67dd57cfa905de37ab9678a92f6  psycopg2-2.8.4.tar.gz
+sha256	f898e5cc0a662a9e12bde6f931263a1bbd350cfb18e1d5336a12927851825bb6  psycopg2-2.8.4.tar.gz
 # Locally computed sha256 checksums
 sha256	9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index b49fbd86fc..a32099e3b9 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.8.3
+PYTHON_PSYCOPG2_VERSION = 2.8.4
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/5c/1c/6997288da181277a0c29bc39a5f9143ff20b8c99f2a7d059cfb55163e165
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/84/d7/6a93c99b5ba4d4d22daa3928b983cec66df4536ca50b22ce5dcac65e4e71
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
