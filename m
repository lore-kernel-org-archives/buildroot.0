From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:42:07 +0200
Subject: [Buildroot] [git commit] python-pylibftdi: use package name for .mk
	file
Message-ID: <20170406204348.6536E8274E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=729f4701db83b2aa702369e8769a4e45fad0f725
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found using [1]:
check-package --include-only TypoInPackageVariable $(find * -type f)
and manually fixed.

[1] http://patchwork.ozlabs.org/patch/729672/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pylibftdi/{python-libftdi.mk => python-pylibftdi.mk} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pylibftdi/python-libftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
similarity index 96%
rename from package/python-pylibftdi/python-libftdi.mk
rename to package/python-pylibftdi/python-pylibftdi.mk
index b375abb..0a5887b 100644
--- a/package/python-pylibftdi/python-libftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-# python-libftdi
+# python-pylibftdi
 #
 ################################################################################
 
