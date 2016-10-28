From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 14:44:22 +0200
Subject: [Buildroot] [git commit] package/gpm: indentation cleanup
Message-ID: <20161028124448.D75457FCA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=718b7ebb43c82a0879ef098d44bbdb856a3a5fdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpm/gpm.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index 6d3b5d2..ed4c1fd 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -15,8 +15,9 @@ GPM_DEPENDENCIES = host-bison
 # if not already installed in staging dir, gpm Makefile may fail to find some
 # of the headers needed to generate build dependencies, the first time it is
 # built. CPPFLAGS is used to pass the right include path to dependency rules.
-GPM_CONF_ENV = CPPFLAGS="$(TARGET_CPPFLAGS) -I$(@D)/src/headers/" \
-			   ac_cv_path_emacs=no
+GPM_CONF_ENV = \
+	CPPFLAGS="$(TARGET_CPPFLAGS) -I$(@D)/src/headers/" \
+	ac_cv_path_emacs=no
 
 # For some reason, Microblaze gcc does not define __ELF__, which gpm
 # configure script uses to determine whether the architecture uses ELF
