From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 23:50:01 +0100
Subject: [Buildroot] [git commit] package/uhd: fix typo
Message-ID: <20201117223739.0D49486A95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0cd4a700afd0ea61d9d15ce6844ad7294bf375c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace ENABLE_DPKD by ENABLE_DPDK to fix the following error:

  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    ENABLE_DPKD

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uhd/uhd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index adb7579019..2a40efdd23 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -23,7 +23,7 @@ UHD_CONF_OPTS = \
 	-DRUNTIME_PYTHON_EXECUTABLE=/usr/bin/python \
 	-DENABLE_C_API=ON \
 	-DENABLE_DOXYGEN=OFF \
-	-DENABLE_DPKD=OFF \
+	-DENABLE_DPDK=OFF \
 	-DENABLE_LIBUHD=ON \
 	-DENABLE_N230=OFF \
 	-DENABLE_N300=OFF \
