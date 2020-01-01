From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 1 Jan 2020 17:15:32 +0100
Subject: [Buildroot] [git commit] package/python-pyqt5: add hash for license
 file
Message-ID: <20200101160634.57F718EA5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a741402138806296e62e2391f0c8be76e9f84753
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyqt5/python-pyqt5.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-pyqt5/python-pyqt5.hash b/package/python-pyqt5/python-pyqt5.hash
index 2a7d05b49a..8ef467a27b 100644
--- a/package/python-pyqt5/python-pyqt5.hash
+++ b/package/python-pyqt5/python-pyqt5.hash
@@ -1,3 +1,6 @@
 # md5 from http://http://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.7, sha256 locally computed
 md5	e3dc21f31fd714659f0688e1eb31bacf  PyQt5_gpl-5.7.tar.gz
 sha256	892693ba5f79989abb2061dad2d5c4e6f127e9dd3240f73f8220c7152cd35b05  PyQt5_gpl-5.7.tar.gz
+
+# Hash for license file
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
