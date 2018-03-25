From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 22:25:41 +0200
Subject: [Buildroot] [git commit] python-decorator: update to add host
 package
Message-ID: <20180325204153.BC45483B85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=300e335a2dc40a45fc993deca020062824c08705
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to add host package for python decorator

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-decorator/python-decorator.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index c0c43f6096..3802f3dc16 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -11,3 +11,4 @@ PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
