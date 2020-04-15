From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:36:28 +0200
Subject: [Buildroot] [git commit] package/python-cbor2: needs
 host-python-setuptools-scm
Message-ID: <20200415192340.AB6278776C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef766f56dc76f6c87830844bb60a60ae03c60db8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/124e1e628c78449fbaa027d74ab871b36d782343/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cbor2/python-cbor2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index d504e33d2d..d0cee7e941 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -10,5 +10,6 @@ PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/3e/2c/188d040bd4cf99
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
+PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
