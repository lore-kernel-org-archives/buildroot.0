From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 25 May 2017 11:05:43 +0100
Subject: [Buildroot] [PATCH next 2/2] python-service-identity: bump version
	to 17.0.0
In-Reply-To: <20170525100543.889-1-Vincent.Riera@imgtec.com>
References: <20170525100543.889-1-Vincent.Riera@imgtec.com>
Message-ID: <20170525100543.889-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/python-service-identity/python-service-identity.hash | 4 ++--
 package/python-service-identity/python-service-identity.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index 09561d8f9..7caaaf99e 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/service_identity/json, sha256 locally computed
-md5	d52392597b9c44a740abf322bfdb21e6  service_identity-16.0.0.tar.gz
-sha256	0630e222f59f91f3db498be46b1d879ff220955d7bbad719a5cb9ad14e3c3036  service_identity-16.0.0.tar.gz
+md5 f509cb41ca2f8420bd8496291136d6cc  service_identity-17.0.0.tar.gz
+sha256 4001fbb3da19e0df22c47a06d29681a398473af4aa9d745eca525b3b2c2302ab  service_identity-17.0.0.tar.gz
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 88549abff..ccc6e71ac 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 16.0.0
+PYTHON_SERVICE_IDENTITY_VERSION = 17.0.0
 PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://pypi.python.org/packages/f3/2a/7c04e7ab74f9f2be026745a9ffa81fd9d56139fa6f5f4b4c8a8c07b2bfba
+PYTHON_SERVICE_IDENTITY_SITE = https://pypi.python.org/packages/de/2a/cab6e30be82c8fcd2339ef618036720eda954cf05daef514e386661c9221
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
-- 
2.13.0
