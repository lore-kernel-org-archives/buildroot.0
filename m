From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2015 22:27:20 -0000
Subject: [Buildroot] [git commit] httping: bump to version 2.4
Message-ID: <20150302222718.CA213807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0514d8f0426b0cc228e89cdf891532ba220faff2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/httping/httping.hash |    2 ++
 package/httping/httping.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/httping/httping.hash b/package/httping/httping.hash
new file mode 100644
index 0000000..0368f75
--- /dev/null
+++ b/package/httping/httping.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	dab59f02b08bfbbc978c005bb16d2db6fe21e1fc841fde96af3d497ddfc82084	httping-2.4.tgz
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index e868463..7e76090 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTTPING_VERSION = 2.3.4
+HTTPING_VERSION = 2.4
 HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
 HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPLv2
