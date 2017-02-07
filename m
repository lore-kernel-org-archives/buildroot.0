From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 14:25:23 +0100
Subject: [Buildroot] [git commit] python-service-identity: bump version to
	16.0.0
Message-ID: <20170207132545.C6AC981926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c03f112b63327409c6ebb301d2fa8d873233e0da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-service-identity/python-service-identity.hash | 6 +++---
 package/python-service-identity/python-service-identity.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index caf29dc..09561d8 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=cea0b0156d73b025ecef660fb51f0d9a, sha256 locally computed.
-md5	cea0b0156d73b025ecef660fb51f0d9a  service_identity-14.0.0.tar.gz
-sha256	3105a319a7c558490666694f599be0c377ad54824eefb404cde4ce49e74a4f5a  service_identity-14.0.0.tar.gz
+# md5 from https://pypi.python.org/pypi/service_identity/json, sha256 locally computed
+md5	d52392597b9c44a740abf322bfdb21e6  service_identity-16.0.0.tar.gz
+sha256	0630e222f59f91f3db498be46b1d879ff220955d7bbad719a5cb9ad14e3c3036  service_identity-16.0.0.tar.gz
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 9eca3c1..88549ab 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 14.0.0
+PYTHON_SERVICE_IDENTITY_VERSION = 16.0.0
 PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = http://pypi.python.org/packages/source/s/service_identity
+PYTHON_SERVICE_IDENTITY_SITE = https://pypi.python.org/packages/f3/2a/7c04e7ab74f9f2be026745a9ffa81fd9d56139fa6f5f4b4c8a8c07b2bfba
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
