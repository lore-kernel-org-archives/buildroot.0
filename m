From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 21:58:17 +0100
Subject: [Buildroot] [git commit] python-requests-toolbelt: bump to version
	0.7.1
Message-ID: <20170302205924.959737FECB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cbb1c50cd96922eed11046eb591be9d276c6ae6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-requests-toolbelt/python-requests-toolbelt.hash | 6 +++---
 package/python-requests-toolbelt/python-requests-toolbelt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.hash b/package/python-requests-toolbelt/python-requests-toolbelt.hash
index 89f5ca1..75343b0 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.hash
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/requests-toolbelt/json, sha256 locally computed
-md5	bfe2009905f460f4764c32cfbbf4205f  requests-toolbelt-0.7.0.tar.gz
-sha256	33899d4a559c3f0f5e9fbc115d337c4236febdc083755a160a4132d92fc3c91a  requests-toolbelt-0.7.0.tar.gz
+# md5 from https://pypi.python.org/pypi/requests_toolbelt/json, sha256 locally computed
+md5 be245e2093a9610fb2eb399afc063ad2 requests-toolbelt-0.7.1.tar.gz
+sha256 c3843884269d79e492522f3e9f490917e074c1ddbb80111968970e721fe36eaf requests-toolbelt-0.7.1.tar.gz
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.mk b/package/python-requests-toolbelt/python-requests-toolbelt.mk
index 2e944c0..ce1d958 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.mk
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_TOOLBELT_VERSION = 0.7.0
+PYTHON_REQUESTS_TOOLBELT_VERSION = 0.7.1
 PYTHON_REQUESTS_TOOLBELT_SOURCE = requests-toolbelt-$(PYTHON_REQUESTS_TOOLBELT_VERSION).tar.gz
-PYTHON_REQUESTS_TOOLBELT_SITE = https://pypi.python.org/packages/59/78/1d391d30ebf74079a8e4de6ab66fdca5362903ef2df64496f4697e9bb626
+PYTHON_REQUESTS_TOOLBELT_SITE = https://pypi.python.org/packages/ab/bf/2af6b25f880e2d529a524f98837d33b1048a2a15703fc4806185b54e9672
 PYTHON_REQUESTS_TOOLBELT_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_TOOLBELT_LICENSE = Apache-2.0
 PYTHON_REQUESTS_TOOLBELT_LICENSE_FILES = LICENSE
