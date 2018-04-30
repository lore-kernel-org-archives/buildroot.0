From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:03:11 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/tcllib: update
 license to SPDX format
Message-ID: <20180501073416.7C289890BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d4f5dbafae8b99897bd3ee5389296b09ca35208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

While at it add the license file hash.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2c82d7c605e53d3687ff63f31e135ec7ce92ea05)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcllib/tcllib.hash | 1 +
 package/tcllib/tcllib.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/tcllib/tcllib.hash b/package/tcllib/tcllib.hash
index eb990a2aba..d08b5a172a 100644
--- a/package/tcllib/tcllib.hash
+++ b/package/tcllib/tcllib.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  0db9e17d6c0f44d3ca2df2ea5023e35c0f3767e7008c3cb26d201446eb68add1  tcllib-1.13.tar.bz2
+sha256  530ec70eb11a455bd582d86b6d74c2dd7cc367d90b8bbdd59fcb43ae02f95a4b  license.terms
diff --git a/package/tcllib/tcllib.mk b/package/tcllib/tcllib.mk
index bd98dd641e..dfa35c8941 100644
--- a/package/tcllib/tcllib.mk
+++ b/package/tcllib/tcllib.mk
@@ -7,7 +7,7 @@
 TCLLIB_VERSION = 1.13
 TCLLIB_SOURCE = tcllib-$(TCLLIB_VERSION).tar.bz2
 TCLLIB_SITE = http://downloads.sourceforge.net/project/tcllib/tcllib/$(TCLLIB_VERSION)
-TCLLIB_LICENSE = tcl license
+TCLLIB_LICENSE = TCL
 TCLLIB_LICENSE_FILES = license.terms
 TCLLIB_DEPENDENCIES = host-tcl
 TCLLIB_CONF_ENV = ac_cv_path_tclsh="$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)"
