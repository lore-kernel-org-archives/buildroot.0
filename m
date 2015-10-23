From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 23 Oct 2015 12:03:48 +0100
Subject: [Buildroot] [PATCH 2/2] supervisor: fix license
In-Reply-To: <1445598228-6675-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1445598228-6675-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1445598228-6675-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/supervisor/supervisor.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index d3c250f..5e0fa53 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -6,7 +6,8 @@
 
 SUPERVISOR_VERSION = 3.1.3
 SUPERVISOR_SITE = http://pypi.python.org/packages/source/s/supervisor
-SUPERVISOR_LICENSE_FILES = LICENSES.txt
+SUPERVISOR_LICENSE = repoze, BSD based, rdflib (http_client.py), PSF (medusa), ZPL-2.1
+SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
 SUPERVISOR_SETUP_TYPE = setuptools
 
 define SUPERVISOR_INSTALL_CONF_FILES
-- 
1.7.1
