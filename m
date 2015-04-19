From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 09:46:14 +0200
Subject: [Buildroot] [git commit] vala: requires host-bison
Message-ID: <20150419074626.BD5C180429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d73e19dea303a4aa51bf5fabd138cf193f557a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix typo in commit log.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vala/vala.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 292ea7e..573e1e4 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -11,7 +11,7 @@ VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
 VALA_LICENSE_FILES = COPYING
 
-HOST_VALA_DEPENDENCIES = host-flex host-libglib2
+HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
 # Yes, the autoconf script understands ':' as "xsltproc is not
 # available".
 HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
