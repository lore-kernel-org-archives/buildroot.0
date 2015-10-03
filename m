From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 14:14:11 +0200
Subject: [Buildroot] [git commit] python-urwid: bump version and add
	checksums
Message-ID: <20151003122242.2326D8191C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4de463b78796fc4d6685f79db19afc29bb142846
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-urwid/python-urwid.hash |    3 +++
 package/python-urwid/python-urwid.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
