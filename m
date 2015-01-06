From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:13:47 +0100
Subject: [Buildroot] [git commit] poppler: security bump to version 0.24.5
Message-ID: <20150106201413.D85A980797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69e26b0e6db5f8952c755b4cc06436b0e2dc538d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2013-7296 - JBIG2Stream::readSegments()" Denial of Service
Vulnerability.

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poppler/poppler.hash |    2 ++
 package/poppler/poppler.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
new file mode 100644
index 0000000..f3225bc
--- /dev/null
+++ b/package/poppler/poppler.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	a2654910100c923c44e366242495e226db2798254f2fa2781138867348759f84	poppler-0.24.5.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index a972325..2ac7e64 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.24.4
+POPPLER_VERSION = 0.24.5
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig
