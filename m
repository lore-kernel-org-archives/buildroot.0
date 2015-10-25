From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:50:00 +0100
Subject: [Buildroot] [git commit] supervisor: fix license
Message-ID: <20151025205127.B66487FA0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3da84b2c4d4f291c8e3c547f21c41aeb905e23ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Tweak description of repoze license]
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supervisor/supervisor.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index d3c250f..4c62b66 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -6,7 +6,8 @@
 
 SUPERVISOR_VERSION = 3.1.3
 SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor
-SUPERVISOR_LICENSE_FILES = LICENSES.txt
+SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa), ZPL-2.1
+SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
 SUPERVISOR_SETUP_TYPE = setuptools
 
 define SUPERVISOR_INSTALL_CONF_FILES
