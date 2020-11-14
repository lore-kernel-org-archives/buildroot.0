From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 14:11:53 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/bandwidthd: add
 license file
Message-ID: <20201114125939.3D51C82A17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b38cc29ec19432477d27f964b887df32dd7732ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Use README as the license file until upstream provides one:
https://github.com/nroach44/bandwidthd/issues/2

While at it, also update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ffc3d6c240bc98ee6c1500286cca6c499785225d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bandwidthd/bandwidthd.hash | 3 ++-
 package/bandwidthd/bandwidthd.mk   | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/bandwidthd/bandwidthd.hash b/package/bandwidthd/bandwidthd.hash
index c73584de2e..5b1bbce978 100644
--- a/package/bandwidthd/bandwidthd.hash
+++ b/package/bandwidthd/bandwidthd.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 0270d0def6cc53c8d47d59a9dd093d51fbca1620adeef85c15e35a32010e26ab  bandwidthd-2.0.1-auto-r11.tar.gz
+sha256  0270d0def6cc53c8d47d59a9dd093d51fbca1620adeef85c15e35a32010e26ab  bandwidthd-2.0.1-auto-r11.tar.gz
+sha256  58573c40770e0c0b91f3eef8192952832321a344f66a4fb2d966095cbbfc86c2  README
diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
index 990d8c5d8f..88222a910e 100644
--- a/package/bandwidthd/bandwidthd.mk
+++ b/package/bandwidthd/bandwidthd.mk
@@ -10,6 +10,7 @@ BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,v$(BANDWIDTHD_VERSION))
 # Specified as "any version of the GPL that is current as of your
 # download" by upstream.
 BANDWIDTHD_LICENSE = GPL
+BANDWIDTHD_LICENSE_FILES = README
 
 BANDWIDTHD_DEPENDENCIES = gd libpng libpcap host-pkgconf
 
