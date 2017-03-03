From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 08:40:04 +0100
Subject: [Buildroot] [git commit] python-pyasn: update homepage link
Message-ID: <20170303074059.C62EB81D4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bdeb115f480ab6c7be603a8450b992978cf4e34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyasn/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
index 997b737..2396194 100644
--- a/package/python-pyasn/Config.in
+++ b/package/python-pyasn/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PYTHON_PYASN
 	  perform very fast IP address to Autonomous System Number
 	  lookups.
 
-	  https://code.google.com/p/pyasn/
+	  https://github.com/hadiasghari/pyasn
 
 comment "python-pyasn needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
