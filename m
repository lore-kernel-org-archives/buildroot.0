From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 13:30:10 +0100
Subject: [Buildroot] [git commit] moarvm: bump version to 2017.02
Message-ID: <20170315123843.828CB8222F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=138c59049e53a88f0f1f35f7cb43dc0e68bcab04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index e6335ab..c68f6f9 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2074693a42a7f31218bf69b70fd5b73d6fd1a1d0e31eaf3f528e204963e94c53  MoarVM-2017.01.tar.gz
+sha256 3a486ca5d19a8e6256e379655ec9ed09ff2f1c4f6a57a7969a278819b5bcb4eb  MoarVM-2017.02.tar.gz
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index b459474..3f0eaff 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2017.01
+MOARVM_VERSION = 2017.02
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
