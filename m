From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Jun 2017 12:02:43 +0100
Subject: [Buildroot] [PATCH 2/2] python-pytablewriter: bump version to 0.19.9
In-Reply-To: <20170602110243.6169-1-Vincent.Riera@imgtec.com>
References: <20170602110243.6169-1-Vincent.Riera@imgtec.com>
Message-ID: <20170602110243.6169-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 533d21a5b..2987a08d4 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
-md5 a2d3fe29adc7708ce986646f41c1d229  pytablewriter-0.19.8.tar.gz
-sha256 b76cb1591504ed1dcdc14ccf383806f45e2027bd72d844e545c6a0d18552d46c  pytablewriter-0.19.8.tar.gz
+md5 f45f065cad97c00aaeb72db6768ff6e5  pytablewriter-0.19.9.tar.gz
+sha256 00f657b656267945d565488f1676d91f22d90748a0a06dd94d513a551e4c12d9  pytablewriter-0.19.9.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index ddbc17bed..1602526c7 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.19.8
+PYTHON_PYTABLEWRITER_VERSION = 0.19.9
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/9b/89/1883fcd076f40034539f577b033636b20d9a7983a8ba99e9b8ef11b680b2
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/e9/82/0dcdbb1d8386aabda488edc2aa566c1e3c5eaac4415c02f731019be2d0df
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
-- 
2.13.0
