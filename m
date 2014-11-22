From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:25:47 +0100
Subject: [Buildroot] [git commit] omniorb: bump to version 4.2.0
Message-ID: <20141201104837.8EEA97FFF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4fc94a76cc6b51ec589accfeee65bed405db028c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a hash file.

The release announcement
(http://www.omniorb-support.com/pipermail/omniorb-list/2014-April/031550.html)
mentions support for python3, but I could not make it work. Stay with python2
for now.

Cc: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/omniorb/omniorb.hash |    3 +++
 package/omniorb/omniorb.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/omniorb/omniorb.hash b/package/omniorb/omniorb.hash
new file mode 100644
index 0000000..d087d95
--- /dev/null
+++ b/package/omniorb/omniorb.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/omniorb/files/omniORB/omniORB-4.2.0/
+sha1	cc52c636f4f329e0481d6bb97b1f0a4bfb21fb3d	omniORB-4.2.0.tar.bz2
+md5	f1e104d0a2df92829c1b37a853f4805d	omniORB-4.2.0.tar.bz2
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index f336c4b..0df125e 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMNIORB_VERSION = 4.1.6
+OMNIORB_VERSION = 4.2.0
 OMNIORB_SITE = http://downloads.sourceforge.net/project/omniorb/omniORB/omniORB-$(OMNIORB_VERSION)
 OMNIORB_SOURCE = omniORB-$(OMNIORB_VERSION).tar.bz2
 OMNIORB_INSTALL_STAGING = YES
