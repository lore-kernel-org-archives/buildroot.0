From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Thu,  3 Sep 2015 09:55:21 +0200
Subject: [Buildroot] [PATCH v2 1/6] python-urwid: bump version and add
	checksums
Message-ID: <1441266926-2942-1-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>

---
Changes since v1:
 * Change hash URL from PyPI as suggested by Baruch Siach

---
 package/python-urwid/python-urwid.hash | 3 +++
 package/python-urwid/python-urwid.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/python-urwid/python-urwid.hash

diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
new file mode 100644
index 0000000..eceed9d
--- /dev/null
+++ b/package/python-urwid/python-urwid.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi/urwid/1.3.0, sha256 locally computed
+md5	a989acd54f4ff1a554add464803a9175  urwid-1.3.0.tar.gz
+sha256	29f04fad3bf0a79c5491f7ebec2d50fa086e9d16359896c9204c6a92bc07aba2  urwid-1.3.0.tar.gz
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index 4f1be46..1cd3022 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 1.2.1
+PYTHON_URWID_VERSION = 1.3.0
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
 PYTHON_URWID_SITE = https://pypi.python.org/packages/source/u/urwid
 PYTHON_URWID_LICENSE = LGPLv2.1+
-- 
2.5.0
