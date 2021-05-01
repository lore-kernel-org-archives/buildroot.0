From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 1 May 2021 16:50:33 +0200
Subject: [Buildroot] [git commit] package/mdevd: bump to version 0.1.4.0
Message-ID: <20210501144021.A279A8650B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92e0f91278bcb109e670c2fadbfe3ee7844323b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.mail-archive.com/skaware at list.skarnet.org/msg01579.html

Signed-off-by: Dick Olsson <hi@senzilla.io>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mdevd/mdevd.hash | 2 +-
 package/mdevd/mdevd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index c3b8fcc921..93950304be 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  be89ab072c4de822a06e26579dcca10e85ae5fd5be23ba903415b4de8fe0fb6a  mdevd-0.1.3.0.tar.gz
+sha256  ffd3b223b4cf0e51253b4a8f09cb88d70bf22693228ab0818af174a3f099dcd2  mdevd-0.1.4.0.tar.gz
 sha256  31b60c66aba1fa0a7f8847339ac35c28638e25ff96da700d995533ad810e3995  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index e2924009f5..89199be801 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDEVD_VERSION = 0.1.3.0
+MDEVD_VERSION = 0.1.4.0
 MDEVD_SITE = http://skarnet.org/software/mdevd
 MDEVD_LICENSE = ISC
 MDEVD_LICENSE_FILES = COPYING
