From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 10:41:57 +0100
Subject: [Buildroot] [git commit] python-psycopg2: bump to version 2.7.7
Message-ID: <20190127095108.59E3083BE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e05e274148bf9bc7133779f99bd04122d8df3674
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index 5dedd61abc..c6e199769b 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5	9e7d6f695fc7f8d1c42a7905449246c9  psycopg2-2.7.5.tar.gz
-sha256	eccf962d41ca46e6326b97c8fe0a6687b58dfc1a5f6540ed071ff1474cea749e  psycopg2-2.7.5.tar.gz
+md5	598e2f43c1b26361ae2d3a3254dae414  psycopg2-2.7.7.tar.gz
+sha256	f4526d078aedd5187d0508aa5f9a01eae6a48a470ed678406da94b4cd6524b7e  psycopg2-2.7.7.tar.gz
 # Locally computed sha256 checksums
 sha256	3c2b037df24cb85ca1a48739dcab60a5037644b436f87173f6db0d101636b525  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index c8c328d801..e297d6e2b2 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.7.5
+PYTHON_PSYCOPG2_VERSION = 2.7.7
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/b2/c1/7bf6c464e903ffc4f3f5907c389e5a4199666bf57f6cd6bf46c17912a1f9
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/63/54/c039eb0f46f9a9406b59a638415c2012ad7be9b4b97bfddb1f48c280df3a
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
