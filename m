From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 16 Jul 2019 11:37:09 -0400
Subject: [Buildroot] [PATCH 1/1] package/python-psycopg2: bump to version
 2.8.3
In-Reply-To: <20190716153709.19420-1-aduskett@gmail.com>
References: <20190716153709.19420-1-aduskett@gmail.com>
Message-ID: <20190716153709.19420-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index 2711b10627..d53977d059 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5	74cbe0f09a6ebafd107f89c858120bd5  psycopg2-2.8.2.tar.gz
-sha256	5cacf21b6f813c239f100ef78a4132056f93a5940219ec25d2ef833cbeb05588  psycopg2-2.8.2.tar.gz
+md5	bc00aa77595c03af7d68876ceb74ef77  psycopg2-2.8.3.tar.gz
+sha256	897a6e838319b4bf648a574afb6cabcb17d0488f8c7195100d48d872419f4457  psycopg2-2.8.3.tar.gz
 # Locally computed sha256 checksums
 sha256	9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index a3548a27fa..b49fbd86fc 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.8.2
+PYTHON_PSYCOPG2_VERSION = 2.8.3
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/23/7e/93c325482c328619870b6cd09370f6dbe1148283daca65115cd63642e60f
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/5c/1c/6997288da181277a0c29bc39a5f9143ff20b8c99f2a7d059cfb55163e165
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
-- 
2.21.0
