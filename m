From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  1 Nov 2019 19:04:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-asgiref: bump to version
 3.2.3
In-Reply-To: <20191101170417.29286-1-asafka7@gmail.com>
References: <20191101170417.29286-1-asafka7@gmail.com>
Message-ID: <20191101170417.29286-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index 527b797473..782a13fe5c 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5	a0d824805f07199ec41a9af6ff69761b  asgiref-3.2.2.tar.gz
-sha256	f62b1c88ebf5fe95db202a372982970edcf375c1513d7e70717df0750f5c2b98  asgiref-3.2.2.tar.gz
+md5	39218c10eee0bf66a3d893491d835e86  asgiref-3.2.3.tar.gz
+sha256	7e06d934a7718bf3975acbf87780ba678957b87c7adc056f13b6215d610695a0  asgiref-3.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 9a1a817c9c..b29903509e 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.2.2
+PYTHON_ASGIREF_VERSION = 3.2.3
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/6a/d8/ac8ccfd9551901413cddcff798e16f219489887ec5db3b163c321dd017c6
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/80/c4/83a01607f2d10024c172097126264c8e00c6a4827b35d631ece9625e6ba2
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
-- 
2.20.1
