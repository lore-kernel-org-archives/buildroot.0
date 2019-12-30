From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Dec 2019 22:53:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pyqt5: add hash for license
 file
Message-ID: <20191230215317.1488365-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.24.0
