From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 17:00:46 +0200
Subject: [Buildroot] [git commit] package/python-request-id: bump to version
 1.0
Message-ID: <20191005150350.6E3BC80E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbb7c640441e4fee96b8e4971b4ca3ade67101e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-request-id/python-request-id.hash | 4 ++--
 package/python-request-id/python-request-id.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-request-id/python-request-id.hash b/package/python-request-id/python-request-id.hash
index f412502b94..ecf9d6508d 100644
--- a/package/python-request-id/python-request-id.hash
+++ b/package/python-request-id/python-request-id.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/request-id/json
-md5	29cdbb13f26c0e944e58cfbebfc52085  request-id-0.3.1.tar.gz
-sha256	4c8adff44ad6779305d5493f780400aff5ff5139e98d622379c0e0797b58d812  request-id-0.3.1.tar.gz
+md5	81d6159edc745384181cb97f045c51b4  request-id-1.0.tar.gz
+sha256	4928002c8e4c767f3f8319194c9f3080ff98f14cabf44c0674a81ee58ec20fc4  request-id-1.0.tar.gz
 # Locally computed sha256 checksums
 sha256	2d65d17b4df34f184557b8031df05e4c264d2fa6b82e560be074967eff3b326c  LICENSE.txt
diff --git a/package/python-request-id/python-request-id.mk b/package/python-request-id/python-request-id.mk
index 96601b9750..4812e53c72 100644
--- a/package/python-request-id/python-request-id.mk
+++ b/package/python-request-id/python-request-id.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUEST_ID_VERSION = 0.3.1
+PYTHON_REQUEST_ID_VERSION = 1.0
 PYTHON_REQUEST_ID_SOURCE = request-id-$(PYTHON_REQUEST_ID_VERSION).tar.gz
-PYTHON_REQUEST_ID_SITE = https://files.pythonhosted.org/packages/2e/d4/bbe8cdd41012ba54d453452837101cecbb4151866b8aab6ca1ffb00d398c
+PYTHON_REQUEST_ID_SITE = https://files.pythonhosted.org/packages/bc/b6/ade909d4af3dffe492789d36ea58a0ecbd637f8200bc480b282d455fe497
 PYTHON_REQUEST_ID_SETUP_TYPE = setuptools
 PYTHON_REQUEST_ID_LICENSE = MIT
 PYTHON_REQUEST_ID_LICENSE_FILES = LICENSE.txt
